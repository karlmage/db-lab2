SELECT books.book_name, COUNT(book_copies.copy_id) AS copy_count
FROM books
JOIN book_copies ON book_copies.book_id = books.book_id
GROUP BY books.book_name
