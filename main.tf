resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.example.location
  resource_group_name          = azurerm_resource_group.example.name
  sku_name                     = "standard"  # Other option is "premium"
  tenant_id                    = var.tenant_id

  access_policy {
    tenant_id = var.tenant_id
    object_id  = var.object_id
    key_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "update",
    ]
    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
    ]
  }
}
