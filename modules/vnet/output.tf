# ./modules/vnet/outputs.tf

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
