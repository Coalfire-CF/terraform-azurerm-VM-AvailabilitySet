![Coalfire](coalfire_logo.png)

# terraform-azurerm-VM-AvailabilitySet

## Description

This module manages an Azure Availability Set.

Note, this is for the availability set only. The VMs that are deployed into the availability set are managed by the Windows/Linux VM modules.

This module is used in the [Coalfire-Azure-RAMPpak](https://github.com/Coalfire-CF/Coalfire-Azure-RAMPpak) FedRAMP Framework.

Learn more at [Coalfire OpenSource](https://coalfire.com/opensource).

## Dependencies

- Security Core
- Region Setup
- Networking
- VM Module

## Resource List

- Availability Set

## Usage

This module can be called as outlined below.

- Create a `local` folder under `terraform/azure`.
- Create a `main.tf` file in the `local` folder.
- Copy the code below into `main.tf`.
- From the `terraform/azure/local` directory run `terraform init`.
- Run `terraform plan` to review the resources being created.
- If everything looks correct in the plan output, run `terraform apply`.

```hcl
provider "azurerm" {
  features {}
}

module "avd_availability_set" {
  source = "github.com/Coalfire-CF/ACE-Azure-VM-AvailabilitySet?ref=v1.0.0"

  availability_set_name = "${local.resource_prefix}-avd-as"
  location              = var.location
  resource_group_name   = data.terraform_remote_state.setup.outputs.management_rg_name
  regional_tags         = var.regional_tags
  global_tags           = var.global_tags
}
```

