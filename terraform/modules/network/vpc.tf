#Adicionando uma nova VPC
resource "aws_vpc" "eks_vpc" {
  #Dados dos resources
  cidr_block           = var.cidr_block # Puxa o valor informado em variables.tf
  enable_dns_support   = true
  enable_dns_hostnames = true
  #----

  #Declarando tags mescladas, entre reutilizaveis (locals.tf) e tags especificas locais
  tags = merge(
    var.tags, #Passando variaveis reutilizaveis salvas em locals.tf
    {
      Name = "${var.project_name}-vpc" #Passando a tag especifica local
    }
  )
  #----

}
#----