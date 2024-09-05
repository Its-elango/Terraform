module "resource_group" {
  source   = "./modules/resource-grp"
  name     = "app-rsg"
  location = "North Europe"
}

module "virtual_network" {
  source              = "./modules/vnet"
  name                = "app-vnet"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "default"
  subnet_prefix       = ["10.0.1.0/24"]
}
module "public_ip" {
  source              = "./modules/public-ip"
  ip_name             = "app-pip"
 location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  app_sku = "Standard"
}


module "network_interface" {
  source              = "./modules/network-interface"
  name                = "app-nic"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.virtual_network.subnet_id
public_ip_address_id = module.public_ip.app-pip
}

module "virtual_machine" {
  source               = "./modules/virtual-machine"
  name                 = "app-vm"
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.name
  network_interface_id = module.network_interface.nic_id
  vm_size              = "Standard_DS1_v2"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
}

module "nsg" {
  source              = "./modules/network-security-group"
  name                = "app-nsg"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
}

module "nsg_association" {
  source                  = "./modules/nic-msg-associate"
  network_interface_id     = module.network_interface.nic_id
network_security_group_id = module.nsg.nsg_id
}