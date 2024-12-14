SELECT
    p.string_field_8 AS PART_NAME,
    SUM(l.double_field_5 * (1 - l.double_field_6)) AS REVENUE,
    SUM(l.double_field_5 * l.double_field_6) AS TOTAL_DISCOUNT,
    SUM(l.double_field_5 * (1 - l.double_field_6) * (1 + l.double_field_7)) AS TAXED_REVENUE
FROM
    `cpsc531-project.tpch_1gb.lineitem` l
JOIN
    `cpsc531-project.tpch_1gb.part` p
    ON l.int64_field_1 = p.int64_field_0
WHERE
    l.date_field_10 <= DATE '1998-12-01'
GROUP BY
    p.string_field_8
ORDER BY
    REVENUE DESC;
/*The query calculates total revenue, total discount, and taxed revenue for each part, grouping by PART_NAME. 
It includes only records where the date_field_10 is on or before December 1, 1998. The query then sorts the results 
in descending order based on revenue, showing which parts contributed the most in terms of revenue.
Query 1: Aggregation-intensive