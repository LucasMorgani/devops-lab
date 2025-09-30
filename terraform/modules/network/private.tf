#Criando subnet privada
#1a
resource "aws_subnet" "eks_subnet_private_1a" {
  #Dados da subnet
  vpc_id            = aws_vpc.eks_vpc.id                   #Pegando o id da vpc como atributo
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)     #Gerando o CIDR 10.0.3.0/24
  availability_zone = "${data.aws_region.current.region}a" #Pegando a região atual com o data source (region.tf)
  #----
  #Declarando tags mescladas, entre reutilizaveis (locals.tf) e tags especificas locais
  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
  #----
}

#1b
resource "aws_subnet" "eks_subnet_private_1b" {
  #Dados da subnet
  vpc_id            = aws_vpc.eks_vpc.id                   #Pegando o id da vpc como atributo
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)     #Gerando o CIDR 10.0.4.0/24
  availability_zone = "${data.aws_region.current.region}b" #Pegando a região atual com o data source (region.tf)
  #----
  #Declarando tags mescladas, entre reutilizaveis (locals.tf) e tags especificas locais
  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
  #----
}
#----

#Route table association das subnets privadas
#1a
resource "aws_route_table_association" "eks_rtb_assoc_private_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}
#1b
resource "aws_route_table_association" "eks_rtb_assoc_private_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table-1b.id
}
#----