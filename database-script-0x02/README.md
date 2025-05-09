# Sample Data for Airbnb Clone Database

This folder contains SQL `INSERT` statements used to populate the Airbnb Clone database schema with realistic sample data. These inserts help developers test and demonstrate application features such as user registration, property listings, bookings, payments, and messaging.

## Contents

* `insert_users.sql` - Inserts sample users (guests, hosts, and an admin).
* `insert_countries.sql` - Inserts a few countries with country codes.
* `insert_locations.sql` - Inserts addresses and links them to countries.
* `insert_properties.sql` - Inserts property listings associated with hosts and locations.
* `insert_bookings.sql` - Inserts sample bookings by users.
* `insert_payments.sql` - Inserts payments linked to bookings.
* `insert_reviews.sql` - Inserts guest reviews of properties.
* `insert_messages.sql` - Inserts messages exchanged between users.

## Usage

1. Ensure the database schema is already created.
2. Run each SQL file in the suggested order (countries → locations → users → properties → bookings → payments → reviews → messages).
3. You can execute each file using a SQL client or command-line tool:

```bash
psql -U your_username -d your_database -f insert_countries.sql
```

## Notes

* UUIDs should be generated dynamically or use provided placeholders.
* Timestamps use `CURRENT_TIMESTAMP` unless otherwise specified.

## License

MIT

## Author

Leticia Ikemeh

---

For more details about the database schema, refer to the [Database Schema README](../schema/README.md) if available.

