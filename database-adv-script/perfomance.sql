-- Initial Query
SELECT 
    SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    "User" u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    pay.amount > 0 AND b.start_date IS NOT NULL;

-- Measure the query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    "User" u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    pay.amount > 0 AND b.start_date IS NOT NULL;

-- Refactored Query: Optimized query with indexing and removing wide/unused columns and filter/sorting with ORDER BY

CREATE INDEX idx_booking_start_date ON Booking(start_date);     -- For filtering/sorting by start date

SELECT
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name,
    p.pricepernight,
    pay.amount,
    b.start_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;

-- Measure the query performance of refractored queryusing EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name,
    p.pricepernight,
    pay.amount,
    b.start_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;
