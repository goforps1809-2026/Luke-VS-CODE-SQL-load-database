# Introduction
This project is about knowing the Data Analyst job market and answers some the basic questions all job seekers and hirers should know. It deep dives into the skills and company related insights for the role. 

This Project answer some the questions like-
1. What are the top paying Companies for Data Analyst?
2. What are the skills required by the top companies?
3. What are the most demanded skills?
4. What are the hihghest paying skills for a Data Analyst?
5. What are the must have skills to become a Data Analyst? 
# Tools I Used
- SQL - The backbone of my analysis, allowing me to query the database and unearth critical insights. 
- VS Code - My go-to for database management and executing SQL queries.
- Git&Git Hub - Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
- PostgreSQL - The chosen database management system, ideal for handling the job posting data.
# The Analysis 
### 1. Top Paying Companies For Data Analyst
To identify the highest paying companies for this role, I filtered the Data Analyst job position based on salary and company specific to country location India. This query highlights the high paying opportunities in this field. 

```sql
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
```
Here is a breakdown for this insight - 
- Wide Salary Range - Salaries start from 111000 and go upto 165000, indicating significant salary potential in this field. 
- Diverse Employers - Companies like Mantys, Bosch, Srijan tech,Deutesche are among those offering high salaries, showing a broad interest across different industries. 
- Various Types of Data Analyst Roles - Highest paying Data Analyst roles include Data Architect, Senior Business & Data Analyst reflecting varied roles and specialization in the field of Data Analytics.

![Top Paying Co](images\top_paying_co.png)

### 2. Skills Required by Top Paying Companies
To identify which skills have higher ranging Salaries, I filtered Skills based on companies which paid the highest salary for Data Analyst Roles. 

```sql
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
```
![top pay skills by co](images\image.png)

Here is a breakdown for this insight - 
1. Razor Pay Data Analyst - SQL, excel, dax, looker are paid around 111k. 
2. DoorDash Data Analyst - SQL, R. go, Airflow, Excel, Tableau are paid around 111k.
3. Deutsche Bank Data Analyst - Jira, Visio, Excel, SQL, Confuence are paid around 119k.

### 3. Most Demanded skills for Data Analyst
This query helped in identifying the skills most requested in job postings, directing focus to areas with high demand.

```sql
select skills_dim.skills, count(job_postings_fact.job_id) as top_skills, type
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and job_country ='India'
group by skills_dim.skills, type
order by top_skills DESC
LIMIT 10;
```

Here is a breakdown for this insight -
- SQL, Excel remain fundamental, emphasizing strong foundational skills in data processing and spreadsheet manipulation. 
- Programming and Visualization tools like Python, Tableau, Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.
![alt text](<most demanded skills.png>)

### 4. Top Paying Skills
Exploring average salaries associated with differennt skills revealed which skills are highest paying. 

```sql
select round(avg(salary_year_avg),2) as Average_Salary ,skills_dim.skills
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and salary_year_avg is not NULL 
and job_country ='India'
group by skills_dim.skills
order by Average_Salary DESC
LIMIT 15;
```
Here is a breakdown for this insight -
- Skills from Linux, Mysql, airflow, databricks, confluence are in most demand for salary ranges 119250 to 165000. 
- These technical skills represent a high-level Data Engineering, Big Data Analytics, or Advanced Data Science skillset. 

![alt text](<tp pay skill.png>)

### 5. Salary and Demand for Data Analyst Skills
Combining insights from Demand and Salary data, this query aimed to pinpoint skills that are both high in demand and have high salaries, offering a strategic focusfor skill development.

```sql
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
order by skills_in_demand DESC, salary DESC;
```
Here's a breakdown for this insight -
- Top skills in demand include SQL, Excel, Python, Tableau, Power BI with salary starting from 79k and going upto 111k. 

# What I Learned
1. With this project I have learned downloading database into VS code and used SQL to draw actionable insights from the data. 
2. I have learned to pipeline analysis into a project and publish into Git Hub. 
3. Through this data I was able to learn about Job analysis based on various parameters like Skills, Pay, Job Location, Job Type. 
4. Overview , data manipulation, visualization and analysis have made this project complete. 
5. I have used Inner Join, Left Join, CTE's , Group By to draw insights from the data. 

# Conclusions
Data Analysis not only involves analysing and cleaning. It goes beyond this. To analyse data which help in drawing conclusions. 

Through this project we were able to know -
1. Top companies that pay highest for a Data Analyst role.
2. Most demanded skills.
3. Optimal Data analyst skills.
4. Top paying Skills for a Data Analyst

Primarily, skills like Excel, SQL, Tableau, Pythin and Power BI are must have to be a Data Analyst. To get better leveraged salaries other skills like AWZ, azure, Pyspark and other skills which have been drawn from insights above are crucial.
