-- USER TABLE
CREATE TABLE User (
	    user_id UUID PRIMARY KEY,
	    first_name VARCHAR(100) NOT NULL,
	    last_name VARCHAR(100) NOT NULL,
	    email VARCHAR(255) UNIQUE NOT NULL,
	    password_hash VARCHAR(255) NOT NULL,
	    phone_number VARCHAR(20),
	    role ENUM('guest', 'host', 'admin') NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index on email for quick lookup
CREATE INDEX idx_user_email ON User(email);

-- COUNTRY TABLE
CREATE TABLE Country (
	    country_id UUID PRIMARY KEY,
	    country_name VARCHAR(100) NOT NULL
);

-- LOCATION TABLE
CREATE TABLE Location (
	    location_id UUID PRIMARY KEY,
	    address VARCHAR(255) NOT NULL,
	    city VARCHAR(100) NOT NULL,
	    state VARCHAR(100),
	    country_id UUID NOT NULL,
	    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- PROPERTY TABLE
CREATE TABLE Property (
	    property_id UUID PRIMARY KEY,
	    host_id UUID NOT NULL,
	    location_id UUID NOT NULL,
	    name VARCHAR(150) NOT NULL,
	    description TEXT NOT NULL,
	    pricepernight DECIMAL(10, 2) NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	    FOREIGN KEY (host_id) REFERENCES User(user_id),
	    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Index on property_id for joins and lookups
CREATE INDEX idx_property_id ON Property(property_id);

-- BOOKING TABLE
CREATE TABLE Booking (
	    booking_id UUID PRIMARY KEY,
	    property_id UUID NOT NULL,
	    user_id UUID NOT NULL,
	    start_date DATE NOT NULL,
	    end_date DATE NOT NULL,
	    total_price DECIMAL(10, 2) NOT NULL,
	    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (property_id) REFERENCES Property(property_id),
	    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Index on property_id and booking_id for performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_id ON Booking(booking_id);

-- PAYMENT TABLE
CREATE TABLE Payment (
	    payment_id UUID PRIMARY KEY,
	    booking_id UUID NOT NULL,
	    amount DECIMAL(10, 2) NOT NULL,
	    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
	    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Index on booking_id
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- REVIEW TABLE
CREATE TABLE Review (
	    review_id UUID PRIMARY KEY,
	    property_id UUID NOT NULL,
	    user_id UUID NOT NULL,
	    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
	    comment TEXT NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (property_id) REFERENCES Property(property_id),
	    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- MESSAGE TABLE
CREATE TABLE Message (
	    message_id UUID PRIMARY KEY,
	    sender_id UUID NOT NULL,
	    recipient_id UUID NOT NULL,
	    message_body TEXT NOT NULL,
	    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (sender_id) REFERENCES User(user_id),
	    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

