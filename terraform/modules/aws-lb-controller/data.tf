#Data Source
#Criando um data source para pegar os dados da região atual
data "aws_region" "current" {}
#Pegando as configurações de identidade da conta
data "aws_caller_identity" "current" {}
#----