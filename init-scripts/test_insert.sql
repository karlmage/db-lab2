-- Book
INSERT INTO books (book_name, genre, release_date) VALUES
    ('Hobbit', 'Fantasy', '1937-09-21'),
    ('Harry Potter and the Philosophers Stone', 'Fantasy', '1997-06-26'),
    ('Harry Potter and the Chamber of Secrets', 'Fantasy', '1998-07-02');

-- Author
INSERT INTO authors (author_name) VALUES
    ('John Ronald Reuel Tolkien'),
    ('Joanne Rowling');

-- BookAuthor
INSERT INTO books_and_authors (book_id, author_id) VALUES
    (7, 5),
    (8, 6),
    (9, 6);

-- BookCopy
INSERT INTO book_copies (book_id, status) VALUES
    (7, 'leased'),
    (7, 'lost'),
    (8, 'available'),
    (9, 'leased'),
    (9, 'available');

-- Customer
INSERT INTO customers (customer_name, registration_date, status) VALUES
    ('Sponge Bob Squarepants', '2025-04-22'),
    ('Patrick Star', '2025-05-20'),
    ('Sandy', '2024-04-10', 'university_student');

-- BookLease
INSERT INTO book_lease (copy_id, customer_id, lease_date, lease_period, return_date) VALUES
    (3, 4, '2024-04-11', '2_weeks', '2024-04-25'),
    (1, 2, '2025-04-21', '2_weeks', NULL),
    (4, 3, '2025-04-20', '1_week', NULL);

