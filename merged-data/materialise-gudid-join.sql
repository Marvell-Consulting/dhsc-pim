.header on

-- Find the same device in gudid and mhra devices data (by matching UDIs)

create temporary table device_products as
select * from mhra_devices LEFT OUTER JOIN mhra_products ON mhra_devices.DEVICE_ID = mhra_products."Device ID";
create index devices_DEV_UDI_ENTITY_CODE on device_products(DEV_UDI_ENTITY_CODE);
create index devices_DEV_UDI_NUMBERS on device_products(DEV_UDI_NUMBERS);
create index products_Udi_Entity_Code on device_products("Udi Entity Code");
create index products_Udi_Number on device_products("Udi Number");

create temporary table gudid_gmdns as
select * from gudidIdentifiers INNER JOIN gudidGmdnTerms ON gudidIdentifiers.PrimaryDI = gudidGmdnTerms.PrimaryDI;
create index gudid_deviceIdIssuingAgency on gudid_gmdns(deviceIdIssuingAgency);
create index gudid_deviceId on gudid_gmdns(deviceId);

create table gudid_join as
select device_products.DEVICE_ID, device_products.GMDN_CODE, device_products.GMDN_TERM_NAME,
       device_products."Brand Trade Name",
       device_products.DEV_UDI_ENTITY_CODE, device_products."Udi Entity Code", gudid_gmdns.deviceIdIssuingAgency,
       gudid_gmdns.deviceId,
       gudid_gmdns.PrimaryDI, gudid_gmdns.gmdnCode, gudid_gmdns.gmdnPTName
from device_products, gudid_gmdns
where (device_products.DEV_UDI_NUMBERS = gudid_gmdns.deviceId
      and ((device_products.DEV_UDI_ENTITY_CODE = gudid_gmdns.deviceIdIssuingAgency)
           or
           (device_products.DEV_UDI_ENTITY_CODE = 'GS1 AISBL'
            and gudid_gmdns.deviceIdIssuingAgency = 'GS1')))
     or (device_products."Udi Number" = gudid_gmdns.deviceId
        and ((device_products."Udi Entity Code" = gudid_gmdns.deviceIdIssuingAgency)
             or
             (device_products."Udi Entity Code" = 'GS1 AISBL'
              and gudid_gmdns.deviceIdIssuingAgency = 'GS1')));


