# terraform_mba

Infraestrutura AWS com Terraform para publicar uma aplicação web simples em alta disponibilidade.

## O que este projeto cria

- VPC com duas subnets públicas em zonas de disponibilidade diferentes.
- Internet Gateway e roteamento público.
- Security Groups para ALB e EC2.
- Application Load Balancer (ALB), listener HTTP e Target Group.
- Launch Template para EC2 com `user_data`.
- Auto Scaling Group ligado ao Target Group.
- Registro DNS no Route 53 (opcional).

## Estrutura

- `main.tf`: orquestra os módulos.
- `provider.tf`: provider AWS.
- `versions.tf`: versão do Terraform e provider.
- `variables.tf`: variáveis de entrada.
- `outputs.tf`: saídas principais.
- `terraform.tfvars`: exemplo de valores.
- `userdata.sh`: bootstrap da instância.
- `modulos/`: módulos de rede, segurança, balanceador, compute, autoscaling e DNS.

## Pré-requisitos

- Terraform `1.14.8`.
- Conta AWS com permissões para VPC, EC2, ALB, Auto Scaling e Route 53.
- Credenciais AWS configuradas no ambiente (perfil, variáveis ou role).

## Configuração

1. Revise `terraform.tfvars` e ajuste os valores:
   - CIDRs da VPC e subnets.
   - zonas de disponibilidade.
   - `ami_id` válida na região escolhida.
   - capacidades do Auto Scaling.
2. Para criar DNS no Route 53:
   - `create_route53_record = true`
   - preencher `hosted_zone_id` e `record_name`.

## Como executar

```bash
terraform init
terraform plan
terraform apply
```

Para destruir os recursos:

```bash
terraform destroy
```

## Observações

- O `userdata.sh` instala Apache e publica uma página HTML simples.
- O acesso externo entra no ALB pela porta 80.
- As instâncias EC2 recebem tráfego apenas do Security Group do ALB.
