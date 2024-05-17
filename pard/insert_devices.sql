INSERT INTO devices (
    MAN_ORGANISATION_ID,
    DEVICE_ID,
    GMDN_CODE,
    GMDN_TERM_NAME,
    IS_CUSTOM_MADE,
    IS_PERFORMANCE_STUDIES,
    DEVICE_REG_STATUS_CODE,
    DEVICE_TYPE_NAME)
SELECT
    json_extract(value, '$.MAN_ORGANISATION_ID'),
    json_extract(value, '$.DEVICE_ID'),
    json_extract(value, '$.GMDN_CODE'),
    json_extract(value, '$.GMDN_TERM_NAME'),
    json_extract(value, '$.IS_CUSTOM_MADE'),
    json_extract(value, '$.IS_PERFORMANCE_STUDIES'),
    json_extract(value, '$.DEVICE_REG_STATUS_CODE'),
    json_extract(value, '$.DEVICE_TYPE_NAME')
FROM
    json_each(readfile('devices.json'));
