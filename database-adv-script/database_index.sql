-- Implemented include:

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
