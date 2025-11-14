create database dbKauan;

use dbKauan;

create table tbUsuario(
IdUsuario integer primary key,
NomeUsuario varchar(45),
DataNascimento date
);

create table tbEstado(
Id integer primary key,
Uf char(2)
);

create table tbCliente(
CodigoCli integer primary key check(CodigoCli between 0 and 65000),
Nome varchar(50),
Endereco varchar(60)
);

create table tbProduto(
Barras decimal(13,0) primary key,
Valor decimal(8,4),
Descricao varchar(200)
);

describe tbProduto;

show tables;

show databases;

alter table tbCliente modify Nome varchar(58);

alter table tbProduto add Qtd integer;

drop table tbEstado;

alter table tbUsuario drop DataNascimento;
