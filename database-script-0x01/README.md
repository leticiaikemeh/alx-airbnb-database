# Airbnb Clone Database Schema

This project contains the SQL schema for an **Airbnb clone** application. The schema is designed to support core functionalities such as property listing, user management, booking, payments, reviews, and messaging.

## 📁 Project Structure

- `schema.sql` – Contains the `CREATE TABLE` statements with proper data types, constraints, foreign keys, and indexes.

## 🧠 Database Design Overview

The database is designed following best practices and normalized up to the **Third Normal Form (3NF)** to ensure data consistency and avoid redundancy.

### ✅ Entities and Relationships

- **User** – Stores guest, host, and admin information.
- **Property** – Holds data about listed properties and links to users (hosts) and locations.
- **Booking** – Connects users and properties with booking status and timeline.
- **Payment** – Records transactions made for bookings.
- **Review** – User-generated reviews for properties.
- **Message** – Messaging between users.
- **Location** – Structured geographical data linked to each property.
- **Country** – Contains country-level metadata for locations.

## 🔄 Normalization Steps

### First Normal Form (1NF)
- All tables have atomic (indivisible) values.
- Each field contains only one value per record.

### Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the entire primary key.
- No partial dependencies exist.

### Third Normal Form (3NF)
- All attributes are only dependent on the primary key.
- Transitive dependencies are eliminated by introducing:
  - `Location` table: separates address and location-related data.
  - `Country` table: further breaks down country-related data to avoid redundancy.

## ⚙️ Indexing and Performance

- **Indexed Columns**:
  - `user.email`
  - `property.property_id`
  - `booking.property_id`
  - `booking.booking_id`
  - `payment.booking_id`

These indexes improve query performance for common lookups and joins.

## 📌 Getting Started

1. Clone this repo or download the `.sql` file.
2. Create a PostgreSQL or MySQL database.
3. Run the schema script using your database client or CLI:

```bash
psql -U youruser -d airbnb_clone_db -f schema.sql

