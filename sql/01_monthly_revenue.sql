
SELECT strftime('%Y-%m', i.invoice_date) AS month,
       COUNT(DISTINCT i.invoice_no)      AS orders,
       ROUND(SUM(l.revenue), 0)          AS revenue
FROM invoice_lines l
JOIN invoices i ON i.invoice_no = l.invoice_no
GROUP BY month
ORDER BY month;
