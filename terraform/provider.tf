#Configurações entre AWS/Terraform
terraform {

  #Passando os dados que o Terraform deve usar para gerenciar o provider
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
  #----

  #Migrando o tfstate para um bucket s3
  backend "s3" {
    bucket = "skylabs-comunidadedevops"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
  #----
}
#----

#Passando o provider e a região a ser usada
provider "aws" {
  region = "us-east-1"
}
#----