use dbBANCO;

delete from tbtelefone_cliente where Cpf = 12345678911;

update tbconta set TipoConta = 2 where NumeroConta = 9879;

update tbcliente set Email = "Astro@Escola.com" where Cpf = 12345678912;

update tbconta set saldo = saldo*1.10 where NumeroConta = 9876;
-- deu aviso porque o máximo de casas decimais são 2, mas tentou por 3

select Nome, Email, Endereco from tbcliente where CPF = 12345678912;

update tbcliente set Nome = "Enildo Candido", Email = "enildo@escola.com" where Cpf = 12345678910;

update tbconta set saldo = saldo-30;
-- precisei desativar o safe mode

delete from tbconta where NumeroConta = 9878;