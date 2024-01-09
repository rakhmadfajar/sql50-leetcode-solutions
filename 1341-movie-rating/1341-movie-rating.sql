# 1. Find most rating by user. COUNT(user) in MovieRating table
SELECT results FROM (
SELECT
    name as results
FROM
    MovieRating as mr INNER JOIN Users as u USING(user_id)
GROUP BY
    user_id
ORDER BY
    COUNT(user_id) desc, name asc
LIMIT 
    1                                   
) as ct

UNION ALL

#Highest rating in February 2020
(
SELECT 
    m.title
FROM
    MovieRating as mr INNER JOIN Movies as m USING(movie_id)
WHERE
    created_at BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY
    movie_id
ORDER BY
    AVG(rating) desc, title asc
LIMIT 
    1
)