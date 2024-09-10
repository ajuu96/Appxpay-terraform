# Below Code will generate a secure private key with encoding
resource "tls_private_key" "bastion_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "${var.env_name}-bastion-key"
  public_key = tls_private_key.bastion_key_pair.public_key_openssh
}

# Save file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.bastion_key_pair.key_name}.pem"
  content  = tls_private_key.bastion_key_pair.private_key_pem
}

# Below Code will generate a secure private key with encoding
resource "tls_private_key" "jenkins_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "jenkins_key_pair" {
  key_name   = "${var.env_name}-jenkins-key"
  public_key = tls_private_key.jenkins_key_pair.public_key_openssh
}

# Save file
resource "local_file" "jenkins_ssh_key" {
  filename = "${aws_key_pair.jenkins_key_pair.key_name}.pem"
  content  = tls_private_key.jenkins_key_pair.private_key_pem
}