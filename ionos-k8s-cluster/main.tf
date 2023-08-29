

resource "ionoscloud_k8s_cluster" "cluster" {
  name        = local.cluster_name
  k8s_version = var.k8s_version
  maintenance_window {
    day_of_the_week = local.maintenance_day
    time            = format("%02d:00:00Z", local.maintenance_hour)
  }
  api_subnet_allow_list = local.api_subnet_allow_list
}


#
# Nodepool - Zone1
#
resource "ionoscloud_k8s_node_pool" "nodepool_zone1" {
  count = local.nodepool_per_zone_count

  availability_zone = local.availability_zone
  name              = "${local.cluster_name}-zone1-nodepool-${count.index}"
  k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version

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
    # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
    # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
    # Example:
    # Maintenance start (local.maintenance_hour): 2am
    # Control plane (see cluster resource) starts at 2am
    # Maintenance of ...-zone1-nodepool-0 starts at 3am (+1h)
    # Maintenance of ...-zone1-nodepool-1 starts at 7am (+4h)
    # Maintenance of ...-zone1-nodepool-2 starts at 11am (+4h) ...
    # if the number of hour exceeds 24, the maintenance shall start on the next day
    day_of_the_week = (local.maintenance_hour + 1 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
    time = format("%02d:00:00Z", (local.maintenance_hour + 1 + count.index * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = local.storage_type
  node_count     = local.node_count
  cores_count    = local.core_count
  ram_size       = local.ram_size
  storage_size   = local.storage_size
  public_ips     = local.public_ip_pool_zone1 != null ? slice(local.public_ip_pool_zone1[count.index], 0, local.node_count + 1) : []
}

#
# Nodepool - Zone2
#
resource "ionoscloud_k8s_node_pool" "nodepool_zone2" {
  count = local.nodepool_per_zone_count

  availability_zone = "ZONE_2"
  name              = "${local.cluster_name}-zone2-nodepool-${count.index}"
  k8s_version       = ionoscloud_k8s_cluster.cluster.k8s_version

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
    # The maintenance of the nodepools starts 1 hour after the cluster (control plane)
    # The maintenance window for one nodepool is 4 hours long. They are shifted by 4 hours so the don't overlap (in the same zone)
    # Additionally the zones are shifted by 2 hours, so this one starts 2 hours later
    # Example:
    # Maintenance start (local.maintenance_hour): 2am
    # Control plane (see cluster resource) starts at 2am
    # Zone1 (see nodepool_zone1 resource) starts at 3am (+1h)
    # Maintenance of ...-zone2-nodepool-0 starts at 5am (+2h)
    # Maintenance of ...-zone2-nodepool-1 starts at 9am (+4h)
    # Maintenance of ...-zone2-nodepool-2 starts at 1pm (+4h) ...
    # if the number of hour exceeds 24, the maintenance shall start on the next day
    day_of_the_week = (local.maintenance_hour + 1 + 2 + count.index * 4) < 24 ? local.maintenance_day : lookup({ "Monday" = "Tuesday", "Tuesday" = "Wednesday", "Wednesday" = "Thursday", "Thursday" = "Friday", "Friday" = "Saturday", "Saturday" = "Sunday", "Sunday" = "Monday" }, local.maintenance_day, null)
    time = format("%02d:00:00Z", (local.maintenance_hour + 1 + 2 + count.index * 4) % 24)
  }

  datacenter_id  = var.datacenter_id
  k8s_cluster_id = ionoscloud_k8s_cluster.cluster.id
  cpu_family     = local.cpu_family
  storage_type   = local.storage_type
  node_count     = local.node_count
  cores_count    = local.core_count
  ram_size       = local.ram_size
  storage_size   = local.storage_size
  public_ips     = local.public_ip_pool_zone2 != null ? slice(local.public_ip_pool_zone2[count.index], 0, local.node_count + 1) : []
}


#
# Ippool - Zone1
#
resource "ionoscloud_ipblock" "ippools_zone1" {
  count    = var.create_public_ip_pools ? var.nodepool_per_zone_count : 0
  name     = "${local.cluster_name}-zone1-nodepool-${count.index}"
  location = var.datacenter_location
  size     = var.node_count + 1
}

#
# Ippool - Zone2
#
resource "ionoscloud_ipblock" "ippools_zone2" {
  count    = var.create_public_ip_pools ? var.nodepool_per_zone_count : 0
  name     = "${local.cluster_name}-zone2-nodepool-${count.index}"
  location = var.datacenter_location
  size     = var.node_count + 1
}
