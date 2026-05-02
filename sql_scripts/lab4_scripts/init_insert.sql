INSERT INTO books (book_name, genre, release_date) VALUES
    ('Dark Matter', 'Sci-fi', '2017-02-05'),
    ('Recursion', 'Sci-fi', '2020-10-03'),
    ('It', 'Horror', '1986-09-15');

INSERT INTO authors (author_name) VALUES
    ('Blake Crouch'),
    ('Stephen King');

INSERT INTO books_and_authors (book_id, author_id) VALUES
    (10, 7),
    (11, 7),
    (12, 8);

INSERT INTO book_copies (status, book_id) VALUES
    ('available', 9),
    ('available', 10),
    ('available', 10),
    ('available', 11),
    ('available', 11),
    ('available', 11),
    ('available', 12);

INSERT INTO authors (author_name) VALUES
    ('Johann Wolfgang von Goethe'),
    ('Franz Kafka');