select dm.merchant_name,round(sum(f.amount_rub)) as turnover_rub
from marts.fct_transactions f
join marts.dim_client dc on f.client_sk = dc.client_sk
join marts.dim_merchant dm  on f.merchant_sk = dm.merchant_sk
where dc.segment = 'premium'and f.status = 'approved'
group by 1
order by 2 desc
limit 5;