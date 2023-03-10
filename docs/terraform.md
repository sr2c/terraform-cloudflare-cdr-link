<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.33.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.33.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_application.default](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_application) | resource |
| [cloudflare_access_application.override](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_application) | resource |
| [cloudflare_access_group.client_admins](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_group) | resource |
| [cloudflare_access_group.client_agents](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_group) | resource |
| [cloudflare_access_policy.allow_agents](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_client_admins](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_leafcutter](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_monitoring](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_override](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_public](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.allow_super_admins](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_policy.default_deny](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_policy) | resource |
| [cloudflare_access_service_token.leafcutter](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_service_token) | resource |
| [cloudflare_access_service_token.monitoring](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/access_service_token) | resource |
| [cloudflare_argo_tunnel.default](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/argo_tunnel) | resource |
| [cloudflare_record.tunnel_records](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/resources/record) | resource |
| [random_id.tunnel_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [cloudflare_access_identity_provider.google](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/data-sources/access_identity_provider) | data source |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/3.33.1/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_client_admin_emails"></a> [client\_admin\_emails](#input\_client\_admin\_emails) | n/a | `string` | n/a | yes |
| <a name="input_client_agent_emails"></a> [client\_agent\_emails](#input\_client\_agent\_emails) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | The account identifier to target for the module. | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | The zone identifier to target for the module. | `string` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | <pre>[<br>  "namespace",<br>  "name",<br>  "tenant",<br>  "stage",<br>  "attributes"<br>]</pre> | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_metamigo_access_roles"></a> [metamigo\_access\_roles](#input\_metamigo\_access\_roles) | n/a | `string` | `"admin,monitoring"` | no |
| <a name="input_metamigo_domain"></a> [metamigo\_domain](#input\_metamigo\_domain) | The domain name for the Metamigo user interface. Do not include a tailing dot at the end of the domain name. Only<br>    the user interface for Metamigo is exposed, all other communication happens internally within the Docker network.<br>    By default, the domain name will be formed of `${environment}-admin.${cloudflare_zone_name}`. The zone name is<br>    retrieved from Cloudflare based on the Zone ID. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_super_admins_group_ids"></a> [super\_admins\_group\_ids](#input\_super\_admins\_group\_ids) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_zammad_access_roles"></a> [zammad\_access\_roles](#input\_zammad\_access\_roles) | n/a | `string` | `"admin,agent,leafcutter,monitoring"` | no |
| <a name="input_zammad_domain"></a> [zammad\_domain](#input\_zammad\_domain) | The domain name for the Zammad user interface. Do not include a tailing dot at the end of the domain name.<br>    By default, the domain name will be formed of `${environment}.${cloudflare_zone_name}`. The zone name is<br>    retrieved from Cloudflare based on the Zone ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metamigo_audience"></a> [metamigo\_audience](#output\_metamigo\_audience) | n/a |
| <a name="output_metamigo_domain"></a> [metamigo\_domain](#output\_metamigo\_domain) | n/a |
| <a name="output_tunnel_id"></a> [tunnel\_id](#output\_tunnel\_id) | n/a |
| <a name="output_tunnel_name"></a> [tunnel\_name](#output\_tunnel\_name) | n/a |
| <a name="output_tunnel_secret"></a> [tunnel\_secret](#output\_tunnel\_secret) | n/a |
| <a name="output_zammad_domain"></a> [zammad\_domain](#output\_zammad\_domain) | n/a |
<!-- markdownlint-restore -->
