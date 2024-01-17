

DELETE 
    S1
FROM 
    Person as S1 INNER JOIN Person as S2
WHERE
    S1.id > S2.id AND 
    S1.email = S2.email