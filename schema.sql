CREATE TABLE organisations (
       MAN_ORGANISATION_ID integer PRIMARY KEY,
       MAN_CREATED_DATE string,

       ORGANISATION_ROLE string,
       MAN_ORGANISATION_TYPE string,
       MAN_ORGANISATION_NAME string,
       MAN_ADDR_LINE_1 string,
       MAN_ADDR_LINE_2 string,
       MAN_ADDR_LINE_3 string,
       MAN_ADDR_LINE_4 string,
       MAN_CITY string,
       MAN_STATE string,
       MAN_COUNTYSTATEPROVINCE string,
       MAN_COUNTRY string,
       MAN_POSTCODE string,
       MAN_EUROPEAN_SERVICE_REGNO string,
       ORGANISATION_REGISTRATION_STATUS string,
       VAT_REGISTRATION_NUMBER string,
       COMPANY_REGISTRATION_NUMBER string,

       REP_ORGANISATION_ID integer,
       REP_ACCOUNT_NUMBER string,
       REP_NAME string,
       REP_ADDRESS_LINE_1 string,
       REP_ADDRESS_LINE_2 string,
       REP_ADDRESS_LINE_3 string,
       REP_ADDRESS_LINE_4 string,
       REP_CITY string,
       REP_STATE string,
       REP_COUNTY_STATE_PROVINCE string,
       REP_COUNTRY string,
       REP_POSTCODE string,

       RELATIONSHIP string,

       LAST_UPDATED_DATE string,

       MAN_ACCOUNT_NUMBER integer
);
CREATE TABLE devices (
       DEVICE_ID integer PRIMARY KEY,
       MAN_ORGANISATION_ID integer,
       GMDN_ID string,
       GMDN_CODE integer,
       GMDN_TERM_NAME string,

       DEVICE_TYPE_CODE string,
       DEVICE_TYPE_NAME string,

       DEV_NOTIFIED_BODY_ID string,
       NOTIFIED_BODY_NAME string,

       DEVICE_RISK_CLASSIFICATION_ID string,
       DEVICE_RISK_SUB_TYPE_CODE string,
       DEVICE_RISK_SUB_TYPE_DESC string,
       DEVICE_RISK_IS_ACTIVE string,

       DEVICE_REG_STATUS_CODE string, -- pair
       REG_DEV_STATUS string, -- pair

       IS_REGISTRED_UNDER_2017_MDRS string,
       IS_STERILE string,
       METHOD_STERILISATION string,
       OTHER_STERILISATION string,
       IS_MEASURING string,
       SCHEDULEXVI string,
       SINGLE_USE_DEVICE string,
       DEV_UDI_NUMBERS string,
       DEV_UDI_ENTITY_ID string, -- pair
       DEV_UDI_ENTITY_CODE string, -- pair
       DEVICE_IMPLANTABLE string,
       DEVICE_ACTIVE string,
       ADMINISTER_REMOVE_MEDICINAL_PRODUCT string,
       IS_REUSABLE_SURGICAL_INSTRUMENTS string,
       IS_CUSTOM_MADE string,
       IS_PERFORMANCE_STUDIES string,

       MAXIMUM_NUMBER_REUSE string
);
CREATE TABLE gmdn_term(
  termCode NUM,
  termName NUM,
  termDefinition NUM,
  termStatus NUM,
  termIsIVD NUM,
  createdDate NUM,
  modifiedDate NUM,
  obsoletedDate NUM
);
CREATE TABLE products (
'Product ID' string,
'Device ID' string,
'Manufacturer ID' string,
'Manufacturer Name' string,
'Brand Trade Name' string,
'Is Model' string,
'MODEL' string,
'Product Code' string,
'Notified Body ID' string,
'Notified Body Name' string,
'Device Product Registration Status ID' string,
'Quantity Per Package' string,
'Is Sterile' string,
'Method Sterilisation' string,
'Other Sterilisation' string,
'Udi Number' string,
'Udi Entity ID' string,
'Udi Entity Code' string,
'Udi Pi Type' string,
'Unit Of Use Udi Di' string,
'Secondary Udi Number' string,
'Secondary Udi Entity ID' string,
'Secondary Udi Entity Code' string,
'Is Device Directly Marked With Udi Di' string,
'Direct Marking Di Diffrent From Udi Di' string,
'Direct Marking Di' string,
'Package Di' string,
'Package Di Number Level1' string,
'Package Type Level1' string,
'Package Di Number Level2' string,
'Package Type Level2' string,
'Package Di Number Level3' string,
'Package Type Level3' string,
'Product Status' string,
'Is Containing Latex' string,
'Is Clinical Size' string,
'Clinical Size Description' string,
'Url Additional' string,
'Is Critical Warning' string,
'Critical Warning Description' string

);
CREATE INDEX products_deviceID on products('Device ID');

CREATE VIRTUAL TABLE search USING fts5(DEVICE_ID, PRODUCT, MANUFACTURER, UDI);
