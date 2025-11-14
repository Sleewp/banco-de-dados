create database ana_db;

use ana_db;

create table tbproduto (
IdProp int primary key,
NomeProd varchar(50) not null,
Qtd int,
DataValidade date not null,
Preco decimal(7,2) not null
);

alter table tbproduto add Peso float;
alter table tbproduto add Cor varchar(50);
alter table tbproduto add Marca varchar(50) not null;
alter table tbproduto drop Cor;
alter table tbproduto modify Peso float not null;
alter table tbproduto drop DataValidade;