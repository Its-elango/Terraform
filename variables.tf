variable "azure_subscription_id" {
  description = "The Subscription ID for the Azure account"
  type        = string
}

variable "azure_client_id" {
  description = "The Client ID for the Azure Service Principal"
  type        = string
}

variable "azure_client_secret" {
  description = "The Client Secret for the Azure Service Principal"
  type        = string
  sensitive   = true 
}

variable "azure_tenant_id" {
  description = "The Tenant ID for the Azure account"
  type        = string
}

variable "admin_username" {
  type = string
  default = "adminuser"
}

variable "admin_password" {
  type = string
  default = "Test@123"
}
