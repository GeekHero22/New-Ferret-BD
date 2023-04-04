USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'NewFerret')
DROP DATABASE NewFerret
GO

CREATE DATABASE NewFerret
GO

USE NewFerret
GO



create table usuario
(
id int identity not null,
nome varchar(60) not null,
email varchar(60) not null,
senha varchar(50) not null,
NiveldeAcesso VARCHAR(10) NULL, --ADM, USER
foto varbinary(max) null,
tel varchar(20) not NULL,
Status_usuario VARCHAR(20) not null,
primary key (id),
)

create table projeto
(
 id int identity not null,
 usuario_id int not null,
 titulo varchar(40) not null,
 quant_membros int not null,
 descricao varchar(1000) not null,
 data_inicio smalldatetime not null,
 data_fim smalldatetime not null,
 tarefas varchar(max) not null,
 link varchar(200) not null,
 primary key(id),
 foreign key(usuario_id) references usuario(id)
)

create table projeto_usuario
(
id int identity not null,
projeto_id int not null,
usuario_id int not null,
adm bit not null,
primary key(id),
foreign key(projeto_id) references projeto(id),
foreign key(usuario_id) references usuario(id)
)

create table postagem
(
id int identity not null,
usuario_id int  not null,
data_post smalldatetime not null,
conteudo varchar(500) not null,
img varbinary(max) null,
status_post bit not null,
primary key(id),
foreign key(usuario_id) references usuario(id)
)

create table aviso
(
id int identity not null,
usuario_id int not null,
conteudo_mensagem varchar(500) not null,
status_comentario bit not null,
momentodeenvio smalldatetime not null,
primary key(id),
foreign key(usuario_id) references usuario(id),
)


create table Tarefa_Kanban
(
id int identity not null,
projeto_id int not null,
titulo varchar(30) not null,
subtarefa varchar(50) null,
estado_tarefa bit not null, --Feita ou não feita
primary key (id),
foreign key (projeto_id) references projeto(id)
)
create table Grafico -- Standby no momento
(
 id int identity not null,
 projeto_id int not null,
 informacoes_graph int not null,
 informacoes_string varchar(400) not null,
 primary key(id),
 foreign key(projeto_id) references projeto(id)
)
