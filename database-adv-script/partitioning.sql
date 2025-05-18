-- Create a new partitioned Booking table
CREATE TABLE booking_partition (
	    booking_id INT PRIMARY KEY,
	    user_id INT,
	    property_id INT,
	    start_date DATE,
	    end_date DATE,
	    amount DECIMAL(10, 2)
)
PARTITION BY RANGE (YEAR(start_date)) (
	    PARTITION p_2022 VALUES LESS THAN (2023),
	    PARTITION p_2023 VALUES LESS THAN (2024),
	    PARTITION p_2024 VALUES LESS THAN (2025),
	    PARTITION p_2025 VALUES LESS THAN (2026)
);

-- Insert data from the original Booking table
INSERT INTO booking_partition (booking_id, user_id, property_id, start_date, end_date, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, amount FROM bookings;

-- Query on partitioned table (fetch bookings in 2024)
SELECT * FROM booking_partition WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
