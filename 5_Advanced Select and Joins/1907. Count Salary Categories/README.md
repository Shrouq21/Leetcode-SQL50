# Creating a Temporary Table with Constant Values 

Sometimes you need a temporary table that contains a few fixed values (e.g., categories, statuses, salary ranges) without creating a real table.

---

## Method 1: Using `VALUES` (Recommended)

The simplest and most common approach.

```sql
SELECT *
FROM (
    VALUES
        ('Low Salary'),
        ('Average Salary'),
        ('High Salary')
) AS t(category);
```

**Output**

| category |
|----------|
| Low Salary |
| Average Salary |
| High Salary |

---

## Method 2: Using `UNION ALL`

Another common approach.

```sql
SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary';
```

---

## Method 3: Using a Common Table Expression (CTE)

Useful when the temporary table will be referenced later in the query.

```sql
WITH Categories(category) AS (
    VALUES
        ('Low Salary'),
        ('Average Salary'),
        ('High Salary')
)
SELECT *
FROM Categories;
```

---

## Method 4: Multiple Columns

`VALUES` can contain more than one column.

```sql
SELECT *
FROM (
    VALUES
        (1, 'Low Salary'),
        (2, 'Average Salary'),
        (3, 'High Salary')
) AS t(id, category);
```

**Output**

| id | category |
|----|----------|
| 1 | Low Salary |
| 2 | Average Salary |
| 3 | High Salary |

---

#  Rule

- Use `VALUES` when you need a temporary table with constant rows.
- Every row is enclosed in parentheses.
- Rows are separated by commas.
- When `VALUES` is used in the `FROM` clause, always provide:
  - A table alias.
  - Column name(s).

Example:

```sql
FROM (
    VALUES
        ('A'),
        ('B')
) AS t(category);
```

---

# Common Pitfalls

### Forgetting the table alias

```sql
SELECT *
FROM (
    VALUES ('A'), ('B')
);
```

Correct way

```sql
SELECT *
FROM (
    VALUES ('A'), ('B')
) AS t(category);
```

---

### Using double quotes for string literals

```sql
VALUES
    ("Low Salary")
```

 Correct way

```sql
VALUES
    ('Low Salary')
```

> In PostgreSQL:
> - **Single quotes (`'`)** are for string literals.
> - **Double quotes (`"`)** are for identifiers (table names, column names).

---

# When to Use Each Method

| Method | Best Use Case |
|---------|---------------|
| `VALUES` | The simplest and most readable way to create temporary rows. |
| `UNION ALL` | When `VALUES` is unavailable or for compatibility with some SQL dialects. |
| `CTE + VALUES` | When the temporary data will be reused later in the query. |
| `VALUES` with multiple columns | Creating small lookup tables with multiple attributes. |