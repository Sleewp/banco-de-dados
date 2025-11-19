create database dbDistribuidora;

use dbDistribuidora;

create table tbFornecedor(
    Codigo int primary key auto_increment,
    CNPJ decimal(14,0) unique,
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
    foreign key(CodigoBarras) references tbProduto(CodigoBarras),
    primary key(NotaFiscal, CodigoBarras)
);

create table tbNota_Fiscal(
    NF int primary key,
    TotalNota decimal(8,2) not null,
    DataEmissao date not null
);

create table tbBairro(
    BairroId int primary key auto_increment,
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

create table tbCliente_pf(
    CPF decimal(11,0) primary key,
    RG decimal(9,0) not null,
    RG_Dig char(1) not null,
    Nasc date not null,
    Id int,
    foreign key(Id) references tbCliente(Id)
);

create table tbCliente_pj(
    CNPJ decimal(14,0) primary key,
    IE decimal(11,0) unique,
    Id int,
    foreign key(Id) references tbCliente(Id)
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
    Qtd int not null,
    foreign key(NumeroVenda) references tbVenda(NumeroVenda),
    foreign key(CodigoBarras) references tbProduto(CodigoBarras),
    primary key(NumeroVenda, Codigobarras)
);

-- DML 
-- exercício 1
insert into tbFornecedor
values 
	(1, 1245678937123, "Revenda Chico Loco", 11934567897),
	(2, 1345678937123, "José Faz Tudo S/A", 11934567898),
    (3, 1445678937123, "Vadalto Entregas", 11934567899),
    (4, 1545678937123, "Astrogildo das Estrela", 11934567800),
    (5, 1645678937123, "Amoroso e Doce", 11934567801),
    (6, 1745678937123, "Marcelo Dedal", 11934567802),
    (7, 1845678937123, "Franciscano Cachaça", 11934567803),
    (8, 1945678937123, "Joãozinho Chupeta", 11934567804);

-- exercício 2
delimiter $$
create procedure inserirCidade (CidadeId int,Cidade varchar(200))
begin
insert into tbCidade (CidadeId,Cidade)
			   values(CidadeId,Cidade);
end $$
delimiter ;

call inserirCidade(1, "Rio de Janeiro");
call inserirCidade(2, "São carlos");
call inserirCidade(3, "Campinas");
call inserirCidade(4, "Franco da Rocha");
call inserirCidade(5, "Osasco");
call inserirCidade(6, "Pirituba");
call inserirCidade(7, "Lapa");
call inserirCidade(8, "Ponta Grossa");

-- exercício 3
delimiter $$
create procedure inserirEstado (UFId int,UF char(2))
begin
insert into tbEstado
values(UFId,UF);
end $$
delimiter ;

call inserirEstado(1, "SP");
call inserirEstado(2, "RJ");
call inserirEstado(3, "RS");

-- exercício 4
delimiter $$
create procedure inserirBairro (BairroId int,Bairro varchar(200))
begin
insert into tbBairro
values(BairroId,Bairro);
end $$
delimiter ;

call inserirBairro(1, "Aclimação");
call inserirBairro(2, "Capão Redondo");
call inserirBairro(3, "Pirituba");
call inserirBairro(4, "Liberdade");

-- exercício 5
delimiter $$
create procedure inserirProduto (CodigoBarras decimal(14,0),Nome varchar(200),Valor decimal(8,2),Qtd int)
begin
insert into tbProduto
values(Codigobarras,Nome,Valor,Qtd);
end $$
delimiter ;

call inserirProduto(12345678910111, "Rei de Papel Mache", 54.61, 120);
call inserirProduto(12345678910112, "Bolinha de Sabão", 100.45, 120);
call inserirProduto(12345678910113, "Carro Bate", 44.00, 120);
call inserirProduto(12345678910114, "Bola Furada", 10.00, 120);
call inserirProduto(12345678910115, "Maçã Laranja", 99.44, 120);
call inserirProduto(12345678910116, "Boneco do Hitler", 124.00, 200);
call inserirProduto(12345678910117, "Farinha de Suruí", 50.00, 200);
call inserirProduto(12345678910118, "Zelador de Cemitério", 24.50, 100);

-- exercício 6
call inserirCidade(9, "São Paulo");
call inserirCidade(10, "Barra Mansa");
call inserirBairro(5, "Consolação");
call inserirBairro(6, "Penha");
call inserirBairro(7, "Barra Funda");
delimiter $$
create procedure inserirEndereco(
	Logradouro varchar(200),
    Cep decimal(8,0),
    BairroId int,
    CidadeId int,
    UFId int)
begin
insert into tbEndereco
values(Logradouro,Cep,BairroId,CidadeId,UFId);
end $$
delimiter ;

call inserirEndereco("Rua da Federal", 12345050, 7, 9, 1);
call inserirEndereco("Av Brasil", 12345051, 7, 3, 1);
call inserirEndereco("Rua Liberdade", 12345052, 5, 9, 1);
call inserirEndereco("Av Paulista", 12345053, 6, 1, 2);
call inserirEndereco("Rua Ximbú", 12345054, 6, 3, 2);
call inserirEndereco("Rua Piu XI", 12345055, 6, 3, 1);
call inserirEndereco("Rua Chocolate", 12345056, 1, 10, 2);
call inserirEndereco("Rua Pão na Chapa", 12345057, 7, 8, 3);

-- exercícios 7 e 8
delimiter $$
create procedure inserirCliente(    
	Id int,
    NomeCli varchar(200),
    NumEnd decimal(6,0),
    CompEnd varchar(50),
    Cep decimal(8,0))
begin
insert into tbCliente
values(Id,NomeCli,NumEnd,CompEnd,Cep);
end $$
delimiter ;

call inserirBairro(8, "Jardim Santa Isabel");
call inserirBairro(9, "Sei Lá");
call inserirCidade(11, "Cuiabá");
call inserirCidade(12, "Recife");
call inserirEstado(4, "MT");
call inserirEstado(5, "PE");
call inserirEndereco("Av Nova", 12345058, 8, 11, 4);
call inserirEndereco("Rua Veia", 12345059, 8, 11, 4);
call inserirEndereco("Rua dos Amores", 12345060, 9, 12, 5);
call inserirCliente(1, "Pimpão", 325, null, 12345051);
call inserirCliente(2, "Disney Chaplin", 89, "Ap. 12", 12345053);
call inserirCliente(3, "Marciano", 744, null, 12345054);
call inserirCliente(4, "Lança Perfume", 128, null, 12345059);
call inserirCliente(5, "Remédio Amargo", 2585, null, 12345058);
call inserirCliente(6, "Paganada", 159, null, 12345051);
call inserirCliente(7, "Caloteando", 69, null, 12345053);
call inserirCliente(8, "Semgrana", 189, null, 12345060);
call inserirCliente(9, "Cemreais", 5024, "Sala 23", 12345060);
call inserirCliente(10, "Durango", 1254, null, 12345060);

delimiter $$
create procedure inserirClientePf(    
	CPF decimal(11,0),
    RG decimal(9,0),
    RG_Dig char(1),
    Nasc date,
    Id int)
begin
insert into tbCliente_pf
values(CPF,RG,RG_Dig,Nasc,Id);
end $$
delimiter ;

call inserirClientePf(12345678911, 12345678, "0", '2000-10-12', 1);
call inserirClientePf(12345678912, 12345679, "0", '2001-11-21', 2);
call inserirClientePf(12345678913, 12345680, "0", '2001-06-01', 3);
call inserirClientePf(12345678914, 12345681, "X", '2004-04-05', 4);
call inserirClientePf(12345678915, 12345682, "0", '2002-07-15', 5);

delimiter $$
create procedure inserirClientePj(    
	CNPJ decimal(14,0),
    IE decimal(11,0),
    Id int)
begin
insert into tbCliente_pj
values(CNPJ,IE,Id);
end $$
delimiter ;

call inserirClientePj(12345678912345, 98765432198, 6);
call inserirClientePj(12345678912346, 98765432199, 7);
call inserirClientePj(12345678912347, 98765432100, 8);
call inserirClientePj(12345678912348, 98765432101, 9);
call inserirClientePj(12345678912349, 98765432102, 10);

-- exercício 9
delimiter $$
create procedure inserirCompras(    
	NotaFiscal int,
	Codigo int,
    DataCompraBr char(10),
    CodigoBarras decimal(14,0),
	ValorItem decimal(8,2),
    Qtd int,
	QtdTotal int,
    ValorTotal decimal(8,2))
begin
if not exists(select NotaFiscal from tbCompra where tbCompra.NotaFiscal = NotaFiscal) then
	insert into tbCompra(NotaFiscal,Codigo,DataCompra,QtdTotal,ValorTotal)
	values(NotaFiscal,Codigo,Str_to_date(DataCompraBr,'%d/%m/%Y'),QtdTotal,ValorTotal);
end if;

insert into tbItemCompra(NotaFiscal,CodigoBarras,ValorItem,Qtd)
values(NotaFiscal,CodigoBarras,ValorItem,Qtd);
end $$
delimiter ;

call inserirCompras(8459, 5, '01/05/2018', 12345678910111, 22.22, 200, 700, 21944.00);
call inserirCompras(2482, 1, '22/04/2020', 12345678910112, 40.50, 180, 180, 7290.00);
call inserirCompras(21563, 6, '12/07/2020', 12345678910113, 3.00, 300, 300, 900.00);
call inserirCompras(8459, 5, '01/05/2018', 12345678910114, 35.00, 500, 700, 21944.00);
call inserirCompras(156354, 1, '23/11/2021', 12345678910115, 54.00, 350, 350, 18900.00);

-- exercício 10
delimiter $$
create procedure inserirVendas(  
	NumeroVenda int,
    Id int,
	CodigoBarras decimal(14,0),
    Qtd int,
    TotalVenda decimal(8,2))
begin
declare v_ValorItem decimal(8,2);
select Valor into v_ValorItem
from tbProduto
where tbProduto.CodigoBarras = CodigoBarras;

insert into tbVenda(NumeroVenda,Id,DataVenda,TotalVenda)
values(NumeroVenda,Id,curdate(),TotalVenda);

insert into tbItemVenda(NumeroVenda,CodigoBarras,ValorItem,Qtd)
values(NumeroVenda,CodigoBarras,v_ValorItem,Qtd);
end $$
delimiter ;

call inserirVendas(1,1,12345678910111,1,54.61);
call inserirVendas(2,4,12345678910112,2,200.90);
call inserirVendas(3,1,12345678910113,1,44.00);

-- exercício 11
SELECT SUM(TotalVenda)
FROM tbVenda
WHERE Id = 1;

insert into tbNota_Fiscal(NF,TotalNota,DataEmissao)
values(359, 98.61, curdate());
update tbVenda set NF = 359 where Id = 1;

SELECT SUM(TotalVenda)
FROM tbVenda
WHERE Id = 4;

insert into tbNota_Fiscal (NF,TotalNota,DataEmissao)
values(360, 200.90, curdate());
update tbVenda set NF = 360 where Id = 4;

-- exercício 12
call inserirProduto(12345678910130, "Camiseta de Poliéster", 35.61, 100);
call inserirProduto(12345678910131, "Blusa Frio Moletom", 200.00, 100);
call inserirProduto(12345678910132, "Vestido Decote Redondo", 144.00, 50);

-- exercício 13
delimiter $$
create procedure apagarProduto(
	CodigoBarras decimal(14,0))
begin
delete from tbProduto where tbProduto.CodigoBarras = CodigoBarras;
end $$
delimiter ;

call apagarProduto(12345678910116);
call apagarProduto(12345678910117);

-- exercício 14
delimiter $$
create procedure atualizarProduto(    
	CodigoBarras decimal(14,0),
    new_Nome varchar(200),
    new_Valor decimal(8,2))
begin
update tbProduto
set Nome = new_Nome, Valor = new_Valor
where tbProduto.CodigoBarras = CodigoBarras;
end $$
delimiter ;

call atualizarProduto(12345678910111, "Rei de Papel Mache", 64.50);
call atualizarProduto(12345678910112, "Bolinha de Sabão", 120.00);
call atualizarProduto(12345678910113, "Carro Bate Bate", 64.00);

-- exercício 15
delimiter $$
create procedure mostrarProdutos()
begin
select * from tbProduto;
end $$
delimiter ;