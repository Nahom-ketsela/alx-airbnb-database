# Database Seed Data

This directory contains the SQL script (`seed.sql`) to populate the database with sample data for an Airbnb-like application using PostgreSQL.

## Seed Data Overview
- **Users**: 5 users (2 hosts, 3 guests) with roles, emails, and phone numbers.
- **Properties**: 3 properties owned by 2 hosts, located in Addis Ababa, Zanzibar, and Nairobi.
- **Bookings**: 3 bookings with realistic dates, prices (calculated as `price_per_night` * nights), and statuses (`confirmed`, `pending`).
- **Payments**: 2 payments for confirmed bookings, using `credit_card`.
- **Reviews**: 3 reviews for properties, with ratings (4 or 5) and comments.
- **Messages**: 3 messages simulating communication between guests and hosts.

## Purpose
The sample data simulates real-world usage, ensuring valid foreign key references and adherence to constraints (e.g., `role`, `status`, `rating`). It supports testing of relationships and queries.

## Usage
1. Ensure the schema from `database-script-0x01/schema.sql` is applied.
2. Run `seed.sql` in your PostgreSQL database:
   ```bash
   psql -U <username> -d <database> -f seed.sql