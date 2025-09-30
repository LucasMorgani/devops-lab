#Criando os outputs que sairão para fora do modulo
#subnet_public_1a
output "subnet_public_1a" {
  value = aws_subnet.eks_subnet_public_1a.id
}
#subnet_public_1b
output "subnet_public_1b" {
  value = aws_subnet.eks_subnet_public_1b.id
}
#subnet_private_1a
output "subnet_private_1a" {
  value = aws_subnet.eks_subnet_private_1a.id
}
#subnet_private_1b
output "subnet_private_1b" {
  value = aws_subnet.eks_subnet_private_1b.id
}
#----