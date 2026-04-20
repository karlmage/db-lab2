CREATE TABLE books (
    book_id         SERIAL PRIMARY KEY,
    book_name       VARCHAR(40) NOT NULL,
    genre           VARCHAR(40) NOT NULL,
    release_date    DATE NOT NULL
);

CREATE TABLE authors (
    author_id   SERIAL PRIMARY KEY,
    author_name VARCHAR(40) NOT NULL
);

CREATE TABLE books_and_authors (
    book_id     INTEGER REFERENCES books(book_id),
    author_id   INTEGER REFERENCES authors(author_id)
);

CREATE SEQUENCE inv_seq START 1;

CREATE TYPE book_copy_status AS ENUM (
    'available',
    'leased',
    'lost'
);

CREATE TABLE book_copies (
    copy_id             SERIAL PRIMARY KEY,
    inventory_number    VARCHAR(6) UNIQUE NOT NULL DEFAULT
    ('INV' || LPAD(nextval('inv_seq')::text, 3, '0')),
    status book_copy_status NOT NULL
);

CREATE TYPE customer_status AS ENUM (
    'school_student',
    'university_student',
    'retiree',
    'author',
    'normal'
)

CREATE TABLE customers (
    customer_id         SERIAL PRIMARY KEY,
    customer_name       VARCHAR(40) NOT NULL,
    registration_date   DATE NOT NULL,
    status customer_status NOT NULL DEFAULT 'normal'
);

CREATE TABLE book_lease (
    lease_id        SERIAL PRIMARY KEY,
    copy_id         INTEGER REFERENCES book_copies(copy_id),
    customer_id     INTEGER REFERENCES customers(customer_id),
    lease_date      DATE NOT NULL,
    due_date        DATE NOT NULL,
    return_date     DATE NOT NULL,
)