create database dbDistribuidora;

use dbDistribuidora;

create table tbFornecedor(
    Codigo int primary key,
    CNPJ decimal(14,0),
    Nome varchar(200) not null,
    Telefone decimal(11,0)
);

create table tbCompra(
    NotaFiscal int primary key,
    DataCompra date not null,
    ValorTotal decimal(8,2) not null,
    QtdTotal int not null,
    Codigo int,
    foreign key(Codigo) references tbFornecedor(Codigo)
);

create table tbProduto(
    CodigoBarras decimal(14,0) primary key,
    Nome varchar(200) not null,
    Valor decimal(8,2) not null,
    Qtd int
);

create table tbItemCompra(
    NotaFiscal int, 
    CodigoBarras decimal(14,0),
    ValorItem decimal(8,2) not null,
    Qtd int not null,
	foreign key(NotaFiscal) references tbCompra(NotaFiscal),
    foreign key(CodigoBarras) references tbProduto(CodigoBarras)
);
alter table tbItemCompra add primary key(NotaFiscal, CodigoBarras);

create table tbNota_Fiscal(
    NF int primary key,
    TotalNota decimal(8,2) not null,
    DataEmissao date not null
);

create table tbBairro(
    BairroId int primary key,
    Bairro varchar(200) not null
);

create table tbCidade(
    CidadeId int primary key auto_increment,
    Cidade varchar(200) not null
);

create table tbEstado(
    UFId int primary key auto_increment,
    UF char(2) not null
);

create table tbEndereco(
    Logradouro varchar(200) not null,
    Cep decimal(8,0) primary key,
    BairroId int,
    CidadeId int,
    UFId int,
    foreign key(BairroId) references tbBairro(BairroId),
    foreign key(CidadeId) references tbCidade(CidadeId),
    foreign key(UFId) references tbEstado(UFId)
);

create table tbCliente(
    Id int primary key auto_increment,
    NomeCli varchar(200) not null,
    NumEnd decimal(6,0) not null,
    CompEnd varchar(50),
    Cep decimal(8,0) not null,
    foreign key(Cep) references tbEndereco(Cep)
);

create table tbClientePF(
    CPF decimal(11,0) primary key,
    RG decimal(9,0) not null,
    RG_Dig char(1) not null,
    Nasc date not null
    Id int,
    foreign key(Id) references tbCliente(Id)
);

create table tbClientePJ(
    CNPJ decimal(14,0) primary key,
    IE decimal(11,0) unique,
    Id int,
    foreign key(Id) references tbCliente(Id)
);

create table tbProduto(
    CodigoBarras decimal(14,0) primary key,
    Nome varchar(200) not null,
    Valor decimal(8,2) not null
    Qtd int
);

create table tbVenda(
    NumeroVenda int primary key,
    DataVenda date not null,
    TotalVenda decimal(8,2) not null,
    Id int not null,
    NF int,
    foreign key(Id) references tbCliente(Id),
    foreign key(NF) references tbNota_Fiscal(NF)
);

create table tbItemVenda(
    NumeroVenda int,
    CodigoBarras decimal(14,0),
    ValorItem decimal(8,2) not null,
    Qtd int not null
);