provider "azurerm" {
  features {}
}

data "azurerm_subscription" "primary" {}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Application Developer"
  principal_id         = var.principal_id
}

resource "azurerm_policy_assignment" "example" {
  name                 = "example-policy-assignment"
  scope                = data.azurerm_subscription.primary.id
  policy_definition_id = var.policy_definition_id
}
