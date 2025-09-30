#Adicionando uma variavel para cidr_block - os valores são passados para terraform.tfvars (gitignore) no formato chave = "valor"
variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}
#----

#Adicionando uma variavel para cidr_block - os valores são passados para terraform.tfvars (gitignore) no formato chave = "valor"
variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}
#----