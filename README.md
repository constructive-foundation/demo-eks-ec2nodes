# demo-eks-ec2nodes

- [demo-eks-ec2nodes](#demo-eks-ec2nodes)
  - [Description](#description)
  - [Pre-requisites](#pre-requisites)
  - [Execution](#execution)
  - [Doc generation](#doc-generation)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

---

## Description

Terraform module to create EKS cluster on AWS with EC2 worker nodes and terraform backend cofniguration with S3 bucket.

## Pre-requisites

- S3 bucket to configure terraform state as backend config is already created. It can either be created via AWS management console or terraform itself.

- [example.tfvars](./example.tfvars) is provided to be used with sample values, modification can be done in order to change the configuration of cluster.

- AWS IAM credentials are required in order to execute the resource on AWS. Please refer [aws-provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) to configure the same. In this example , `aws configure` command is used to generate the key for terraform to use.

## Execution

Execution of the resources can be carried out with below commands, provided `terraform.tfvars` is updated referencing [example.tfvars](./example.tfvars) or -var-file can be passed with terraform cli.

```bash
terraform init # It will initialize the backend with pre-created S3 bucket and key
terraform plan -var-file example.tfvars -refresh=true -out eks.plan
terraform apply -lock=true -refresh=true eks.plan -auto-approve
```

## Doc generation

Code formatting and documentation for variables and outputs is generated using [pre-commit-terraform hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses [terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install) to install pre-commit locally.

And install `terraform-docs` with `go get github.com/segmentio/terraform-docs` or `brew install terraform-docs`.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| aws | >= 2.28.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.28.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| eks\_cluster\_name | EKS cluster name | `string` | n/a | yes |
| eks\_cluster\_ver | EKS cluster version | `string` | `"1.16"` | no |
| enable\_dns\_hostnames | flag to enable dns hostnames | `bool` | `true` | no |
| nat\_enable | flag to enable nat gateway | `bool` | `true` | no |
| single\_nat\_enable | flag to enable single nat gateway | `bool` | `true` | no |
| vpc\_cidr | vpc cidr range | `string` | n/a | yes |
| vpc\_name | vpc name | `string` | n/a | yes |
| vpc\_private\_subnets | list of vpc private subnets | `list` | n/a | yes |
| vpc\_public\_subnets | list of vpc public subnets | `list` | n/a | yes |
| worker\_instance\_type | EC2 instance type for worker nodes | `string` | `"t2.small"` | no |
| worker\_nodes\_desired | Desired worker nodes, should be less than max count of worker nodes in node group | `number` | `1` | no |
| worker\_nodes\_max | maximum number of worker nodes in node group | `number` | `1` | no |
| worker\_nodes\_min | minimum worker nodes in node group | `number` | `1` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->