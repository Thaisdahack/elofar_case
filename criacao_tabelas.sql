drop table funcao_terapeutica_dim;
drop table produto_dim;
drop table principio_ativo_dim;
drop table fato;
drop table pdv_dim;
drop table canal_vendas;
drop table representantes;
drop table local;


CREATE TABLE funcao_terapeutica_dim (
    cod_funcao_terapeutica INT PRIMARY KEY AUTO_INCREMENT,
    desc_funcao_terapeutica VARCHAR(300),
    grupo_terapeutico varchar(200)
);

CREATE TABLE produto_dim (
    cod_produto INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(150),
    apresentacao varchar(300),
    cod_funcao_terapeutica int not null,
    cod_principio_ativo int not null,
    foreign key (cod_funcao_terapeutica)
		references funcao_terapeutica_dim (cod_funcao_terapeutica),
	foreign key (cod_principio_ativo)
		references principio_ativo_dim (cod_principio_ativo)
);

CREATE TABLE principio_ativo_dim (
    cod_principio_ativo INT PRIMARY KEY AUTO_INCREMENT,
    desc_principio_ativo varchar(300)
);

CREATE TABLE fato(
cod_fato INT PRIMARY KEY AUTO_INCREMENT,
cod_pdv int not null,
cod_produto int not null,
unidades int,
valor float,
foreign key (cod_pdv)
	references pdv_dim (cod_pdv),
foreign key (cod_produto)
	references produto_dim (cod_produto)
);

CREATE TABLE pdv_dim(
cod_pdv INT PRIMARY KEY AUTO_INCREMENT,
desc_pdv varchar(300),
nome_pdv varchar(150),
cnpj varchar(100),
cod_canal int not null,
foreign key (cod_canal)
	references canal_vendas (cod_canal)
);

CREATE TABLE canal_vendas(
cod_canal INT PRIMARY KEY AUTO_INCREMENT,
desc_canal varchar(300),
tipo_canal varchar(150)
);

CREATE TABLE representantes(
cod_representante INT PRIMARY KEY AUTO_INCREMENT,
cod_local int not null,
cod_pdv int not null,
nome_representante varchar(200),
cod_gerente int not null,
nome_gerente varchar(200),
foreign key (cod_pdv)
	references pdv_dim (cod_pdv),
foreign key (cod_local)
	references local (cod_local)
);

CREATE TABLE local(
cod_local INT PRIMARY KEY AUTO_INCREMENT,
bairro varchar(150),
cidade varchar(150),
uf char(2),
cod_pdv int not null,
foreign key (cod_pdv)
	references pdv_dim (cod_pdv)
    );


/* INSERINDO DADOS */

INSERT INTO canal_vendas (cod_canal, desc_canal, tipo_canal) Values ("1", 'local', 'Farmacias'),
														("2", 'local', 'Hospital'),
                                                        ("3", 'local', 'Farmacias'),
                                                        ("4", 'local', 'site')
                                                        ;

INSERT INTO funcao_terapeutica_dim (cod_funcao_terapeutica, desc_funcao_terapeutica, grupo_terapeutico) Values ("1", 'local', 'Farmacias'),
														("2", 'local', 'Hospital'),
                                                        ("3", 'local', 'Farmacias'),
                                                        ("4", 'local', 'site')
                                                        ;
INSERT INTO fato (cod_fato, cod_pdv, cod_produto, unidades, valor) Values ("1", '2', '1', '6', 250.00),
														("2", '1', '3', '5', 350.00),
                                                        ("3", '2', '1', '9', 150.00),
                                                        ("4", '3', '2', '10', 550.00)
                                                        ;
                                                        
                                                        
INSERT INTO local (cod_local, bairro, cidade, uf, cod_pdv) Values ("1", 'lagoa', 'floripa', 'SC', '2'),
															("2", 'butanta', 'Sao Paulo', 'SP', '3'),
                                                            ("3", 'lapa', 'Rio de Janeiro', 'RJ', '4'),
                                                            ("4", 'botafogo', 'Rio de Janeiro', 'RJ', '2');
 
INSERT INTO pdv_dim (cod_pdv, desc_pdv, nome_pdv, cnpj, cod_canal) Values ("1", 'oi', 'ola', '060926', '2'),
															("2", 'oi', 'Ola', '05262', '3'),
                                                            ("3", 'oi', 'ola', '252635', '1'),
                                                            ("4", 'oi', 'ola', '2252556', '3');
                                                            
INSERT INTO principio_ativo_dim (cod_principio_ativo, desc_principio_ativo) Values ("1", 'oi'),
															("2", 'oi'),
                                                            ("3", 'oi'),
															("4", 'oi');
INSERT INTO representantes (cod_representante, cod_local, cod_pdv, nome_representante, cod_gerente, nome_gerente) Values ("1", '2', '3', 'oi', '2', 'Fabio'),
															("2", '3', '1', 'oi', '3', 'Manoel'),
                                                            ("3", '1', '2', 'oi', '2', 'Thais'),
                                                            ("4", '4', '3', 'oi', '1', 'Paty');
INSERT INTO produto_dim (cod_produto, marca, apresentacao, cod_funcao_terapeutica, cod_principio_ativo) Values ("1", 'Vi-Ferrin', 'ola', '1', '2'),
															("2", 'Vi-Ferrin',  'ola', '3', '1'),
                                                            ("3", 'Blabla', 'ola', '2', '3'),
                                                            ("4", 'hey', 'ola', '4', '1');

															
