-- Count the number of products without detected devices
WITH missing_devices AS (
    SELECT *
    FROM products
        LEFT OUTER JOIN devices ON products."Device ID" = devices.DEVICE_ID
    WHERE
        devices.DEVICE_ID IS NULL),
missing_products AS (
    SELECT *
    FROM products
        RIGHT OUTER JOIN devices ON products."Device ID" = devices.DEVICE_ID
    WHERE
        products."Device ID" IS NULL)
SELECT
    'Products referencing missing Devices',
    (SELECT COUNT(*) FROM missing_devices)
UNION SELECT
    'Distinct Devices missing',
    (SELECT COUNT(DISTINCT "Device ID") FROM missing_devices)
UNION SELECT
    'Devices without attached Products',
    (SELECT COUNT(*) FROM missing_products)
