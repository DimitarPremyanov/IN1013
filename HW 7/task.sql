-- 1. Create the samsBills view
-- 1. Create the samsBills view
CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';
-- End of batch for samsBills

-- 2. Create the roomTotals view
CREATE VIEW roomTotals AS
SELECT t.room_name, SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
GROUP BY t.room_name;
-- End of batch for roomTotals

-- 3. Create the teamTotals view
CREATE VIEW teamTotals AS
SELECT CONCAT(h.first_name, ' ', h.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname;
-- End of batch for teamTotals

SELECT *
FROM samsBills
WHERE bill_total > 400;

SELECT *
FROM roomTotals;