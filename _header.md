![Coalfire](coalfire_logo.png)

# terraform-azurerm-VM-AvailabilitySet

## Description

This module manages an Azure Availability Set.

Note, this is for the availability set only. The VMs that are deployed into the availability set are managed by the Windows/Linux VM modules.

This module is used in the [Coalfire-Azure-RAMPpak](https://github.com/Coalfire-CF/Coalfire-Azure-RAMPpak) FedRAMP Framework.

Learn more at [Coalfire OpenSource](https://coalfire.com/opensource).

## Provider configuration

This module has no provider block. The caller configures the `azurerm` provider. For Azure Government, set `environment = "usgovernment"`.

## Defaults

- 2 update domains and 2 fault domains. These are fixed.
- `managed` (aligned) uses the provider default.
- Availability sets have no zone setting and no diagnostic settings.

## Resource List

- Availability Set

## Usage

```hcl
module "availability_set" {
  source = "git::https://github.com/Coalfire-CF/terraform-azurerm-VM-AvailabilitySet?ref=v0.2.0"

  availability_set_name = "app-avset"
  location              = var.location
  resource_group_name   = azurerm_resource_group.app.name

  tags = {
    Function = "app"
  }
  regional_tags = var.regional_tags
  global_tags   = var.global_tags
}
```
