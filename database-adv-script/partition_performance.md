# Partition Performance Report

## Objective:
The goal of this task was to optimize the query performance for large datasets in the `Booking` table by implementing table partitioning based on the `start_date` column. Partitioning allows the database engine to split large tables into smaller, more manageable pieces, thus improving query efficiency, especially when filtering data by a date range.

## Partitioning Strategy:
To optimize query performance, the `Booking` table was partitioned using the `start_date` column. We applied the `RANGE` partitioning method to divide the data into partitions based on the year extracted from the `start_date`.

The partitioning scheme was designed as follows:
- **Partition p_2022**: Contains records with a `start_date` before the year 2023.
- **Partition p_2023**: Contains records with a `start_date` before the year 2024.
- **Partition p_2024**: Contains records with a `start_date` before the year 2025.
- **Partition p_2025**: Contains records with a `start_date` before the year 2026.
- Additional partitions can be added for future years as needed.

This method targets improved performance for queries filtering on the `start_date` column, especially when retrieving bookings for a specific year or date range.

## Process:
1. **Create a New Partitioned Table**: We created a new `booking_partition` table and partitioned it by the `start_date` column.
2. **Data Migration**: We migrated all records from the original `Booking` table into the new partitioned table.
3. **Performance Testing**: We tested the query performance before and after partitioning by running queries on date ranges, such as fetching bookings for the year 2024.

### Example Query (Post-Partitioning):
```sql
SELECT * 
FROM booking_partitioned 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

## Performance Observations:

### Query Speed:
- Queries filtering on specific date ranges (e.g., bookings for the year 2023) were significantly faster after partitioning.
- The database only scans the relevant partition (e.g., `p_2023` for the year 2023), rather than the entire table, reducing the query execution time.

### Reduced I/O:
- Partitioning led to reduced I/O operations as the database engine no longer needs to scan through the entire table. Instead, it accesses only the partition relevant to the date range in question.

### Efficiency:
- The partitioned table enabled faster data retrieval for date-specific queries, especially in a scenario with millions of records spanning multiple years.
- By avoiding full-table scans, the system becomes more efficient, improving overall query performance.

## Conclusion:
- Partitioning the `Booking` table by `start_date` yielded significant performance improvements, particularly for date-based queries. This optimization is beneficial for applications that need to query large amounts of data based on specific date ranges, such as querying bookings for a particular year or month.

