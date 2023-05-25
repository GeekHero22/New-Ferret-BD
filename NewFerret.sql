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
 periodo_estimado_de_termino int not null,
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

--- Inserts de exemplo

Insert into usuario(nome, email, senha, NiveldeAcesso ,tel, Status_usuario)
values ('Geek', 'gabrielzeferino883@gmail.com', 'LongLivefortheKing', 'adm', '11966935903', 'ativo');
go

Insert into usuario(nome, email, senha, NiveldeAcesso ,tel, Status_usuario)
values ('gui', 'guilhermeguerra@gmail.com', 'zorocdr123', 'user', '11976423487', 'ativo')
go

Insert into projeto (usuario_id, titulo, quant_membros, descricao, data_inicio, data_fim, link_projeto)
values ('1', 'Ferret', 6 ,'sistema de gerenciamento de projetos', 03/04/2022, 10/10/2023, 'ferretlink.com.br/teste');
go

insert into postagem (usuario_id, data_post,conteudo,status_post)
values ('1', 05/04/2023,'Reunião no teams as 16:00, segue o link:-', 'true')
go

insert into aviso (usuario_id, conteudo_mensagem, status_comentario, momentodeenvio)
values ('1', 'Caro amigo guilherme, devido a sua falta na reunião venho pedir para que me mande mensagem pelo whattsap e envie seu relatorio', 'true', 06/04/2023)
go

insert into Tarefa_Kanban (projeto_id, titulo, subtarefa, estado_tarefa)
values('1', 'criar telas web', 'Criar tela de projeto', 'true')
go
