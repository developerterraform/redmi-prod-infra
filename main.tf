#===============================================
#Key Pair creation
#===============================================
resource "aws_key_pair" "auth_key" {
  key_name   = "${var.project_name}-${var.project_env}"
  public_key = file("mykey.pub")
  tags = {
    Name    = "${var.project_name}-${var.project_env}"
    Project = var.project_name
    Env     = var.project_env
    Owner   = var.project_owner
  }
}
#===============================================
#SECURITY GROUPS CREATIONS
#===============================================
resource "aws_security_group" "http_access" {
  name        = "${var.project_name}-${var.project_env}-http_access"
  description = "${var.project_name}-${var.project_env}-http_access"


  ingress {
    description      = "HTTP_INCOMING"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTPS_INCOMING"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "${var.project_name}-${var.project_env}-http_access"
    Project = var.project_name
    Env     = var.project_env
    Owner   = var.project_owner
  }
}
resource "aws_security_group" "remote_access" {
  name        = "${var.project_name}-${var.project_env}-remote_access"
  description = "${var.project_name}-${var.project_env}-remote_access"


  ingress {
    description      = "Remote-Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "${var.project_name}-${var.project_env}-remote_access"
    Project = var.project_name
    Env     = var.project_env
    Owner   = var.project_owner
  }
}
