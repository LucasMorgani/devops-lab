#Criando uma nova policy, baseada no arquivo iam_policy.json
resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.project_name}-aws_lb_controller"
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}
#----