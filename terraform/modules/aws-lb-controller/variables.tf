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
#OIDC
variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}
#----