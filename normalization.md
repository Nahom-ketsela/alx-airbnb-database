# Database Normalization

## Initial Schema
The initial schema includes the following entities: User, Property, Booking, Payment, and Review, as defined in `ERD/requirements.md`.

## Normalization Steps
1. **First Normal Form (1NF)**:
   - All attributes are atomic. For example, `User.email` and `Property.location` contain single values.
   - No repeating groups or multi-valued attributes exist.

2. **Second Normal Form (2NF)**:
   - All tables have a single primary key (e.g., `user_id`, `property_id`).
   - Non-key attributes (e.g., `Property.title`, `Booking.total_price`) depend only on the primary key, not on other attributes like `host_id`.

3. **Third Normal Form (3NF)**:
   - No transitive dependencies exist. For example, in `Property`, attributes like `title` and `price_per_night` depend directly on `property_id`.
   - To improve normalization, I considered splitting `Property.location` into a separate `Location` table (`location_id`, `city`, `state`, `country`) to avoid redundancy if multiple properties share the same city/country. However, for simplicity, I kept `location` as a VARCHAR in `Property`, assuming minimal redundancy.

## Final Schema
The schema is in 3NF, with no redundancies or dependencies violating normalization principles. All relationships are enforced via foreign keys, and data integrity is maintained.

