-- Task 3

-- 1
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' 
  AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN (14, 17)
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    JOIN restRest_table t ON b.table_no = t.table_no
    WHERE t.room_name = 'Blue' AND b.bill_date = 160312
)
OR s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);
