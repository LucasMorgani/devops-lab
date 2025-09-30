#Criando um Internet Gateway
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}
#----

#Criando a Route Table publica
resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"                     #Quais requisições enviar? as que não cairem em nenhum recurso interno da VPC
    gateway_id = aws_internet_gateway.eks_igw.id #Para onde enviar? Para o IGW
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-pub-route_table"
    }
  )
}
#----
