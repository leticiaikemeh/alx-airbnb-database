 


-- Non-corelated subquery to find all properties where the average rating is greater than 4.0.
SELECT *
FROM Property
WHERE property_id IN (
	    SELECT property_id
	    FROM Review
	    GROUP BY property_id
	    HAVING AVG(rating) > 4.0
);

--corelated subquery to find users who have made more than 3 bookings.
SELECT u.user_id, u.first_name, u.last_name
FROM "User" u
WHERE (SELECT COUNT(*)
		FROM Booking b 
			WHERE u.user_id = b.user_id) > 3;

