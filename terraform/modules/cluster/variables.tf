#Adicionando variaveis - os valores são passados para terraform.tfvars (gitignore) no formato chave = "valor"
#project_name
variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}
#tags
variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}
#----

#Recebendo o output do modulo network, pegando as subnets publicas
#1a
variable "public_subnet_1a" {
  type        = string
  description = "Subnet to create EKS Cluster"
}
#1b
variable "public_subnet_1b" {
  type        = string
  description = "Subnet to create EKS Cluster"
}
#----