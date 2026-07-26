- STRING_AGG() is an aggregate function

- An ORDER BY clause only guarantees the order of the query it belongs to.

- If a query is used as a subquery, CTE, view, or derived table, its internal ORDER BY is not guaranteed to be preserved unless the outer query also requires that order.

- If an operation depends on the order of rows (such as STRING_AGG, ARRAY_AGG, or window functions), specify the ORDER BY where the operation is performed, not earlier

- Never rely on the database engine preserving an order by accident. The optimizer may change the execution plan at any time