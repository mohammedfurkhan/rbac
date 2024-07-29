# Define custom policies if needed
# Example:
# resource "azurerm_policy_definition" "example_policy" {
#   name         = "example-policy"
#   policy_type  = "Custom"
#   mode         = "All"
#   display_name = "Example Policy"
#   description  = "An example policy"
#   policy_rule  = <<POLICY_RULE
# {
#   "if": {
#     "field": "location",
#     "notEquals": "eastus"
#   },
#   "then": {
#     "effect": "deny"
#   }
# }
# POLICY_RULE
# }
