# DP4 Envirment

![](/home/exxman/.var/app/com.github.marktext.marktext/config/marktext/images/2022-01-30-23-56-58-image.png)

## Deployng envirment:

#### Jenkins Job: http://127.0.0.1:8080/job/Orion_test/

![](/home/exxman/.var/app/com.github.marktext.marktext/config/marktext/images/2022-01-30-23-59-26-image.png)

#### Parameters of the pipline:

> autoApproval -if unchecked - the aprroval needs to be provided after planing infrastructure (terraform plan)
> 
> region - change AWS Region for deployment: ( default eu-central-1 )
> 
> switch - switch external URL between env 

## Disaster recovery plan

In case of region troubles in AWS the infrastructure can be esaly transfered to other region - the region selector parametr is provided in jenkins job:

![](/home/exxman/.var/app/com.github.marktext.marktext/config/marktext/images/2022-01-24-14-39-58-image.png)

All regin sensetive information will be grubed automaticly on a terraform side.

## Terraform:

### Terra

###### ## Requirements

| Name                                  | Version |
| ------------------------------------- | ------- |
| [aws](#requirement_aws)               | ~> 3.0  |
| [cloudflare](#requirement_cloudflare) | ~> 3.0  |

## Providers

| Name                               | Version |
| ---------------------------------- | ------- |
| [aws](#provider_aws)               | 3.72.0  |
| [cloudflare](#provider_cloudflare) | 3.7.0   |

## Modules

| Name                         | Source         | Version |
| ---------------------------- | -------------- | ------- |
| [ec2-db](#module_ec2-db)     | .//modules/ec2 | n/a     |
| [ec2-php1](#module_ec2-php1) | .//modules/ec2 | n/a     |
| [ec2-php2](#module_ec2-php2) | .//modules/ec2 | n/a     |
| [ec2-web1](#module_ec2-web1) | .//modules/ec2 | n/a     |
| [ec2-web2](#module_ec2-web2) | .//modules/ec2 | n/a     |
| [vpc](#module_vpc)           | .//modules/vpc | n/a     |

## Resources

| Name                                                                                                                                            | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_alb.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb)                                                 | resource    |
| [aws_alb.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb)                                                | resource    |
| [aws_alb_listener.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener)                               | resource    |
| [aws_alb_listener.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener)                              | resource    |
| [aws_alb_listener_rule.php_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule)                 | resource    |
| [aws_alb_listener_rule.php_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule)                | resource    |
| [aws_alb_target_group.php_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                   | resource    |
| [aws_alb_target_group.php_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                  | resource    |
| [aws_alb_target_group.web_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                   | resource    |
| [aws_alb_target_group.web_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                  | resource    |
| [aws_alb_target_group_attachment.php1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.php2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.web1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.web2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                                    | resource    |
| [aws_key_pair.ssh-key-from-bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)                       | resource    |
| [aws_key_pair.ssh-key-to-bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)                         | resource    |
| [aws_security_group.alb_blue_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                    | resource    |
| [aws_security_group.alb_green_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                   | resource    |
| [cloudflare_record.blue_cname](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record)                      | resource    |
| [cloudflare_record.green_cname](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record)                     | resource    |
| [aws_ami.ama2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                              | data source |
| [aws_ami.redhat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                            | data source |

## Inputs

| Name                            | Description          | Type     | Default                              | Required |
| ------------------------------- | -------------------- | -------- | ------------------------------------ | -------- |
| [blue](#input_blue)             | Switch for Blue ENV  | `bool`   | `false`                              | no       |
| [cf_domain](#input_cf_domain)   | n/a                  | `string` | `"devopsedu.xyz"`                    | no       |
| [cf_zone_id](#input_cf_zone_id) | n/a                  | `string` | `"42d495b2b5d7c20cae3d98efc8f1a357"` | no       |
| [green](#input_green)           | Switch for Green ENV | `bool`   | `false`                              | no       |
| [region](#input_region)         | n/a                  | `string` | `"eu-central-1"`                     | no       |

## Outputs

| Name                                     | Description       |
| ---------------------------------------- | ----------------- |
| [ami](#output_ami)                       | Ami image         |
| [bastion_pub_ip](#output_bastion_pub_ip) | Bastion Public IP |
| [blue_alb_url](#output_blue_alb_url)     | ALB Blue URL      |
| [green_alb_url](#output_green_alb_url)   | ALB Green URL     |

## Ansible

Playbook example

```
---
- name: Provisioning 
  hosts: all
  gather_facts: true
  become: yes
  tasks:
    - name: Provision projects role
      include_role:
        name: "{{ role }}"
      with_items: "{{ roles }}"
      loop_control:
        loop_var: role
      when: ('group_tag' in group_names)
```

> 'group_tag' - env tag dynamic inventory

## Cloudflare

###### Cloudflare - create CNAME record with API example:

```
curl -X POST "https://api.cloudflare.com/client/v4/zones/023e105f4ecef8ad9ca31a8372d0c353/dns_records" \
     -H "X-Auth-Email: user@example.com" \
     -H "X-Auth-Key: c2547eb745079dac9320b638f5e225cf483cc5cfdda41" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"example.com","content":"127.0.0.1","ttl":3600,"priority":10,"proxied":false}'
```

url to cloudflare API docks: [Cloudflare API v4 Documentation](https://api.cloudflare.com/#dns-records-for-a-zone-create-dns-record)
