locals {
  create_frontend_crossconnect            = var.create_frontend_crossconnect
  create_frontend_lan                     = (local.create_frontend_crossconnect == true || var.associated_frontend_crossconnect_id != "") ? true : false
  create_backend_crossconnect             = var.create_backend_crossconnect
  create_backend_lan                      = (local.create_backend_crossconnect == true || var.associated_backend_crossconnect_id != "") ? true : false
  create_service_crossconnect             = var.create_service_crossconnect
  create_service_lan                      = (local.create_service_crossconnect == true || var.associated_service_crossconnect_id != "") ? true : false
  create_public_lan                       = var.create_public_lan
  create_nfs_server_lan                   = var.create_nfs_server_lan
  create_alb_target_lan                   = var.create_alb_target_lan
  create_nlb_target_lan                   = var.create_nlb_target_lan
  create_nat_lan                          = var.create_nat_lan
  frontend_crossconnect_shared_group_ids  = (length(var.crossconnect_shared_group_ids) > 0 && local.create_frontend_crossconnect == true) ? var.crossconnect_shared_group_ids : []
  backend_crossconnect_shared_group_ids   = (length(var.crossconnect_shared_group_ids) > 0 && local.create_backend_crossconnect == true) ? var.crossconnect_shared_group_ids : []
  service_crossconnect_shared_group_ids   = (length(var.crossconnect_shared_group_ids) > 0 && local.create_frontend_crossconnect == true) ? var.crossconnect_shared_group_ids : []
  routes_map                              = var.routes_map 
  create_postgres_lan                     = var.create_postgres_lan
  custom_lans_to_create                   = var.custom_lans_to_create
  # this saves the service/backend/frontend lans as an object in a list
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
  # if no routes_map is provided, a default value of [{}] is given (just empty), to comply with type requirements in further processing
  lan_service     = flatten([ for id in ionoscloud_lan.service_lan.*.id: { id = id, routes_list = [{}] }])
  lan_backend     = flatten([ for id in ionoscloud_lan.backend_lan.*.id: { id = id, routes_list = lookup(local.routes_map, id , [{}]) }])
  lan_frontend    = flatten([ for id in ionoscloud_lan.frontend_lan.*.id: { id = id, routes_list = lookup(local.routes_map, id , [{}]) }])
  lan_nfs_server  = flatten([ for id in ionoscloud_lan.nfs_server_lan.*.id: { id = id, routes_list = [{}] }])
  lan_postgres    = flatten([ for id in ionoscloud_lan.postgres_lan.*.id: { id = id, routes_list = [{}] }])
  lan_alb_target  = flatten([ for id in ionoscloud_lan.alb_target_lan.*.id: { id = id, routes_list =[{}] }])
  lan_nlb_target  = flatten([ for id in ionoscloud_lan.nlb_target_lan.*.id: { id = id, routes_list =[{}] }])
  lan_nat         = flatten([ for id in ionoscloud_lan.nat_lan.*.id: { id = id, routes_list = [{}] }])
  lans_custom     = { for name, lan in ionoscloud_lan.custom_lan: name => { id = lan.id, routes_list = [{}] }}
}
