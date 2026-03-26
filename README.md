# Employee Database Reconstruction & Analysis 
Pewlett Hackard (Legacy Systems Project)

## Overview
This project focuses on rebulding and analyzing a legacy employee database for Pewlett Hackard, using fragmented CSV exports from the 1980s-1990s. 

The work simulates a common data engineering scenario: inherting incomplete historical data and transorming it into a reliable, queryable system. From raw files to structured insights, the proejct covers schema design, data ingestion, and analyticsl querying 

## What This Project Demonstrates
* Designing a relational database from raw, denormalized data
* Building a clean schema with enforced integrity (PKs, FKs, contraints)
* Handling edge cases like non-uniqure identified via composite keys
* Writing production-style SQL queries to answer business questions
* Translating hsitorical data into actionable insights

## Data Architechure
The dataset consists of six core entites:
* **Employees** - core employee records
* **Departments** - organizational structure
* **Salaries** - compensation history
* **Titles** - job roles over time
* **Dep_Employee** - employee-to-department relationships
* **Dept_Manager** - department leadership
Relationships were modeled through a fully normalized schema, ensuring:
* Referential intregirty across all tables
* Clear on-to-many and many-to-many mappings
* Proper indexing through primary and foreign keys

## Pipeline Breakdown
1. **Data Modeling**
  * Audited raw CSV structure and field consistency
  * Defined entity relationships and constraints
  * Built ERD to guide schema implementation
  
2. **Data Engineering**
  * Created SQL table schemas with appropriate data types and constraints
  * Implemented primary and foreign key relationships to maintain data integrity
  * Ensured correct table creation order to support dependencies
  * Imported all six CSV datasets into their respective tables

4. **Data Analysis**
   Once the database was fully structured, SQL queries were used to explore and analyze the data.
   * Employee details with salary information
   * Hiring trends, inclding employees hired in 1986
   * department leadership structure. including managers and their teams
   * Employee-to-department mappings
   * Targeted filtering (e.g., employees named Hercules with last names starting with "B")
   * Department-specific employee listing (Sales, Development)
   * Cross-department analysis
   * Frequency distribution of employee last names
