
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Leticia', 'Ikemeh', 'leticia@example.com', 'hashed_pw_1', '08012345678', 'host'),
('22222222-2222-2222-2222-222222222222', 'James', 'Doe', 'james@example.com', 'hashed_pw_2', '08087654321', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Admin', 'User', 'admin@example.com', 'hashed_pw_3', NULL, 'admin');

INSERT INTO Country (country_id, country_name)
VALUES
('aaa11111-aaaa-aaaa-aaaa-aaa111111111', 'Nigeria'),
('bbb22222-bbbb-bbbb-bbbb-bbb222222222', 'Kenya');

INSERT INTO Location (location_id, address, city, state, country_id)
VALUES
('loc00001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '123 Banana Street', 'Lagos', 'Lagos', 'aaa11111-aaaa-aaaa-aaaa-aaa111111111'),
('loc00002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '456 Mango Avenue', 'Nairobi', 'Nairobi', 'bbb22222-bbbb-bbbb-bbbb-bbb222222222');

INSERT INTO Property (property_id, host_id, location_id, name, description, pricepernight)
VALUES
('prop0001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'loc00001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Cozy Apartment', '2-bedroom serviced apartment in Lekki', 150.00),
('prop0002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'loc00002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Modern Studio', 'Stylish studio apartment in Westlands', 90.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book0001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'prop0001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-06-01', '2025-06-05', 600.00, 'confirmed'),
('book0002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'prop0002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', '2025-07-10', '2025-07-12', 180.00, 'pending');

INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay00001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'book0001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 600.00, 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('rev00001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'prop0001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing place! Clean and comfy.'),
('rev00002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'prop0002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 4, 'Great location but a bit noisy.');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('msg00001-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is the apartment available for next week?'),
('msg00002-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it’s available. I’ve sent the details.');

