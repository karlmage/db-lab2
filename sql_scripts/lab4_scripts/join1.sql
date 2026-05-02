SELECT authors.author_name, books.book_name
FROM authors
INNER JOIN books_and_authors ON books_and_authors.author_id = authors.author_id
INNER JOIN books ON books.book_id = books_and_authors.book_id
