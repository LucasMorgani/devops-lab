#Locals para pegar o ID do OIDC
locals {
  oidc = split("/", var.oidc)[4]
}
#----