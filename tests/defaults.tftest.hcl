mock_provider "azurerm" {}

variables {
  availability_set_name = "test-avset"
  location              = "usgovvirginia"
  resource_group_name   = "test-rg"
}

run "defaults" {
  command = plan

  assert {
    condition     = azurerm_availability_set.availability_set.platform_fault_domain_count == 2
    error_message = "platform_fault_domain_count must default to 2."
  }

  assert {
    condition     = azurerm_availability_set.availability_set.platform_update_domain_count == 2
    error_message = "platform_update_domain_count must default to 2."
  }

  assert {
    condition     = azurerm_availability_set.availability_set.name == "test-avset"
    error_message = "name must come from availability_set_name."
  }

  assert {
    condition     = azurerm_availability_set.availability_set.location == "usgovvirginia"
    error_message = "location must come from the location input."
  }

  assert {
    condition     = azurerm_availability_set.availability_set.resource_group_name == "test-rg"
    error_message = "resource_group_name must come from the resource_group_name input."
  }

  assert {
    condition     = azurerm_availability_set.availability_set.proximity_placement_group_id == null
    error_message = "proximity_placement_group_id must not be set."
  }

  assert {
    condition     = length(azurerm_availability_set.availability_set.tags) == 0
    error_message = "tags must be empty when no tag inputs are set."
  }
}

run "tags_merge" {
  command = plan

  variables {
    tags          = { Function = "app", Owner = "module" }
    regional_tags = { Region = "usgovvirginia", Owner = "regional" }
    global_tags   = { Owner = "global" }
  }

  assert {
    condition = azurerm_availability_set.availability_set.tags == tomap({
      Function = "app"
      Region   = "usgovvirginia"
      Owner    = "global"
    })
    error_message = "tags must merge tags, regional_tags and global_tags, with global_tags winning."
  }
}

run "output_id" {
  command = apply

  assert {
    condition     = output.availability_set_id == azurerm_availability_set.availability_set.id
    error_message = "availability_set_id must be the Availability Set ID."
  }

  assert {
    condition     = length(output.availability_set_id) > 0
    error_message = "availability_set_id must not be empty."
  }
}
