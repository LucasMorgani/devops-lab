#Criando a role do manage node group para o cluster
resource "aws_iam_role" "eks_mng_role" {
  name = "${var.project_name}-mng_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mng_role"
    }
  )
}
#----

#Atachando novas policies na role criada acima
#AmazonEKSWorkerNodePolicy
resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_worker" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
#AmazonEC2ContainerRegistryPullOnly
resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_registry" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}
#AmazonEKS_CNI_Policy
resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_cni" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
#----

#Lista das Roles
#AmazonEKSWorkerNodePolicy          - arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
#AmazonEC2ContainerRegistryPullOnly - arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly
#AmazonEKS_CNI_Policy               - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
#----