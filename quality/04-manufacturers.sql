SELECT
    'Devices referencing a missing Manufacturer',
    (SELECT COUNT(*) FROM devices
    LEFT OUTER JOIN organisations ON devices.MAN_ORGANISATION_ID = organisations.MAN_ORGANISATION_ID
    WHERE organisations.MAN_ORGANISATION_ID IS NULL AND devices.MAN_ORGANISATION_ID IS NOT NULL);

SELECT
    'Distinct Manufacturers missing from Devices',
    (SELECT COUNT(DISTINCT devices.MAN_ORGANISATION_ID) FROM devices
    LEFT OUTER JOIN organisations ON devices.MAN_ORGANISATION_ID = organisations.MAN_ORGANISATION_ID
    WHERE organisations.MAN_ORGANISATION_ID IS NULL AND devices.MAN_ORGANISATION_ID IS NOT NULL);

SELECT
    'Products referencing a missing Manufacturer',
    (SELECT COUNT(*) FROM products
    LEFT OUTER JOIN organisations ON products."Manufacturer ID" = organisations.MAN_ORGANISATION_ID
    WHERE organisations.MAN_ORGANISATION_ID IS NULL AND products."Manufacturer ID" IS NOT NULL);

SELECT
    'Distinct Manufacturers missing from Products',
    (SELECT COUNT(DISTINCT products."Manufacturer ID") FROM products
    LEFT OUTER JOIN organisations ON products."Manufacturer ID" = organisations.MAN_ORGANISATION_ID
    WHERE organisations.MAN_ORGANISATION_ID IS NULL AND products."Manufacturer ID" IS NOT NULL);

SELECT
    'Devices and Products with mismatched Manufacturer',
    (SELECT COUNT(*) FROM products
    LEFT OUTER JOIN devices ON products."Device ID" = devices.DEVICE_ID
    WHERE devices.DEVICE_ID IS NOT NULL
    AND devices.MAN_ORGANISATION_ID <> products."Manufacturer ID")
