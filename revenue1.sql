SELECT
    o.string_field_8 AS ORDER_PRIORITY,
    SUM(l.double_field_5 * (1 - l.double_field_6)) AS REVENUE,
    SUM(l.double_field_5 * l.double_field_6) AS TOTAL_DISCOUNT,
    SUM(l.double_field_5 * (1 - l.double_field_6) * (1 + l.double_field_7)) AS TAXED_REVENUE
FROM
    `cpsc531-project.tpch_1gb.lineitem` l
JOIN
    `cpsc531-project.tpch_1gb.orders` o
    ON l.int64_field_0 = o.int64_field_0
WHERE
    l.date_field_10 <= DATE '1998-12-01'
GROUP BY
    o.string_field_8
ORDER BY
    REVENUE DESC;
/*This query calculates aggregated metrics for each order priority
 in the orders table, with revenue-related computations derived from the lineitem table.
  The results are ordered by the revenue in descending order.
  Query 2: Balanced between aggregation and joins.

 ORDERKEY field (int64_field_0).