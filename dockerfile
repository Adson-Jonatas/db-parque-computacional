# Use a imagem oficial do MySQL como base
FROM mysql:8.0

# Defina as variáveis de ambiente para o nome de usuário, senha e nome do banco de dados
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=galo
ENV MYSQL_USER=mysql
ENV MYSQL_PASSWORD=mysql

# Copie o arquivo de inicialização SQL para o diretório de inicialização do MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Exponha a porta 3306 para que possa ser acessada de fora do contêiner
EXPOSE 3306
