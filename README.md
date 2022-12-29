# Release Terraform AWS network identifiers

This **example** Terraform module gets and returns AWS network identifiers to simplify adding services to your [Release](https://releasehub.com/) Kubernetes cluster's VPC on AWS.

## :warning: Pre-release example module :warning:

This is a pre-release example Terraform module. Do not rely on this module, as the API may change without notice.

## Quick start

1.  Add this module to your Terraform configuration.
    ```hcl
    variable "RELEASE_CONTEXT" {
      type        = string
      description = "Release cluster context"
    }

    provider "aws" {}

    module "release_network" {
      source = "github.com/awesome-release/terraform-aws-release-network"
      release_context = var.RELEASE_CONTEXT
    }
    ```

2.  Add an [infrastructure runner](https://docs.releasehub.com/reference-documentation/application-settings/application-template/schema-definition#infrastructure) to your Release application template.
    ```yaml
    infrastructure:
    - name: terraform
      type: terraform
    ```

3.  Deploy your application on Release.

## Outputs

The module exposes the following outputs:

| Name                 | Type         | Description                                        |
|----------------------|--------------|----------------------------------------------------|
| `vpc_id`             | string       | VPC ID for the Release cluster                     |
| `security_group_id`  | string       | Security group ID for the Release cluster          |
| `private_subnet_ids` | list(string) | List of private subnet IDs for the Release cluster |
| `public_subnet_ids`  | list(string) | List of public subnet IDs for the Release cluster  |

## Required input variables

| Name              | Type   | Description                     |
|-------------------|--------|---------------------------------|
| `release_context` | string | Context for the Release cluster |

If this module is included in a Terraform configuration run by Release's Terraform infrastructure runner, pass the `RELEASE_CONTEXT` environment variable to this module.

For testing outside the Release infrastructure runner, you would need to enter these inputs manually. To find the Release cluster context, [log in to Release](https://app.releasehub.com/) and navigate to **Account settings**, then to **Clusters**. Click on the cluster and copy the **Context** value.

## External links

- [Get started with Terraform](https://docs.releasehub.com/guides-and-examples/advanced-guides/infrastructure/terraform) – Release documentation about using Terraform
- [Infrastructure as code (IaC)](https://docs.releasehub.com/guides-and-examples/advanced-guides/infrastructure) – Release documentation about IaC
- [Terraform and Flask](https://docs.releasehub.com/guides-and-examples/common-setup-examples/terraform-flask-redis) – Release example application using this module