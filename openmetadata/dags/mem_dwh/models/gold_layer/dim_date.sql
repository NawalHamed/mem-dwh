WITH date_data AS (
    SELECT
        d::date AS date,
        EXTRACT(year FROM d) AS year,
        EXTRACT(month FROM d) AS month,
        EXTRACT(day FROM d) AS day,
        EXTRACT(quarter FROM d) AS quarter,
        TO_CHAR(d, 'Day') AS day_name,
        TO_CHAR(d, 'Month') AS month_name,
        (d::date - EXTRACT(DOW FROM d)::int) AS week_start -- Explicit cast to date
    FROM generate_series(
        '2020-01-01'::timestamp, -- Start date
        '2030-12-31'::timestamp, -- End date
        '1 day'::interval         -- Daily granularity
    ) d
)
SELECT
    ROW_NUMBER() OVER () AS date_id, -- Primary Key
    date,
    year,
    month,
    day,
    quarter,
    day_name,
    month_name,
    week_start
FROM date_data
