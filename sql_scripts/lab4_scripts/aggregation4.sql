SELECT COUNT(book_copies.copy_id)
FROM books
JOIN book_copies ON book_copies.book_id = books.book_id
