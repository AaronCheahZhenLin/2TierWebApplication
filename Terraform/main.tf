module "Networking" {
  source = "../module/Networking"
  
  vpc_cidr     = var.vpc_cidr
  subnet1_cidr = var.subnet1_cidr
  subnet2_cidr = var.subnet2_cidr
}

module "Storage" {
  source = "../module/Storage"
}

module "Compute" {
  source = "../module/Compute"
  subnet1 = module.Networking.subnet1
  subnet2 = module.Networking.subnet2
  HTTPandSSH = module.Networking.HTTPandSSH
}

module "LoadBalancer" {
  source = "../module/LoadBalancer"
  
  # Dependencies from other modules
  VPC = module.Networking.VPC
  subnet1 = module.Networking.subnet1
  subnet2 = module.Networking.subnet2
  webserver1 = module.Compute.webserver1
  webserver2 = module.Compute.webserver2
  HTTPandSSH = module.Networking.HTTPandSSH
}