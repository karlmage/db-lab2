SELECT books.book_name, book_copies.status
FROM books
JOIN book_copies ON book_copies.book_id = books.book_id
WHERE book_copies.status = 'leased'
