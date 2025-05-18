

-- Inner Join to retrieve all bookings and the respective users who made those bookings.
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id;

-- Left Join to retrieve all properties and their reviews, including properties that have no reviews.
SELECT 
    p.property_id,
    p.name AS property_name,
    p.description,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY 
    r.created_at DESC;

-- Full Outer Join to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id
FROM 
    "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
