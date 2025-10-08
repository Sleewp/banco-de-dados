create database dbdesenvolvimento;

use dbdesenvolvimento;

create table tbproduto(
    IdProp int primary key,
    NomeProd varchar(50) not null,
    Qtd int,
    DataValidade date not null,
    Preco decimal(6,2) not null
);

alter table tbproduto add Peso decimal(5,2);

alter table tbproduto add Cor varchar(50);

alter table tbproduto add Marca varchar(50) not null;

alter table tbproduto drop Cor;

alter table tbproduto modify Peso decimal(5,2) not null;

/* Não foi possível apagar porque a coluna Cor já foi apagada. */

create database dbLojaGrande;

alter table tbproduto add Cor varchar(50) not null;

create table tbcliente(
    NomeCli varchar(50) not null,
    CodigoCli int primary key,
    DataCadastro date not null
);

create table tbfuncionario(
    NomeFunc varchar(50) not null,
    CodigoFunc int primary key,
    DataCadastro datetime not null
);

drop database dbLojaGrande;

alter table tbcliente add cpf bigint not null unique;