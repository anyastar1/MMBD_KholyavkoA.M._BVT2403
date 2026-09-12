select d.week_start,f.channel,round( 100.0 * sum(case when f.status = 'declined' then 1 else 0 end) / sum(case when f.status in ('approved', 'declined') then 1 else 0 end) , 1) as declined_pct
from marts.fct_transactions f
join marts.dim_date d on f.date_sk = d.date_sk
where d.date_actual between '2026-08-01' and '2026-08-31'
group by 1, 2
order by 1, 2;