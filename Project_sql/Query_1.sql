select 
    name as Company_Name, 
    job_title as Jobs, 
    salary_year_avg as Salary
from job_postings_fact
left join company_dim on job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL 
AND job_country = 'India'
order by salary DESC
limit 20;

/*
What are the top paying companies in India for Data Analysts? 
mantys
service now
bosch
srijan tech
deutesche
neilsen
truecaller
razorpay
salaries from 111k-165k