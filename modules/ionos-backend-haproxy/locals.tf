locals {
  # Map logical zone names to IONOS zone identifiers.
  zones = {
    "zone1" = "ZONE_1",
    "zone2" = "ZONE_2"
  }
  # Size of ram per VM
  ram_size = var.ram_size_overwrite != "" ? var.ram_size_overwrite : lookup({
    "dev"     = 2048
    "staging" = 8192
    "prod"    = 32768
  }, terraform.workspace, 2048)
  core_count = var.core_count_overwrite != "" ? var.core_count_overwrite : lookup({
    "dev"     = 2
    "staging" = 2
    "prod"    = 4
  }, terraform.workspace, 2)
  datacenter_name = var.datacenter_name
  datacenter_id = var.datacenter_id
  datacenter_location = var.datacenter_location
  cpu_family = var.cpu_family != "" ? var.cpu_family : "INTEL_SKYLAKE"
  routes_map = var.routes_map
  # this saves the cluster lans as an object in a list
  # Example of an object:
  # > type({"id" = "id", "routes_list" = [{"network" = "10.0.0.0/24", gateway_ip="10.0.0.0"}]})
  # object({
  #     id: string,
  #     routes_list: tuple([
  #         object({
  #             gateway_ip: string,
  #             network: string,
  #         }),
  #     ]),
  # })
  # if no routes_map is provided, a default value of [{}] is given (just empty), to comply with type requirements in futher processing
  cluster_lan = flatten([ for id in ionoscloud_lan.cluster_lan.*.id: { id = id, routes_list = lookup(local.routes_map, id , [{}]) }])
}
