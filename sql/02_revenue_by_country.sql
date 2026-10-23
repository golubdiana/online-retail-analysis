
SELECT i.country,
       COUNT(DISTINCT i.invoice_no) AS orders,
       ROUND(SUM(l.revenue), 0)     AS revenue,
       ROUND(SUM(l.revenue) * 100.0 /
             (SELECT SUM(revenue) FROM invoice_lines), 1) AS pct_of_total
FROM invoice_lines l
JOIN invoices i ON i.invoice_no = l.invoice_no
GROUP BY i.country
ORDER BY revenue DESC
LIMIT 10;
