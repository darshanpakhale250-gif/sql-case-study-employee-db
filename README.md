# SQL Case Study — Employee Database

**Short description:**  
A Microsoft SQL Server case study containing schema creation scripts, sample data inserts, and a wide variety of SQL exercises (queries, joins, aggregation, grouping, subqueries, updates). Good for practice and demos.

---

## Contents / Repo structure
├─ LICENSE
├─ .gitignore
├─ requirements.txt
├─ sql/
│ ├─ create_database_case2.sql # Create DB, tables, insert data
│ ├─ sample_queries.sql # Collection of SELECT/UPDATE examples
│ └─ helpers.sql 
├─ docs/
│ └─ SQL-Case-Study-2-1.docx # Case study document (exercises)
├─ text/
│ └─ create_database_case2.sql
└─ exports/
└─ sample_output.txt 


---

## Files included
- `sql/create_database_case2.sql` — main SQL script: `CREATE DATABASE`, `CREATE TABLE`, `INSERT` statements for `LOCATION`, `DEPARTMENT`, `JOB69`, `EMPLOYEE`.  
- `text/create_database_case2.txt` — plain-text version of the above (for non-SQL clients).  
- `docs/SQL-Case-Study-2-1.docx` — original case study questions/exercises (upload from course).  
- `sql/sample_queries.sql` — curated queries covering WHERE, ORDER BY, GROUP BY/HAVING, JOINs, subqueries, windowing examples, UPDATE, etc.  
- `.gitignore` — excludes common editor, system and backup files.  
- `requirements.txt` — optional Python packages for automation or analysis (if you want to run queries from Python).

---

## How to run (Microsoft SQL Server)

### Using SQL Server Management Studio (SSMS)
1. Open SSMS and connect to your SQL Server instance.  
2. Open `sql/create_database_case2.sql`.  
3. Execute the script (F5 or click Execute). This will:
   - Create database `case2` (if included),
   - Create tables: `LOCATION`, `DEPARTMENT`, `JOB69`, `EMPLOYEE`,
   - Insert sample rows.


### Using `sqlcmd` (command line)
```bash

# Run query file
sqlcmd -S <SERVER_NAME> -U <USER> -P <PASSWORD> -i sql/sample_queries.sql
