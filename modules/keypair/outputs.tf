output "bastion_key_pair" {
  description = "Bastion server keypair"
  value       = tls_private_key.bastion_key_pair.private_key_pem
}

output "jenkins_key_pair" {
  description = "Jenkins server kaypair"
  value       = tls_private_key.jenkins_key_pair.private_key_pem
}
