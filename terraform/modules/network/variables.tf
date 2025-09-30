#Adicionando variaveis - os valores são passados para terraform.tfvars (gitignore) no formato chave = "valor"
#cidr_block
variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}
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