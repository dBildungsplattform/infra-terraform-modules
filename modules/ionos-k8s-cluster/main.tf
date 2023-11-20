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
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}-${np.nodepool_index}" => np if np.auto_scaling == true}
  availability_zone = each.value.availability_zone
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
  #TODO we cant use count.index anymore and need a proper solution: + 1 + count.index * 4
  maintenance_window {
    day_of_the_week = (each.value.maintenance_hour + 1 + 1 * 4) < 24 ? each.value.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, each.value.maintenance_day, null)
    time            = format("%02d:00:00Z", (each.value.maintenance_hour + 1 + 1 * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = each.value.storage_type
  node_count     = each.value.node_count
  cores_count    = each.value.core_count
  ram_size       = each.value.ram_size
  storage_size   = each.value.storage_size
  public_ips     = local.public_ip_pools != null ? local.public_ip_pools[each.key] : []

  auto_scaling {
      min_node_count = each.value.min_node_count
      max_node_count = each.value.max_node_count 
  }

  labels = {
    "purpose" = each.value.purpose
  }
  
  lifecycle {
    ignore_changes = [ node_count ]
  }
}

#----
#Test Pool 2 legacy
#----

resource "ionoscloud_k8s_node_pool" "nodepool_legacy" {
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}-${np.nodepool_index}" => np if np.auto_scaling == false} # & zone = 1 // zone =2 
  availability_zone = each.value.availability_zone
  #for_each = { for k, v in var.custom_nodepools : k => v if var.auto_scaling }
  #for_each = { for k in compact([for k, v in var.mymap: v.condition ? k : ""]): k => var.mymap[k] }
  #conditional create is just another count, if auto_scaling=true set count to nodepools_per_zone_count
  #for_each = { for pool in var.custom_nodepools : pool.site_name => pool if var.environment != "prod"}
  #count = each.value.nodepool_per_zone_count 
  name              = each.value.availability_zone == "ZONE_1" ? "${local.cluster_name}-zone1-nodepool-0":"${local.cluster_name}-zone2-nodepool-0" #each.key
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

  maintenance_window {
    day_of_the_week = (each.value.maintenance_hour + 1 + 1 * 4) < 24 ? each.value.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, each.value.maintenance_day, null)
    time            = format("%02d:00:00Z", (each.value.maintenance_hour + 1 + 2 * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = each.value.storage_type
  node_count     = each.value.node_count
  cores_count    = each.value.core_count
  ram_size       = each.value.ram_size
  storage_size   = each.value.storage_size
  public_ips     = local.public_ip_pools != null ? local.public_ip_pools[each.key] : []
}

moved {
  from  = module.ionos_k8s_cluster.ionoscloud_k8s_node_pool.nodepool_zone1[0]
  to    = module.ionos_k8s_cluster.ionoscloud_k8s_node_pool.nodepool_legacy["infra-dev-schulcloud-ops-5426-ZONE_1-legacy-0"]
}

moved {
  from  = module.ionos_k8s_cluster.ionoscloud_k8s_node_pool.nodepool_zone2[0]
  to    = module.ionos_k8s_cluster.ionoscloud_k8s_node_pool.nodepool_legacy["infra-dev-schulcloud-ops-5426-ZONE_2-legacy-0"]
}

resource "ionoscloud_ipblock" "ippools" {
  for_each = {for np in local.nodepool_per_zone_creator : "${local.cluster_name}-${np.availability_zone}-${np.purpose}-${np.nodepool_index}" => np }
  name     = each.key
  location = var.datacenter_location
  size     = each.value.auto_scaling ? each.value.max_node_count + 1 : each.value.node_count + 1
}
