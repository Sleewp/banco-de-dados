create database dbBANCO;

use dbBANCO;

create table tbbanco (
Codigo integer primary key,
Nome varchar(50) not null
);

create table tbagencia(
CodBanco integer,
NumeroAgencia integer primary key,
Endereco varchar(50) not null
);

create table tbconta (
NumeroConta integer primary key,
Saldo decimal(8,2),
TipoConta smallint,
NumeroAgencia integer not null
);

alter table tbconta add foreign key(NumeroAgencia) references tbagencia(NumeroAgencia);

create table tbhistorico (
Cpf bigint,
NumeroConta integer,
DataInicio date
);

create table tbcliente (
Cpf bigint primary key,
Nome varchar(50) not null,
Sexo char(1) not null,
Endereco varchar(50) not null
);

alter table tbhistorico add foreign key(Cpf) references tbcliente(Cpf);
alter table tbhistorico add foreign key(NumeroConta) references tbconta(NumeroConta);

create table tbtelefone_cliente (
Cpf bigint,
Telefone integer primary key
);

alter table tbagencia add foreign key(CodBanco) references tbbanco(Codigo);

alter table tbtelefone_cliente add foreign key(Cpf) references tbcliente(Cpf);

alter table tbhistorico add primary key(Cpf, NumeroConta);

insert into tbbanco
values(1, "Banco do Brasil");
insert into tbbanco
values(104, "Caixa Economica Federal");
insert into tbbanco
values(801, "Banco Escola");

insert into tbagencia 
values(1,123,"Av Paulista,78");
insert into tbagencia
values(104,159,"Rua Liberdade, 124");
insert into tbagencia
values(801,401,"Rua vinte três, 23");
insert into tbagencia
values(801,485,"Av Marechal, 68");

insert into tbcliente
values(12345678910,"Enildo","M","Rua Grande, 75");
insert into tbcliente
values(12345678911,"Astrogildo","M","Rua Pequena, 789");
insert into tbcliente
values(12345678912,"Monica","F","Av Larga, 148");
insert into tbcliente
values(12345678913,"Cascão","M","Av Principal, 369");

insert into tbconta
values(9876,456.05,1,123);
insert into tbconta
values(9877,321.00,1,123);
insert into tbconta
values(9878,100.00,2,485);
insert into tbconta
values(9879,5589.48,1,401);

insert into tbhistorico
values(12345678910,9876,"2001-04-15");
insert into tbhistorico
values(12345678911,9877,"2011-03-10");
insert into tbhistorico
values(12345678912,9878,"2021-03-11");
insert into tbhistorico
values(12345678913,9879,"2000-07-05");

insert into tbtelefone_cliente
values(12345678910,912345678);
insert into tbtelefone_cliente
values(12345678911,912345679);
insert into tbtelefone_cliente
values(12345678912,912345680);
insert into tbtelefone_cliente
values(12345678913,912345681);

alter table tbcliente add Email varchar(70);

select cpf, endereco from tbcliente where Nome = "Monica";
select NumeroAgencia, Endereco from tbagencia;
select * from tbcliente where Sexo = "M";