create database sqlproject;
use sqlproject;
select * from f1;
select * from f2;
select count(*) from f1;
select count(*) from f2;

/* KPI-1 Year wise loan amount Stats */
SELECT YEAR(issue_d) AS loan_year,CONCAT('$', FORMAT(ROUND(SUM(loan_amnt) / 1000000, 2), 2), 'M') AS Loan_amount,loan_status
FROM f1 GROUP BY YEAR(issue_d),loan_status ORDER BY YEAR(issue_d);


/* KPI-2 Grade and sub grade wise revol_bal */
Select grade,sub_grade,sum(revol_bal)as revol_bal from f1 inner join f2 on f1.id=f2.ï»¿id 
group by grade,sub_grade order by grade,sub_grade;


/* KPI-3 Total Payment for Verified Status Vs Total Payment for Non Verified Status */
Select verification_status,  concat('$',format(round(sum(total_pymnt)/1000000,2),2),"M") as Totalpayment 
from f1 inner join f2 on f1.id=f2.ï»¿id 
where verification_status <> "Source Verified" group by verification_status ;


/* KPI-4 State wise and month wise loan status */
Select addr_state as state,monthname(issue_d) as month,loan_status
from f1 group by addr_state,monthname(issue_d),loan_status;


/* KPI-5 Home ownership Vs last payment date stats */
Select home_ownership,monthname(last_pymnt_d) as month,count(monthname(last_pymnt_d))as Countoflastpaymnet from f1 inner join f2 on f1.id=f2.ï»¿id 
group by last_pymnt_d,home_ownership order by home_ownership,monthname(last_pymnt_d),count(monthname(last_pymnt_d)) desc;
