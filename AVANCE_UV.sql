SELECT r.region_name Región, count(c.corp_no) Cantidad_Empresas FROM CreditBackup.dbo.corporation c 
left join CreditBackup.dbo.region r 
on c.region_no = r.region_no 
GROUP by r.region_name 

SELECT r.region_name Región, max(c.corp_name)  Corporación, count(p.payment_no) Cantidad_Transacciones FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no  
left join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
left join CreditBackup.dbo.corporation c
on m.corp_no  = c.corp_no 
GROUP by r.region_name
ORDER by count(p.payment_no) desc

SELECT r.region_name Región,max(c.corp_name) Corporación, count(p.payment_no) Cantidad_Transacciones FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no  
left join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
left join CreditBackup.dbo.corporation c
on m.corp_no  = c.corp_no 
GROUP by r.region_name
ORDER by count(p.payment_no) desc

SELECT distinct c.region_no  Región_ID
FROM CreditBackup.dbo.corporation c
INNER JOIN(
SELECT  c.corp_no  Corporación, p.payment_amt  Ingresos FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no  
left join CreditBackup.dbo.corporation c
on m.corp_no  = c.corp_no 
group by c.corp_no,p.payment_amt ) a
ON c.corp_no = a.Corporación
GROUP BY c.region_no , a.Ingresos
ORDER by a.Ingresos desc

SELECT   r.region_name Región, MAX(c.corp_name) Corporación, sum( p.payment_amt) Ingresos FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no  
left join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
left join CreditBackup.dbo.corporation c
on m.corp_no  = c.corp_no 
GROUP by r.region_name
ORDER by  sum( p.payment_amt) desc

SELECT SUM(p.payment_amt) Ingresos FROM CreditBackup.dbo.payment p 

SELECT r.region_name Región, p.payment_amt Ingresos FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no  
left join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
left join CreditBackup.dbo.corporation c
on m.corp_no  = c.corp_no 
where r.region_name = 'Western Europea' and c.corp_name = 'Corp. Just Sail MakersLtd.'
group by r.region_name,p.payment_amt



SELECT count(p.payment_no) Préstamos_Cancelados  FROM CreditBackup.dbo.payment p 
left join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no 
where m.curr_balance  = 0

SELECT r.region_name Región,sum(p.payment_amt) Monto_Pendiente FROM CreditBackup.dbo.payment p 
inner join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no 
inner join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
where m.curr_balance != 0
GROUP by r.region_name

SELECT r.region_name Región,max(m.member_no) Miembro_ID, count(p.payment_no) Cantidad_Transacciones FROM CreditBackup.dbo.payment p 
inner join CreditBackup.dbo.[member] m 
on p.member_no = m.member_no 
inner join CreditBackup.dbo.region r 
on m.region_no = r.region_no 
GROUP by r.region_name
ORDER by count(p.payment_no) desc

SELECT c.provider_no, c.charge_amt FROM CreditBackup.dbo.charge c 
left join CreditBackup.dbo.provider p 
on c.provider_no =p.provider_no 
group by c.provider_no ,c.charge_amt
order by c.provider_no 


