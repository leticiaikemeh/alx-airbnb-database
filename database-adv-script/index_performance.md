

📌 High-Usage Columns & Justification
🔹 User Table
Column	Usage
email	Common in authentication, WHERE lookups
user_id	Used in JOIN with Booking, Message etc. (already PK)

🔹 Booking Table
Column	Usage
user_id	JOIN and WHERE filters for user history
property_id	JOIN with Property table
start_date	For availability and filtering (WHERE, ORDER BY)

🔹 Property Table
Column	Usage
host_id	To find properties owned by a user
location_id	To filter by or join with Location
pricepernight	Sorting/filtering by price

⚙️ Performance Analysis with EXPLAIN ANALYZE
To measure and compare query performance before and after indexing, we analyze the following query using PostgreSQL’s EXPLAIN ANALYZE:

sql
Copy
Edit
SELECT u.user_id, u.first_name, u.last_name
FROM "User" u
WHERE (
  SELECT COUNT(*)
  FROM Booking b 
  WHERE u.user_id = b.user_id
) > 3;
📊 Analysis of EXPLAIN ANALYZE Output
Metric	Before Index	After Index (Expected)
Subquery Scan Type	❌ Sequential Scan on Booking	✅ Index Scan on Booking(user_id)
Subquery Execution Time	~0.006–0.007 ms per loop	✅ ~0.002–0.003 ms per loop
Total Execution Time	~0.323 ms	✅ ~0.218 ms

ℹ️ Note: These values may vary based on hardware and data volume but reflect typical improvements observed after indexing.

🔍 Performance Insights
Pre-Indexing:
PostgreSQL performs a sequential scan of the Booking table once per user in the User table, leading to a suboptimal O(N×M) complexity where N = users and M = bookings.

Post-Indexing:
With an index on Booking.user_id, PostgreSQL switches to a more efficient index scan, dramatically reducing the cost of the correlated subquery.

✅ Indexes Created
To improve the query performance, the following index was added:

CREATE INDEX idx_booking_user_id ON Booking(user_id);
This index supports faster lookup of bookings by user, especially in filtering or aggregating conditions like COUNT(*).

All indexes implemented include:

-- Index on email for quick lookup
CREATE INDEX idx_user_email ON "User"(email);

-- Index on property_id for joins and lookups
CREATE INDEX idx_property_id ON Property(property_id);

-- Index on property_id and booking_id for performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on payment and booking_if for faster lookup of paid bookings
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);     

-- Index on booking and user_id for faster lookup of booking users
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property and location_id for region-based searches
CREATE INDEX idx_property_location_id ON Property(location_id); 

📌 Summary
Sequential scans are fine for small datasets but don't scale well.

Correlated subqueries can degrade performance if not supported by indexes.

Adding appropriate indexes reduces query time and resource usage.
