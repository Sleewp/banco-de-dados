use dbescola;
create table tbest(
IdUf tinyint primary key,
NomeUfs varchar(2) not null,
NomeEstado varchar(40) not null
);

alter table tbendereco add constraint Fk_IdUF_TbEndereco
foreign key (IdUf) references tbest(IdUf);

alter table tbest drop NomeEstado;

rename table tbest to tbEstado;

alter table tbEstado rename column NomeUfs to NomeUf;

alter table tbendereco add IdCid integer;

create table tbcidade(
IdCid integer primary key,
NomeCidade varchar(50) not null
);

alter table tbcidade modify NomeCidade varchar(250);

alter table tbendereco add constraint Fk_IdCid_TbEndereco
foreign key (IdCid) references tbCidade(IdCid);