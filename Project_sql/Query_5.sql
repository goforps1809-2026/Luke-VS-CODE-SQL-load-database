select job_postings_fact.job_title_short,
count(job_postings_fact.job_id) as skills_in_demand,
skills_dim.skills , job_postings_fact.salary_year_avg as salary
from job_postings_fact
inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and salary_year_avg is not NULL 
and job_country ='India'
group by job_postings_fact.job_title_short, skills_dim.skills, 
job_postings_fact.salary_year_avg
order by skills_in_demand DESC, salary DESC
limit 10;

/* What are the optimal skills for a Data Analyst based on demand and salary?
- Must have skills for DA sql,excel,python, 
tableau, bi,spark,azure,aws 
for salaries ranging from 111k to 32k.




