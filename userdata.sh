#!/bin/bash
yum update -y
yum install -y httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>terraform_mba</title>
</head>
<body>
  <h1>Aplicacao provisionada com Terraform</h1>
  <p>Instancia criada com user_data.</p>
</body>
</html>
EOF

systemctl enable httpd
systemctl start httpd