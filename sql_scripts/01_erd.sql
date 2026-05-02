-- Book
CREATE TABLE books (
    book_id         SERIAL PRIMARY KEY,
    book_name       VARCHAR(40) NOT NULL,
    genre           VARCHAR(40) NOT NULL,
    release_date    DATE NOT NULL
);

-- Author
CREATE TABLE authors (
    author_id   SERIAL PRIMARY KEY,
    author_name VARCHAR(40) NOT NULL
);

-- BookAuthor
CREATE TABLE books_and_authors (
    book_id     INTEGER REFERENCES books(book_id),
    author_id   INTEGER REFERENCES authors(author_id)
);

-- BookCopy
CREATE SEQUENCE inv_seq START 1;

CREATE TYPE book_copy_status AS ENUM (
    aailable,
    leased,
    lost
);

CREATE TABLE book_copies (
    copy_id             SERIAL PRIMARY KEY,
    book_id     INTEGER REFERENCES books(book_id),
    inventory_number    VARCHAR(6) UNIQUE NOT NULL DEFAULT
    (INV || LPAD(nextval(inv_seq)::text, 3, 0)),
    status book_copy_status NOT NULL
);

-- Customer
CREATE TYPE customer_status AS ENUM (
    school_student,
    university_student,
    retiree,
    author,
    normal
);

CREATE TABLE customers (
    customer_id         SERIAL PRIMARY KEY,
    customer_name       VARCHAR(40) NOT NULL,
    registration_date   DATE NOT NULL,
    status customer_status NOT NULL DEFAULT normal
);

-- BookLease
CREATE TYPE lease_period AS ENUM (
    1_week,
    2_weeks,
    1_month
);

CREATE TABLE book_lease (
    lease_id        SERIAL PRIMARY KEY,
    copy_id         INTEGER REFERENCES book_copies(copy_id),
    customer_id     INTEGER REFERENCES customers(customer_id),
    lease_date                  DATE NOT NULL,
    lease_period lease_period   NOT NULL,
    due_date                    DATE,
    return_date                 DATE
);

CREATE FUNCTION set_due_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.due_date:=
        CASE
            WHEN NEW.lease_period = 1_week THEN NEW.lease_date + 7
            WHEN NEW.lease_period = 2_weeks THEN NEW.lease_date + 14
            WHEN NEW.lease_period = 1_month THEN (NEW.lease_date + INTERVAL 1 month)::DATE
        END;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_due_date
BEFORE INSERT OR UPDATE
ON book_lease
FOR EACH ROW
EXECUTE FUNCTION set_due_date();