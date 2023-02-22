# Azure Availability Set

Availability Set Deployment

## Description

This module manages an Azure Availability Set.

Note, this is for the availability set only. The VMs that are deployed into the availability set are managed by the Windows/Linux VM modules.

## Resource List

- Availability Set

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| availability_set_name | Name of the Availability Set | string | N/A | yes |
| location | The Azure location/region to create resources in | string | N/A | yes |
| resource_group_name | Azure Resource Group resource will be deployed in | string | N/A | yes |
| regional_tags | Regional level tags | map(string) | {} | yes |
| global_tags | Global level tags | map(string) | {} | yes |
| availability_set_tags | Key/Value tags that should be added to the Availability Set | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| availability_set_id | The ID of the Availability Set |

## Usage

```hcl
module "avd_availability_set" {
  source = "../../../../modules/azurerm-availability-set" github.com/Coalfire-CF/ACE-Azure-VM-AvailabilitySet?ref=v1.0.0"

  availability_set_name = "${local.resource_prefix}-avd-as"
  location              = var.location
  resource_group_name   = data.terraform_remote_state.setup.outputs.management_rg_name
  regional_tags         = var.regional_tags
  global_tags           = var.global_tags
}
```
