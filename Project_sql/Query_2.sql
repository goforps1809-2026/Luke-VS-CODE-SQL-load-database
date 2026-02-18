with new_table as (select * 
from job_postings_fact as JB
left join company_dim on JB.company_id = company_dim.company_id
inner join skills_job_dim as SB on JB.job_id = SB.job_id
where job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_country = 'India'
)
select new_table.name as company_name, new_table.job_title,SD.skills, 
new_table.salary_year_avg as salary
from new_table
inner join skills_dim as SD
on new_table.skill_id = SD.skill_id
order by salary DESC;

/* What are the skills required by the top paying companies in  Data Analytics?
-spark
pandas
unix
sap
oracle
sql 
python
aws
mongodb
postgres
bi
excel
jira
tab 
r

salries 60k- 165k