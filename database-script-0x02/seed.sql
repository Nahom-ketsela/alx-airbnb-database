-- Clear existing data and reset sequences
TRUNCATE TABLE Payment, Message, Review, Booking, Property, "User" RESTART IDENTITY CASCADE;

-- Insert sample Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hash1', '+1234567890', 'host', NOW()),
    (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hash2', '+1987654321', 'guest', NOW()),
    (gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hash3', '+1122334455', 'guest', NOW()),
    (gen_random_uuid(), 'Diana', 'Miller', 'diana@example.com', 'hash4', '+1415555267', 'host', NOW()),
    (gen_random_uuid(), 'Eve', 'Wilson', 'eve@example.com', 'hash5', '+1567891234', 'guest', NOW());

-- Insert sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
SELECT 
    gen_random_uuid(), 
    u.user_id,
    'Cozy Apartment in City Center',
    'A modern apartment close to shops and restaurants.',
    'Addis Ababa, Ethiopia',
    50.00,
    NOW(), NOW()
FROM "User" u WHERE u.email = 'alice@example.com'
UNION ALL
SELECT 
    gen_random_uuid(), 
    u.user_id,
    'Beachside Villa',
    'Spacious villa with ocean view and private pool.',
    'Zanzibar, Tanzania',
    150.00,
    NOW(), NOW()
FROM "User" u WHERE u.email = 'diana@example.com'
UNION ALL
SELECT 
    gen_random_uuid(), 
    u.user_id,
    'Urban Loft',
    'Stylish loft with city views.',
    'Nairobi, Kenya',
    80.00,
    NOW(), NOW()
FROM "User" u WHERE u.email = 'alice@example.com';

-- Insert sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    '2025-10-25',
    '2025-10-28',
    150.00, -- 3 nights * 50.00
    'confirmed',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Cozy Apartment in City Center' AND u.email = 'bob@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    '2025-11-02',
    '2025-11-06',
    600.00, -- 4 nights * 150.00
    'pending',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Beachside Villa' AND u.email = 'charlie@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    '2025-11-10',
    '2025-11-12',
    160.00, -- 2 nights * 80.00
    'confirmed',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Urban Loft' AND u.email = 'eve@example.com';

-- Insert sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
SELECT 
    gen_random_uuid(),
    b.booking_id,
    b.total_price,
    NOW(),
    'credit_card'
FROM Booking b WHERE b.status = 'confirmed';

-- Insert sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    5,
    'Fantastic stay, very clean and comfortable!',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Cozy Apartment in City Center' AND u.email = 'bob@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    4,
    'Beautiful place, great view but a bit pricey.',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Beachside Villa' AND u.email = 'charlie@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    p.property_id,
    u.user_id,
    4,
    'Great location, enjoyed the stay!',
    NOW()
FROM Property p, "User" u
WHERE p.name = 'Urban Loft' AND u.email = 'eve@example.com';

-- Insert sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
SELECT 
    gen_random_uuid(),
    u1.user_id,
    u2.user_id,
    'Hi, I would like to confirm my check-in time.',
    NOW()
FROM "User" u1, "User" u2
WHERE u1.email = 'bob@example.com' AND u2.email = 'alice@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    u1.user_id,
    u2.user_id,
    'Sure, you can check in anytime after 2 PM.',
    NOW()
FROM "User" u1, "User" u2
WHERE u1.email = 'alice@example.com' AND u2.email = 'bob@example.com'
UNION ALL
SELECT 
    gen_random_uuid(),
    u1.user_id,
    u2.user_id,
    'Is the loft available for next week?',
    NOW()
FROM "User" u1, "User" u2
WHERE u1.email = 'eve@example.com' AND u2.email = 'alice@example.com';