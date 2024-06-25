CREATE TEMPORARY VIEW devices_products AS SELECT * FROM mhra_devices, mhra_products WHERE mhra_products."Device ID" = mhra_devices.DEVICE_ID;

-- How many full MHRA records (devices with a device and one or more product record) do we have?

select count(distinct devices_products.DEVICE_ID) from devices_products; -- 99626

-- gudid: 10,995 MHRA records match

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
WHERE gudid_join.PrimaryDI IS NOT NULL;

-- gudidDevice.brandName: 10,995 MHRA records (all matches)

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidDevice ON gudidDevice.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidDevice.brandName IS NOT NULL
  AND gudidDevice.brandName <> '';

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 99,626
FROM devices_products
WHERE "Brand Trade Name" IS NOT NULL AND "Brand Trade Name" <> '';

-- gudidDevice.deviceDescription: 8,689 MHRA records

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidDevice ON gudidDevice.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidDevice.deviceDescription IS NOT NULL
  AND gudidDevice.deviceDescription <> '';

-- gudidSterilizationMethodTypes: 3,989 MHRA records

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidSterilizationMethodTypes ON gudidSterilizationMethodTypes.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidSterilizationMethodTypes.sterilizationMethod IS NOT NULL
  AND gudidSterilizationMethodTypes.sterilizationMethod <> '';

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 99,626
FROM devices_products
WHERE (METHOD_STERILISATION IS NOT NULL AND METHOD_STERILISATION <> '') OR ("Method Sterilisation" IS NOT NULL AND "Method Sterilisation" <> '');

-- gudidDevice.manufacturingDate: 4,488 MHRA records

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidDevice ON gudidDevice.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidDevice.manufacturingDate IS NOT NULL
  AND gudidDevice.manufacturingDate <> '';

-- gudidIdentifiers.pkgStatus: 1,626 MHRA records have at least one GUDID identifier with pkgStatus

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidIdentifiers ON gudidIdentifiers.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidIdentifiers.pkgStatus IS NOT NULL
  AND gudidIdentifiers.pkgStatus <> '';

-- gudidEnvironmentalConditions: 2,502 MHRA records have GUDID environmental conditions

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidEnvironmentalConditions ON gudidEnvironmentalConditions.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidEnvironmentalConditions.storageHandlingType IS NOT NULL
  AND gudidEnvironmentalConditions.storageHandlingType <> '';

-- gudidDevice.companyName: 10,995 MHRA records (all matches)

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidDevice ON gudidDevice.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidDevice.companyName IS NOT NULL
  AND gudidDevice.companyName <> '';

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 99,580
FROM devices_products LEFT OUTER JOIN mhra_organisations ON devices_products.MAN_ORGANISATION_ID = mhra_organisations.MAN_ORGANISATION_ID
WHERE mhra_organisations.MAN_ORGANISATION_NAME IS NOT NULL AND mhra_organisations.MAN_ORGANISATION_NAME <> '';

-- gudidDevice.singleUse: 10,995 MHRA records (all matches)

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidDevice ON gudidDevice.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidDevice.singleUse IS NOT NULL;

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 79,661
FROM devices_products
WHERE (SINGLE_USE_DEVICE IS NOT NULL AND SINGLE_USE_DEVICE <> '');

-- gudidGmdnTerms.implantable: 10,995 MHRA records (all matches)

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidGmdnTerms ON gudidGmdnTerms.PrimaryDI = gudid_join.PrimaryDI
WHERE gudidGmdnTerms.implantable IS NOT NULL;

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 47953
FROM devices_products
WHERE (DEVICE_IMPLANTABLE IS NOT NULL AND DEVICE_IMPLANTABLE <> '');

-- gudidContacts: 6,944 MHRA records

SELECT COUNT(DISTINCT devices_products.DEVICE_ID)
FROM devices_products LEFT OUTER JOIN gudid_join ON devices_products.DEVICE_ID = gudid_join.DEVICE_ID
     LEFT OUTER JOIN gudidContacts ON gudidContacts.PrimaryDI = gudid_join.PrimaryDI
WHERE (gudidContacts.phone IS NOT NULL AND gudidContacts.phone <> '') OR (gudidContacts.email IS NOT NULL AND gudidContacts.email <> '');

SELECT COUNT(DISTINCT devices_products.DEVICE_ID) -- 99572
FROM devices_products LEFT OUTER JOIN mhra_organisations ON devices_products.MAN_ORGANISATION_ID = mhra_organisations.MAN_ORGANISATION_ID
WHERE mhra_organisations.MAN_ADDR_LINE_1 IS NOT NULL AND mhra_organisations.MAN_ADDR_LINE_1 <> '';

-- Website - what field?
