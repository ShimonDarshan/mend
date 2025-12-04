output "cluster_name" {
  value = module.aks.cluster_name
}

output "public_ip" {
  value = module.aks.public_ip
}

output "fqdn" {
  value = module.aks.fqdn
}

output "get_credentials" {
  value = module.aks.get_credentials
}
