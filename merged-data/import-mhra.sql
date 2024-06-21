attach database '../mhra/mhra.sqlite' as mhra;

CREATE TABLE mhra_organisations AS SELECT * FROM mhra.organisations;
CREATE UNIQUE INDEX organisations_man_ID ON mhra_organisations(MAN_ORGANISATION_ID);
CREATE INDEX organisations_rep_ID ON mhra_organisations(REP_ORGANISATION_ID);

CREATE TABLE mhra_devices AS SELECT * FROM mhra.devices;
CREATE UNIQUE INDEX devices_ID ON mhra_devices(DEVICE_ID);
CREATE INDEX devices_organisation_ID ON mhra_devices(MAN_ORGANISATION_ID);

CREATE TABLE mhra_products AS SELECT * FROM mhra.products;
CREATE UNIQUE INDEX products_product_ID ON mhra_products('Product ID');
CREATE INDEX products_device_ID ON mhra_products('Device ID');

