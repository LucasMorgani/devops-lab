#Criando os outputs que sairão para fora do modulo
#Cluster name
output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}
output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
#----

#Criando os outputs que sairão para fora do modulo para a configuração do k8s provider
#Cluster Endpoint
output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
#Cluster Certificate (codificado em base64)
output "cluster_ca_certificate" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}