select dc.federal_district, round(sum(f.amount_rub)) as turnover_rub
from marts.fct_transactions f
join marts.dim_date d    on f.date_sk = d.date_sk
join marts.dim_client dc on f.client_sk = dc.client_sk
where f.status = 'approved'and f.channel in ('pos', 'ecom') and d.date_actual between '2026-07-01' and '2026-07-31'
group by 1
order by 2 desc;