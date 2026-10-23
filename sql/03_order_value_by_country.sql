
SELECT i.country,
       COUNT(*)                   AS orders,
       ROUND(AVG(order_total), 0) AS avg_order_value
FROM (
    SELECT invoice_no, SUM(revenue) AS order_total
    FROM invoice_lines
    GROUP BY invoice_no
) t
JOIN invoices i ON i.invoice_no = t.invoice_no
GROUP BY i.country
HAVING orders >= 50
ORDER BY avg_order_value DESC
LIMIT 10;
