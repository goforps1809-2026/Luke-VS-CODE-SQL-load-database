select skills_dim.skills, count(job_postings_fact.job_id) as top_skills, type
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and job_country ='India'
group by skills_dim.skills, type
order by top_skills DESC
LIMIT 10;

/* What are the most demanded skills for a Data Analyst?
most demanded skills for a DA-
sql
pyhton
excel
tab
bi
r
azure
sas
aws