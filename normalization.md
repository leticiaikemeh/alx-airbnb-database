## 🧹 Database Normalization (1NF to 3NF)

This project follows relational database normalization principles to ensure data integrity, eliminate redundancy, and simplify long-term maintenance. Below is a breakdown of how the Airbnb clone database design adheres to the first three normal forms:

---

### ✅ 1st Normal Form (1NF)

**Objective:** Ensure each column contains atomic (indivisible) values and there are no repeating groups.

- All tables have primary keys (`user_id`, `property_id`, etc.).
- Each field holds a single value (e.g., no lists or arrays in columns).
- No duplicate rows or multi-valued fields.
- Example: In the `User` table, fields like `email`, `phone_number`, and `role` are singular and atomic.

---

### ✅ 2nd Normal Form (2NF)

**Objective:** Remove partial dependencies—every non-key column must depend on the whole primary key.

- All tables use single-column primary keys (UUIDs), so no partial dependencies exist.
- Non-key fields fully depend on their table's primary key.
- Example: In the `Booking` table, attributes like `start_date`, `end_date`, and `total_price` depend solely on `booking_id`.

---

### ✅ 3rd Normal Form (3NF)

**Objective:** Eliminate transitive dependencies—non-key columns should not depend on other non-key columns.

Normalization steps applied:

1. **Location Table Created**
   - Previously, `Property.location` was stored as a single string (e.g., "12 Ikoyi Crescent, Lagos").
   - A new `Location` table was introduced to store structured fields: `address`, `city`, `state`, and `country_id`.
   - This removed transitive dependencies and allowed reuse of common location data.

2. **Country Table Introduced**
   - A `Country` table was added to store country information (`country_id`, `country_name`, `country_code`).
   - `Location.country_id` now serves as a foreign key to `Country`, reducing repetition of country data across locations.

**Resulting Relationships:**

- **Property → Location**: One-to-one or many-to-one (depending on address granularity).
- **Location → Country**: Many-to-one (multiple locations belong to one country).

---

### 🌍 Benefits of Normalization

- Reduced data redundancy across properties and locations.
- Simplified updates to shared data like countries or cities.
- Improved scalability for listings across multiple regions and countries.
- Easier maintenance and future expansion (e.g., adding geolocation support).

---

