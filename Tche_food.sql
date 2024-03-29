CREATE DATABASE tche_food ;

USE tche_food;

SELECT * FROM tb_usuario ;

create table tb_usuario(
        id  int auto_increment,
        email   varchar(100) not null,
        senha   varchar(100) not null,
        nome    varchar(100) not null,
        sobrenome   varchar(100) not null,
        telefone    varchar(100),
        primary key (id));

    create table tb_categoria_endereco(
        id  int auto_increment,
        descricao   varchar(100),
        primary key(id));

    create table tb_usuario_endereco(
        id int auto_increment,
        usuario_id int,
        categoria_endereco_id int,
        padrao boolean not null,
        rua1 varchar(100) not null,
        rua2 varchar(100) null,
        cidade varchar(100) not null,
        estado varchar(50) not null,
        pais varchar(50) not null,
        primary key(id),
        FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuario` (`id`),
        FOREIGN KEY (`categoria_endereco_id`) REFERENCES `tb_categoria_endereco`(`id`));

    create table tb_categoria_produto(
        id  int auto_increment,
        descricao   varchar(100) not null,
        primary key(id)
    );


    create table tb_produto(
        id  int auto_increment,
        categoria_produto_id    int not null,
        descricao   varchar(200) not null,
        preco   double not null,
        primary key(id),
        foreign key (categoria_produto_id) references tb_categoria_produto(id));


    create table tb_promocao(
        id  int auto_increment,
        produto_id int,
        descricao   varchar(100),
        percentual  double,
        ativo   boolean,
        primary key(id),
        foreign key (produto_id) references tb_produto(id));

    create table tb_forma_pagamento(
        id int  auto_increment,
        descricao varchar(100) not null,
        primary key(id));

    create table tb_pedido(
        id  int auto_increment,
        usuario_id  int not null,
        forma_pagamento_id int not null,
        data_hora   datetime not null,
        status_pagamento    int not null,
        status_pedido int,
        total   double not null,
        primary key(id),
        foreign key (usuario_id) references tb_usuario(id),
        foreign key (forma_pagamento_id) references tb_forma_pagamento(id));

    create table tb_itens_pedido(
        id  int auto_increment,
        pedido_id   int not null,
        produto_id  int not null,
        quantidade  int not null,
        status_item int,
        primary key(id),
        foreign key (pedido_id) references tb_pedido(id),
        foreign key (produto_id) references tb_produto(id));

