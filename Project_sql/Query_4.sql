select round(avg(salary_year_avg),2) as Average_Salary ,skills_dim.skills,type
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and salary_year_avg is not NULL 
and job_country ='India'
group by skills_dim.skills, type
order by Average_Salary DESC
LIMIT 15;

/* Which are the top payings skills?

top paying skills for a DA is - 
postgres sql
mysql
linux
gdpr,airflow
databricks
scala
pandas
confluence

119k - 165k