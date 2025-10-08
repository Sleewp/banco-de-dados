create database dbCatia;

use dbCatia;

create table tbVenda(
    NF int primary key auto_increment,
    DataValidade datetime not null,
    CodigoB bigint
);

alter table tbVenda add Preco decimal (6,2) not null;

alter table tbVenda add Qtd smallint;

alter table tbVenda drop DataValidade;

alter table tbVenda add DataVenda datetime default current_timestamp();

create table tbProduto(
    CodigoB bigint primary key,
    NomeProd varchar(50) not null
);

alter table tbVenda add foreign key(CodigoB) references tbProduto(CodigoB);