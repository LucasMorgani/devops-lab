#Criando o node group
resource "aws_eks_node_group" "eks_manage_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-node_group"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  ami_type        = "AL2_x86_64"
  instance_types  = ["t3.medium"]
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-nodegroup"
    }
  )

  #Definindo o desired scling config
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  #Definindo dependencia com as roles para conseguir criar e deletetar sem problemas
  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_registry,
  ]
}
#----