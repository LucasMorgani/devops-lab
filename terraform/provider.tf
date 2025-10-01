#Configurações entre AWS/Terraform
terraform {

  #Passando os dados que o Terraform deve usar para gerenciar o provider
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
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

#Passando os providers a serem usados
#AWS
provider "aws" {
  region = "us-east-1"
}
#Kubernetes
provider "kubernetes" {
 host                   = module.eks_cluster.cluster_endpoint
 cluster_ca_certificate = base64decode(module.eks_cluster.cluster_ca_certificate)
 exec {
   api_version = "client.authentication.k8s.io/v1beta1"
   args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
   command     = "aws"
 }
}
#Helm
provider "helm" {
 kubernetes = {
   host                   = module.eks_cluster.cluster_endpoint
   cluster_ca_certificate = base64decode(module.eks_cluster.cluster_ca_certificate)
   exec = {
     api_version = "client.authentication.k8s.io/v1beta1"
     args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
     command     = "aws"
   }
 }
}
#----