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
tel varchar(11) not NULL,
Status_usuario VARCHAR(20) not null,
primary key (id),
)

create table projeto
(
 id int identity not null,
 usuario_id int not null,
 cronograma_id int not null,
 titulo varchar(40) not null,
 quant_membros int not null,
 descricao varchar(1000) not null,
 data_inicio smalldatetime not null,
 tempo_previsto int not null, -- determinaremos um valor numerico para cada opção
 informacoes_graph int not null, --valores numericos colocados no gráfico
 informacoes_string varchar(400) not null, -- nomes das informações do gráfico
 primary key(id),
 foreign key(usuario_id) references usuario(id)
)

create table cronograma
(
  id int identity not null,
  projeto_id int not null,
  nome_tarefa varchar(30) not null, 
  data_de_entrega smalldatetime not null,
   primary key(id),
   foreign key(projeto_id) references projeto(id)

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

create table postagem --mensagens do adm na tela de projeto para os usuários médios
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
conteudo varchar(500) not null, -- "ativade X(titulo_kanban) foi realizada"
momentodeenvio smalldatetime not null,
primary key(id),
foreign key(usuario_id) references usuario(id),
)

create table link_projeto --necessário?
(
id int identity not null,
projeto_id int not null,
link varchar(200) not null,
primary key (id),
foreign key(projeto_id) references projeto(id)
)

create table Tarefa_Kanban
(
id int identity not null,
projeto_id int not null, 
titulo varchar(30) not null,
estado_tarefa varchar(15) not null,
primary key (id),
foreign key(projeto_id) references projeto(id)
)

-- vale a pena utilizar o int na duração do projeto?
-- criar uma tabela só pra gráfico?
--como utilizar o varbinary(max)?

