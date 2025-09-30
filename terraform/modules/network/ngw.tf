#Criando Elastic IPs
#1a
resource "aws_eip" "eks_ngw_eip_1a" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}
#1b
resource "aws_eip" "eks_ngw_eip_1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}
#----

#Alocando Nat Gateway para as subnets publicas
#1a
resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}
#1b
resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}
#----

#Criando a route table dos Nat Gateway
#1a
resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"                   #Quais requisições enviar? as que não encontrarem nenhum recurso interno na VPC
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id #Para onde enviar? Para o NGW-1a
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route_table_1a"
    }
  )
}

#1b
resource "aws_route_table" "eks_private_route_table-1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"                   #Quais requisições enviar? as que não encontrarem nenhum recurso interno na VPC
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id #Para onde enviar? Para o NGW-1b
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route_table-1b"
    }
  )
}
#----