WITH device_gmdns AS (
    SELECT *
    FROM devices
        LEFT OUTER JOIN gmdn_term ON devices.GMDN_CODE = gmdn_term.termCode
)

SELECT
    'Devices missing a GMDN term',
    (SELECT COUNT(*) FROM device_gmdns WHERE GMDN_CODE IS NULL OR termCode IS NULL)

UNION SELECT
    -- This many devices are using GMDNs that have an obsoleted date in the
    -- past, using the date of 2024-03-25 which is the timestamp of when the
    -- file was generated
    'Devices using an obsoleted GMDN term',
    (SELECT COUNT(*) FROM device_gmdns WHERE DATE(obsoletedDate) < DATE('2024-03-25'))

-- Can't run this because our data doens't contain the LAST_UPDATED_DATE found in PARD (?)
-- SELECT
--     "Devices modified to use an obsolete GMDN",
--     (SELECT COUNT(*) FROM device_gmdns WHERE DATE(obsoletedDate) < DATE(LAST_UPDATED_DATE));

UNION SELECT
    'Devices using "single-use" GMDN terms that are marked as NOT "single use devices"',
    (SELECT COUNT(*) FROM device_gmdns WHERE termDefinition LIKE '%single-use%' AND SINGLE_USE_DEVICE = 'No')

UNION SELECT
    'Devices using "single-use" GMDN terms that are not known if "single use devices"',
    (SELECT COUNT(*) FROM device_gmdns WHERE termDefinition LIKE '%single-use%' AND SINGLE_USE_DEVICE <> 'Yes' AND SINGLE_USE_DEVICE <> 'No')
