-- Kauan
create database dbescola;

use dbescola;

create table tbcliente (
IdCli integer primary key,
NomeCli varchar(50) not null,
NumEnd smallint,
DataCadastro datetime default CURRENT_TIMESTAMP()
);

alter table tbcliente add CPF decimal(11,0) unique not null;

alter table tbcliente add Cep decimal(5,0);

create database dbempresa;

create table tbendereco (
Cep decimal(5,0) primary key,
Logradouro varchar(250) not null,
IdUf tinyint
);

alter table tbcliente add constraint Fk_Cep_tbCliente
foreign key (Cep) references tbendereco(Cep);

describe tbcliente;
/*
	1- lembrar a sintaxe de cada coisa
    2- adicionar chave secundária com alter
    3- saber quando restringir numeros inteiros
*/

show databases;

drop database dbempresa;