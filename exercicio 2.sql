create database willian;

use willian;

create table tbProduto (
idProp int primary key,
nomeProd varchar(50) not null,
Qtd int,
DataValidade date not null,
Preco decimal(7,2) not null
);

create table tbCliente (
Codigo int primary key,
NomeCli varchar(50) not null,
DataNascimento date
);

