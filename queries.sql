
-- 1.1. Quantidade de vendas em unidades por Gerente no tipo de canal ʻFarmácias’;
select nome_gerente as Gerente, count(distinct(cod_fato)) as quantidade_vendas
from fato f
join pdv_dim pd
on f.cod_pdv = pd.cod_pdv
join representantes r
on r.cod_pdv = pd.cod_pdv
join canal_vendas cv
on cv.cod_canal = pd.cod_canal
where tipo_canal like "Farmacias"
group by nome_gerente;

-- 1.2. Quais as marcas que venderam mais de 500 unidades por unidade da federação;
select marca, uf
from produto_dim pd
join fato f
on pd.cod_produto = f.cod_produto
join pdv_dim pdv
on pdv.cod_pdv = f.cod_pdv
join local l
on l.cod_pdv = pdv.cod_pdv
where unidades > 500
group by uf
order by marca;

-- 1.3. Quantidade de vendas e, unidades da marca ʻVi-Ferrin’ do Gerente de código ʻ400’;
select count(distinct(cod_fato)) as Quantidade_vendas, count(unidades) as Unidades
from fato f
join produto_dim pd
on f.cod_produto = pd.cod_produto
join pdv_dim pdv
on f.cod_pdv = pdv.cod_pdv
join representantes r
on r.cod_pdv = pdv.cod_pdv
where marca like "Vi-Ferrin" and cod_gerente like "400";

/* Informe sugestões que você faria dentro desse modelo como melhoraria relacional, criação de novas tabelas e etc.
Justifique a sua sugestão*/

/*O diagrama relacional do modelo foi modificado e acrescentada uma tabela dimensao nomeada de "local", onde 
estao os campos (cod_local, bairro, cidade, uf, cod_pdv). O campo "cod_pdv" foi acrescentado como chave estrangeira para
fazer conexao com a tabela 'pdv_dim'.
Todas as tabelas foram recriadas e as tipagens dos dados refeitas, para que o relacionamento ficasse mais claro assim como a manipulaçao 
dos dados.
Em anexo a esse documento é mostrado o novo diagrama relacional das tabelas */