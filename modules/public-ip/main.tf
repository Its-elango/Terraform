resource "azurerm_public_ip" "app-pip" {
  name                = "${var.ip_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = var.app_sku
  idle_timeout_in_minutes = 4
}