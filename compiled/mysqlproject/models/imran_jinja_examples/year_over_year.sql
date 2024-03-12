 -- Top N products

WITH product_revenue AS (
    -- Calculate total revenue per product for current and previous years
    SELECT
        product_id,
        EXTRACT(YEAR FROM created_at) AS year,
        SUM(amount) AS total_revenue
    FROM `dbt_dev`.`iraw_payments`
    GROUP BY product_id, year
),
ranked_products AS (
    -- Rank products by last year's total revenue
    SELECT
        product_id,
        total_revenue
    FROM product_revenue
    WHERE year = EXTRACT(YEAR FROM CURRENT_DATE) - 1
    ORDER BY total_revenue DESC
    LIMIT 5
),
yoy_growth AS (
    -- Calculate YoY growth for the top N products
    SELECT
        rp.product_id,
        rp.total_revenue AS last_year_revenue,
        cr.total_revenue AS current_year_revenue,
        (cr.total_revenue - rp.total_revenue) / NULLIF(rp.total_revenue, 0) * 100 AS yoy_growth_percentage
    FROM ranked_products rp
    LEFT JOIN product_revenue cr ON rp.product_id = cr.product_id AND cr.year = EXTRACT(YEAR FROM CURRENT_DATE)
)

SELECT * FROM yoy_growth