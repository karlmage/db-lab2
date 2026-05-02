SELECT authors.author_name, COUNT(books_and_authors.book_id) AS book_count
FROM authors
JOIN books_and_authors ON books_and_authors.author_id = authors.author_id
GROUP BY authors.author_name
