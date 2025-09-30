#Criando um cluster EKS
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn #Passando a role necessária (iam.tf)
  version  = "1.31"                            #Versão do k8s

  #Passando as subnets para criar o cluster
  vpc_config {
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
    endpoint_private_access = true #E possivel acessar o endpoint internamente
    endpoint_public_access  = true #E possivel acessar o endopoint externamente
  }

  #Criando uma interdependencia com a policy attachment (não utilizar causará problemas!)
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}
#----