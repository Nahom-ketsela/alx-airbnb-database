
# ALX Airbnb Database Project

## Overview
This repository contains the deliverables for the ALX Airbnb Database Module, a project focused on designing and implementing a relational database for an Airbnb-like application. The project emphasizes database design, normalization, schema creation, and seeding with realistic data, simulating a production-level system with scalability and efficiency.

## Repository Structure
```
alx-airbnb-database/
├── ERD/
│   ├── requirements.md  # Entity-Relationship Diagram specification
│   ├── erd.png         # Visual ER diagram
├── database-script-0x01/
│   ├── schema.sql      # SQL script for database schema (DDL)
│   ├── README.md       # Schema documentation
├── database-script-0x02/
│   ├── seed.sql        # SQL script for sample data (DML)
│   ├── README.md       # Seed data documentation
├── normalization.md     # Normalization process explanation
└── README.md            # This file
```

## Setup Instructions

### Prerequisites
- PostgreSQL installed locally or access to a PostgreSQL server.
- Git installed for cloning the repository.
- Draw.io or a similar tool for viewing the ERD.

### Clone the Repository
```bash
git clone https://github.com/nahom-ketsela/alx-airbnb-database.git
cd alx-airbnb-database
```

### Create the Database
- Create a PostgreSQL database:
```bash
psql -U <username> -c "CREATE DATABASE airbnb_db;"
```
- Run the schema script:
```bash
psql -U <username> -d airbnb_db -f database-script-0x01/schema.sql
```
- Populate the database with sample data:
```bash
psql -U <username> -d airbnb_db -f database-script-0x02/seed.sql
```

### Verify the Setup
- Query the tables to ensure the schema and data are correctly applied:
```sql
\dt
SELECT * FROM "User";
```
