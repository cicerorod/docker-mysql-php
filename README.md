# docker-mysql-php
  Exemplo de criação de ambiente utilizando dockerfile e dockercompose

## ![](https://img.icons8.com/metro/20/000000/run-command.png) Execução

### Clone

1. Clonar via prompt de comando o projeto em uma pasta de sua preferência: `git clone https://github.com/cicerorod/docker-mysql-php.git`
2. Acessar a pasta principal do projeto via prompt de comando. Ex: `cd docker-mysql-php`;

**1)** Criar a arquivo Dockerfile com a definição da imagem que precisamos

Exemplo:
 
```

FROM php:7.0-apache
MAINTAINER cicerorod@gmail.com

RUN apt-get update && apt-get install -y vim && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql

``` 

**2)** Execuatar o comando `$ docker build -t cicerorod/php-7.0apache:v1 .` para criar a imagem contida no arquivo dockerfile

**3)** Para testar 

`$ docker run -d --name myPhp cicerorod/php-7.0apache:v1` para executar
ou 
`$ docker run -it --rm cicerorod/php-7.0apache:v1 bash` para acessar o bash o linux

**4)** Criar o arquivo docker-compose.yml que contém os serviços a serem criados (utilizando a imagem criada anteriormente)

```

version: "2"
services:
  db:
    image: mysql:5.7
    volumes:
      - "./.data/db:/var/lib/mysql"
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: mydb
      MYSQL_USER: root
      MYSQL_PASSWORD: root
  web:
    volumes:
      - ./src/html:/var/www/html
    depends_on:
      - db
    image: cicerorod/php-7.0apache:v1
    links:
      - db
    ports:
      - "8001:80"
    restart: always

```

**5)** Executar o comando `$ docker-compose.exe up -d` para criação de todos os containers
**6)** Para finalizar os containers e remover-los `$ docker-compose down`


## ![](https://img.icons8.com/ios-glyphs/20/000000/pull-request.png) Contribuições

1. Faça o _fork_ do projeto (<https://github.com/cicerorod/docker-mysql-php/fork>)
2. Crie uma _branch_ para sua modificação (`git checkout -b feature/[nome]`)
3. Faça o _commit_ (`git commit -am 'Add files [nome]'`)
4. _Push_ (`git push origin feature/[nome]`)
5. Crie um novo _Pull Request_

## ![](https://img.icons8.com/windows/20/000000/regular-document.png) Licença

Este projeto está sob a licença do MIT. Consulte [LICENSE](https://github.com/cicerorod/docker-mysql-php/blob/master/LICENSE) para obter mais informações.

## ![](https://img.icons8.com/ios-glyphs/22/000000/code-file.png) Desenvolvedor

<img src="https://avatars.githubusercontent.com/cicerorod" width=115>

[![](https://img.icons8.com/fluent/30/000000/github.png)](https://github.com/cicerorod)
[![](https://img.icons8.com/metro/25/000000/linkedin.png)](https://www.linkedin.com/in/c%C3%ADcero-rodrigues-89623784/)
[![](https://img.icons8.com/metro/25/000000/facebook.png)](https://www.facebook.com/cicero.rodrigues.90834)
[![](https://img.icons8.com/material-rounded/29/000000/instagram-new.png)](https://www.instagram.com/cicero_rod/)
[![](https://img.icons8.com/metro/26/000000/email.png)](mailto:cicerorod@gmail.com)

<p align="center">
  <img src="https://img.icons8.com/wired/32/000000/icons8-new-logo.png" >
  </br>
  <a href="https://icons8.com/icon/">Icons by Icons8</a>
</p>



