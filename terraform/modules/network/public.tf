#Criando subnet publica
#1a
resource "aws_subnet" "eks_subnet_public_1a" {
  #Dados da subnet
  vpc_id                  = aws_vpc.eks_vpc.id                   #Pegando o id da vpc como atributo
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)     #Gerando o CIDR 10.0.1.0/24
  availability_zone       = "${data.aws_region.current.region}a" #Pegando a região atual com o data source (region.tf)
  map_public_ip_on_launch = true
  #----
  #Declarando tags mescladas, por variavel e declarando novas
  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1a",
      "kubernetes.io/role/elb" = 1 #Passando a tag de subnet publica
    }
  )
  #----
}

#1b
resource "aws_subnet" "eks_subnet_public_1b" {
  #Dados da subnet
  vpc_id                  = aws_vpc.eks_vpc.id                   #Pegando o id da vpc como atributo
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)     #Gerando o CIDR 10.0.2.0/24
  availability_zone       = "${data.aws_region.current.region}b" #Pegando a região atual com o data source (region.tf)
  map_public_ip_on_launch = true
  #----
  #Declarando tags mescladas, por variavel e declarando novas
  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1b",
      "kubernetes.io/role/elb" = 1 #Passando a tag de subnet publica
    }
  )
  #----
}
#----

#Assiciando as subnets à rout-table
#1a
resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}
#1b
resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}
#----