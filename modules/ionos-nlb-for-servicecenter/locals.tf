locals {
    parts_of_node_ip = split(".", var.node_nlb_lan_ips[0])
    # shorten ip from <num>.<num>.<num>.<num> to <num>.<num>.<num>
    node_ip_part = join(".", slice(local.parts_of_node_ip, 0, length(local.parts_of_node_ip) - 1))
    cluster_node_ip_range = "${local.node_ip_part}.0/23"
}