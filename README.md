# Azure Availability Set

Availability Set Deployment

## Description

This module manages an Azure Availability Set.

Note, this is for the availability set only. The VMs that are deployed into the availability set are managed by the Windows/Linux VM modules.

## Resource List

- Availability Set

## Usage

```hcl
module "avd_availability_set" {
  source = "github.com/Coalfire-CF/ACE-Azure-VM-AvailabilitySet?ref=v1.0.0"

  availability_set_name = "${local.resource_prefix}-avd-as"
  location              = var.location
  resource_group_name   = data.terraform_remote_state.setup.outputs.management_rg_name
  regional_tags         = var.regional_tags
  global_tags           = var.global_tags
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_set_name"></a> [availability\_set\_name](#input\_availability\_set\_name) | Name of the Availability Set | `string` | n/a | yes |
| <a name="input_availability_set_tags"></a> [availability\_set\_tags](#input\_availability\_set\_tags) | Key/Value tags that should be added to the Availability Set | `map(string)` | `{}` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Global level tags | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region for resource deployment | `string` | n/a | yes |
| <a name="input_regional_tags"></a> [regional\_tags](#input\_regional\_tags) | Regional level tags | `map(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure Resource Group resource will be deployed in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_set_id"></a> [availability\_set\_id](#output\_availability\_set\_id) | The resource id of the Availability Set |
<!-- END_TF_DOCS -->