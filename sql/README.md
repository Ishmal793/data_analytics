


# 📘 SQL Notes – Beginner to Intermediate

This repository contains essential SQL syntax and usage examples, explained clearly for learners and practitioners.

---

## 📌 1. SELECT Statement

Used to retrieve data from a table.

```sql
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name;
````

---

## 🧮 2. Arithmetic Operations

You can perform calculations using operators like `+`, `-`, `*`, `/`.

```sql
SELECT column, column + 10 FROM table_name;
SELECT column, (column + 10) * 10 FROM table_name;
```

---

## 🔁 3. DISTINCT

Returns unique values from one or more columns.

```sql
SELECT DISTINCT column1 FROM table_name;
```

---

## 🧪 4. WHERE Clause

Filters records based on conditions.

```sql
SELECT * FROM table_name WHERE column = 'value';
SELECT * FROM table_name WHERE column > 100;
SELECT * FROM table_name WHERE column != 'value';
```

---

## 🔗 5. Logical Operators

Used to combine multiple conditions:

* `AND`
* `OR`
* `NOT`

```sql
SELECT * FROM table_name WHERE column > 50 AND column = 'X';
SELECT * FROM table_name WHERE column > 50 OR NOT column = 'X';
```

---

## 🔍 6. LIKE Operator

Used for pattern matching:

* `%` = any sequence of characters
* `_` = single character

```sql
SELECT * FROM table_name WHERE column LIKE 'a___%';
SELECT * FROM table_name WHERE column LIKE '1987%';
```

---

## 📊 7. GROUP BY

Groups data and allows aggregation.

```sql
SELECT column, COUNT(*) FROM table_name GROUP BY column;
SELECT column, AVG(column), MAX(column) FROM table_name GROUP BY column;
```

---

## ⚙️ 8. HAVING Clause

Filters grouped results (used with `GROUP BY`).

```sql
SELECT column, COUNT(*) FROM table_name GROUP BY column HAVING COUNT(*) > 1;
```

---

## 🔠 9. ORDER BY

Sorts results.

```sql
SELECT * FROM table_name ORDER BY column ASC;
SELECT * FROM table_name ORDER BY column DESC;
```

---

## 🧮 10. LIMIT

Limits number of rows returned.

```sql
SELECT * FROM table_name LIMIT 3;
SELECT * FROM table_name LIMIT 2, 3; -- Skip 2, show next 3
```

---

## 📏 11. BETWEEN

Checks if value is between a range.

```sql
SELECT * FROM table_name WHERE column BETWEEN 25 AND 60;
```

---

## 📌 12. IN / NOT IN

Filters based on a list of values.

```sql
SELECT * FROM table_name WHERE column IN ('A', 'B');
SELECT * FROM table_name WHERE column NOT IN ('X', 'Y');
```

---

## ✂️ 13. String Functions

Some useful string operations:

```sql
SELECT CONCAT(column1, column2);
SELECT LENGTH(column);
SELECT UPPER(column);
SELECT LOWER(column);
SELECT LEFT(column, 4);
SELECT RIGHT(column, 4);
SELECT MID(column, 2, 4);
```

---

## ➕ 14. Aggregation Functions

Used for numeric summarization:

```sql
SELECT SUM(column), MAX(column), TRUNCATE(column, 1);
SELECT CEIL(column), FLOOR(column);
```

---

## 📅 15. Date Functions

Useful for working with date columns:

```sql
SELECT DATE(column);
SELECT DATEDIFF(date1, date2);
SELECT DAYNAME(date_column);
SELECT MONTHNAME(date_column);
SELECT YEAR(date_column);
```

---

## 🧠 16. CASE Statement

Adds conditional logic to queries.

```sql
SELECT column,
  CASE
    WHEN column <= 1 THEN 'Low'
    WHEN column >= 4 THEN 'High'
    ELSE 'Average'
  END AS result
FROM table_name;
```

---

## 🔗 17. JOINS

Join multiple tables based on related columns.

* **INNER JOIN** – matches in both
* **LEFT JOIN** – all from left, matched from right
* **CROSS JOIN** – all combinations

```sql
SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id;
SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id;
SELECT * FROM table1 CROSS JOIN table2;
```

---

## 🧰 18. Set Operations

Combine results of multiple queries.

```sql
-- UNION
SELECT column FROM table1
UNION
SELECT column FROM table2;

-- INTERSECTION using IN
SELECT column FROM table1
WHERE column IN (SELECT column FROM table2);

-- EXCEPT using NOT IN
SELECT column FROM table1
WHERE column NOT IN (SELECT column FROM table2);
```

---

## 📦 19. Subqueries

A query inside another query.

```sql
SELECT * FROM table WHERE column > (SELECT AVG(column) FROM table);
```

---

## 👁️ 20. Views

Virtual tables based on SQL statements.

```sql
CREATE VIEW view_name AS
SELECT column, COUNT(*) FROM table GROUP BY column;
```

---

## 🧩 21. Stored Procedures

Reusable blocks of SQL code.

```sql
DELIMITER &&
CREATE PROCEDURE procedure_name()
BEGIN
  SELECT * FROM table;
END &&
DELIMITER ;

CALL procedure_name();
```

With input parameter:

```sql
DELIMITER &&
CREATE PROCEDURE procedure_name(IN var INT)
BEGIN
  SELECT * FROM table LIMIT var;
END &&
DELIMITER ;
```

With output parameter:

```sql
DELIMITER &&
CREATE PROCEDURE get_max_value(OUT var INT)
BEGIN
  SELECT MAX(column) INTO var FROM table;
END &&
DELIMITER ;

CALL get_max_value(@var);
SELECT @var;
```

---
