# tf-aia-azure-demo
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_webapp"></a> [webapp](#module\_webapp) | ./modules/webapp | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_webapp_vars"></a> [webapp\_vars](#input\_webapp\_vars) | List of environment objects (env, sku, image, location override) | <pre>list(object({<br/>    env          = string<br/>    location     = string<br/>    sku_name     = string<br/>    docker_image = string<br/>    os_type      = string<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_webapp_url"></a> [webapp\_url](#output\_webapp\_url) | URLs for all deployed environments |
<!-- END_TF_DOCS -->