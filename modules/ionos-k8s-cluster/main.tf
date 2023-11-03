resource "ionoscloud_k8s_cluster" "cluster" {
  name        = local.cluster_name
  k8s_version = var.k8s_version
  maintenance_window {
    day_of_the_week = var.maintenance_day
    time            = format("%02d:00:00Z", var.maintenance_hour)
  }
  api_subnet_allow_list = local.api_subnet_allow_list
}

#----
#Test Pool 1 scaling
#----

resource "ionoscloud_k8s_node_pool" "nodepool_scaling" {
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}${np.nodepool_index}" => np if np.auto_scaling == true}
  availability_zone = each.value.availabilityzone
  name              = each.key
  k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
  allow_replace     = each.value.allow_node_pool_replacement
  # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
  # it iterates through the list of var.associated_lans and sets the appropriate lan id
  # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
  dynamic "lans" {
    for_each = each.value.associated_lans
    content {
      id = lans.value["id"]
      dynamic "routes" {
        # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
        # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
        for_each = each.value.associated_lans[lans.key].routes_list == null || length(each.value.associated_lans[lans.key].routes_list[0]) == 0 ? [] : each.value.associated_lans[lans.key].routes_list

        content {
          # graps the values from the objects of the routes_list 
          network    = routes.value["network"]
          gateway_ip = routes.value["gateway_ip"]
        }
      }
    }
  }
  #TODO we cant use count.index anymore
  maintenance_window {
    day_of_the_week = (each.value.maintenance_hour + 1 + 1 * 4) < 24 ? each.value.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, each.value.maintenance_day, null)
    time            = format("%02d:00:00Z", (each.value.maintenance_hour + 1 + 1 * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = "SSD"
  node_count     = each.value.node_count
  cores_count    = each.value.core_count
  ram_size       = each.value.ram_size
  storage_size   = 100
  public_ips     = local.public_ip_pools != null ? local.public_ip_pools[each.key] : []

  auto_scaling {
      min_node_count = each.value.min_node_count
      max_node_count = each.value.max_node_count 
  }

  lifecycle {
    ignore_changes = [ node_count ]
  }
}

#----
#Test Pool 2 legacy
#----

resource "ionoscloud_k8s_node_pool" "nodepool_legacy" {
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}${np.nodepool_index}" => np if np.auto_scaling == false}
  availability_zone = each.value.availabilityzone
  #for_each = { for k, v in var.custom_nodepools : k => v if var.auto_scaling }
  #for_each = { for k in compact([for k, v in var.mymap: v.condition ? k : ""]): k => var.mymap[k] }
  #conditional create is just another count, if auto_scaling=true set count to nodepools_per_zone_count
  #for_each = { for pool in var.custom_nodepools : pool.site_name => pool if var.environment != "prod"}
  #count = each.value.nodepool_per_zone_count 
  name              = each.key
  k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
  allow_replace     = var.allow_node_pool_replacement
  # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
  # it iterates through the list of var.associated_lans and sets the appropriate lan id
  # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
  dynamic "lans" {
    for_each = var.associated_lans
    content {
      id = lans.value["id"]
      dynamic "routes" {
        # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
        # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
        for_each = var.associated_lans[lans.key].routes_list == null || length(var.associated_lans[lans.key].routes_list[0]) == 0 ? [] : var.associated_lans[lans.key].routes_list

        content {
          # graps the values from the objects of the routes_list 
          network    = routes.value["network"]
          gateway_ip = routes.value["gateway_ip"]
        }
      }
    }
  }

  maintenance_window {
    day_of_the_week = (each.value.maintenance_hour + 1 + 1 * 4) < 24 ? each.value.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, each.value.maintenance_day, null)
    time            = format("%02d:00:00Z", (each.value.maintenance_hour + 1 + 2 * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = "SSD"
  node_count     = each.value.node_count
  cores_count    = each.value.core_count
  ram_size       = each.value.ram_size
  storage_size   = 100
  public_ips     = local.public_ip_pools != null ? local.public_ip_pools[each.key] : []
}

#----
#Node Pool 1
#----

# resource "ionoscloud_k8s_node_pool" "nodepool_zone1" {
#   count             = local.nodepool_per_zone_count
#   availability_zone = "ZONE_1"
#   name              = "${local.cluster_name}-zone1-nodepool-${count.index}"
#   k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
#   allow_replace     = var.allow_node_pool_replacement
#   # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
#   # it iterates through the list of var.associated_lans and sets the appropriate lan id
#   # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
#   dynamic "lans" {
#     for_each = var.associated_lans
#     content {
#       id = lans.value["id"]
#       dynamic "routes" {
#         # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
#         # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
#         for_each = var.associated_lans[lans.key].routes_list == null || length(var.associated_lans[lans.key].routes_list[0]) == 0 ? [] : var.associated_lans[lans.key].routes_list

#         content {
#           # graps the values from the objects of the routes_list 
#           network    = routes.value["network"]
#           gateway_ip = routes.value["gateway_ip"]
#         }
#       }
#     }
#   }

#   maintenance_window {
#     # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
#     # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
#     # Example:
#     # Maintenance start (local.maintenance_hour): 2am
#     # Control plane (see cluster resource) starts at 2am
#     # Maintenance of ...-zone1-nodepool-0 starts at 3am (+1h)
#     # Maintenance of ...-zone1-nodepool-1 starts at 7am (+4h)
#     # Maintenance of ...-zone1-nodepool-2 starts at 11am (+4h) ...
#     # if the number of hour exceeds 24, the maintenance shall start on the next day
#     day_of_the_week = (local.maintenance_hour + 1 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
#     time            = format("%02d:00:00Z", (local.maintenance_hour + 1 + count.index * 4) % 24)
#   }

#   datacenter_id  = var.datacenter_id
#   k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
#   cpu_family     = local.cpu_family
#   storage_type   = "SSD"
#   node_count     = local.node_count
#   cores_count    = local.core_count
#   ram_size       = local.ram_size
#   storage_size   = 100
#   public_ips     = local.public_ip_pool_zone1 != null ? slice(local.public_ip_pool_zone1[count.index], 0, local.node_count + 1) : []
# }

# #----
# #Node Pool 1 autoscaling
# #node_count adjusted to act as a 2 in 1 nodepool with partially enabled autoscaling activated
# #----

# resource "ionoscloud_k8s_node_pool" "nodepool_zone1_autoscaling" {
#   count             = var.auto_scaling ? 1 : 0
#   availability_zone = "ZONE_1"
#   name              = "${local.cluster_name}-zone1-nodepool-autoscaling-${count.index}"
#   k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
#   allow_replace     = var.allow_node_pool_replacement
#   # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
#   # it iterates through the list of var.associated_lans and sets the appropriate lan id
#   # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
#   dynamic "lans" {
#     for_each = var.associated_lans
#     content {
#       id = lans.value["id"]
#       dynamic "routes" {
#         # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
#         # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
#         for_each = var.associated_lans[lans.key].routes_list == null || length(var.associated_lans[lans.key].routes_list[0]) == 0 ? [] : var.associated_lans[lans.key].routes_list

#         content {
#           # graps the values from the objects of the routes_list 
#           network    = routes.value["network"]
#           gateway_ip = routes.value["gateway_ip"]
#         }
#       }
#     }
#   }

#   maintenance_window {
#     # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
#     # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
#     # Example:
#     # Maintenance start (local.maintenance_hour): 2am
#     # Control plane (see cluster resource) starts at 2am
#     # Maintenance of ...-zone1-nodepool-0 starts at 3am (+1h)
#     # Maintenance of ...-zone1-nodepool-1 starts at 7am (+4h)
#     # Maintenance of ...-zone1-nodepool-2 starts at 11am (+4h) ...
#     # if the number of hour exceeds 24, the maintenance shall start on the next day
#     day_of_the_week = (local.maintenance_hour + 1 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
#     time            = format("%02d:00:00Z", (local.maintenance_hour + 1 + count.index * 4) % 24)
#   }

#   datacenter_id  = var.datacenter_id
#   k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
#   cpu_family     = local.cpu_family
#   storage_type   = "SSD"
#   auto_scaling{
#     min_node_count = 1
#     max_node_count = var.max_node_count - local.node_count
#   }
#   node_count     = local.node_count
#   cores_count    = local.core_count
#   ram_size       = local.ram_size
#   storage_size   = 100
#   public_ips     = local.public_ip_pool_zone1 != null ? slice(local.public_ip_pool_zone1[count.index], 0, local.node_count + 1) : []
#   #Ignore node count changes because of autoscaling to avoid unneeded updates
#   lifecycle {
#     ignore_changes = [
#       node_count
#     ]
#   }
# }

# #----
# #Node Pool 2
# #----

# resource "ionoscloud_k8s_node_pool" "nodepool_zone2" {
#   count = local.nodepool_per_zone_count

#   availability_zone = "ZONE_2"
#   name              = "${local.cluster_name}-zone2-nodepool-${count.index}"
#   k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
#   allow_replace     = var.allow_node_pool_replacement
#   # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
#   # it iterates through the list of var.associated_lans and sets the appropriate lan id
#   # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
#   dynamic "lans" {
#     for_each = var.associated_lans
#     content {
#       id = lans.value["id"]
#       dynamic "routes" {
#         # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
#         # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
#         for_each = var.associated_lans[lans.key].routes_list == null || length(var.associated_lans[lans.key].routes_list[0]) == 0 ? [] : var.associated_lans[lans.key].routes_list

#         content {
#           # graps the values from the objects of the routes_list 
#           network    = routes.value["network"]
#           gateway_ip = routes.value["gateway_ip"]
#         }
#       }
#     }
#   }

#   maintenance_window {
#     # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
#     # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
#     # Additionally the zones are shifted by 2 hours, so this one starts 2 hours later
#     # Example:
#     # Maintenance start (local.maintenance_hour): 2am
#     # Control plane (see cluster resource) starts at 2am
#     # Zone1 (see nodepool_zone1 resource) starts at 3am (+1h)
#     # Maintenance of ...-zone2-nodepool-0 starts at 5am (+2h)
#     # Maintenance of ...-zone2-nodepool-1 starts at 9am (+4h)
#     # Maintenance of ...-zone2-nodepool-2 starts at 1pm (+4h) ...
#     # if the number of hour exceeds 24, the maintenance shall start on the next day
#     day_of_the_week = (local.maintenance_hour + 1 + 2 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
#     time            = format("%02d:00:00Z", (local.maintenance_hour + 1 + 2 + count.index * 4) % 24)
#   }

#   datacenter_id  = var.datacenter_id
#   k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
#   cpu_family     = local.cpu_family
#   storage_type   = "SSD"
#   node_count     = local.node_count
#   cores_count    = local.core_count
#   ram_size       = local.ram_size
#   storage_size   = 100
#   public_ips     = local.public_ip_pool_zone2 != null ? slice(local.public_ip_pool_zone2[count.index], 0, local.node_count + 1) : []
# }

# #----
# #Node Pool 2 autoscaling
# #node_count adjusted to act as a 2 in 1 nodepool with partially enabled autoscaling activated
# #----

# resource "ionoscloud_k8s_node_pool" "nodepool_zone2_autoscaling" {
#   count = var.auto_scaling ? 1 : 0

#   availability_zone = "ZONE_2"
#   name              = "${local.cluster_name}-zone2-nodepool-autoscaling-${count.index}"
#   k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version
#   allow_replace     = var.allow_node_pool_replacement
#   # the lans are created as a dynamic block - they help to dynamically construct repeatable nested blocks
#   # it iterates through the list of var.associated_lans and sets the appropriate lan id
#   # it also sets one or multiple route to the lan, if a not empty entry exists in routes_list(var.associated_lans)
#   dynamic "lans" {
#     for_each = var.associated_lans
#     content {
#       id = lans.value["id"]
#       dynamic "routes" {
#         # if there is an entry in the routes_list, iterate through the values in the routes_list to create the routes 
#         # lans.key = works like count.index, returns the iteration number of current lan -> 0,1,2,3,4...
#         for_each = var.associated_lans[lans.key].routes_list == null || length(var.associated_lans[lans.key].routes_list[0]) == 0 ? [] : var.associated_lans[lans.key].routes_list

#         content {
#           # graps the values from the objects of the routes_list 
#           network    = routes.value["network"]
#           gateway_ip = routes.value["gateway_ip"]
#         }
#       }
#     }
#   }

#   maintenance_window {
#     # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
#     # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
#     # Additionally the zones are shifted by 2 hours, so this one starts 2 hours later
#     # Example:
#     # Maintenance start (local.maintenance_hour): 2am
#     # Control plane (see cluster resource) starts at 2am
#     # Zone1 (see nodepool_zone1 resource) starts at 3am (+1h)
#     # Maintenance of ...-zone2-nodepool-0 starts at 5am (+2h)
#     # Maintenance of ...-zone2-nodepool-1 starts at 9am (+4h)
#     # Maintenance of ...-zone2-nodepool-2 starts at 1pm (+4h) ...
#     # if the number of hour exceeds 24, the maintenance shall start on the next day
#     day_of_the_week = (local.maintenance_hour + 1 + 2 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
#     time            = format("%02d:00:00Z", (local.maintenance_hour + 1 + 2 + count.index * 4) % 24)
#   }

#   datacenter_id  = var.datacenter_id
#   k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
#   cpu_family     = local.cpu_family
#   storage_type   = "SSD"
#   auto_scaling{
#     min_node_count = 1
#     max_node_count = var.max_node_count - local.node_count
#   }
#   node_count     = local.node_count
#   cores_count    = local.core_count
#   ram_size       = local.ram_size
#   storage_size   = 100
#   public_ips     = local.public_ip_pool_legacy != null ? slice(local.public_ip_pool_legacy[index(keys(local.nodepool_per_zone_creator), each.key)], 0, each.value.node_count + 1) : []
#   #Ignore node count changes because of autoscaling to avoid unneeded updates
#   lifecycle {
#     ignore_changes = [
#       node_count
#     ]
#   }
# }

resource "ionoscloud_ipblock" "ippools_scaling" {
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}${np.nodepool_index}" => np }
  name     = each.key
  location = var.datacenter_location
  size     = each.value.auto_scaling ? each.value.max_node_count + 1 : each.value.node_count + 1
}

# resource "ionoscloud_ipblock" "ippools_legacy" {
#   for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}${np.nodepool_index}" => np if np.auto_scaling == false}
#   #count    = var.create_public_ip_pools ? var.nodepool_per_zone_count : 0
#   name     = each.key
#   location = var.datacenter_location
#   size     = each.value.node_count + 1
# }
