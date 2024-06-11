attach database '../gudid/gudid.sqlite' as gudid;

CREATE TABLE gudidDevice AS SELECT * FROM gudid.device;
CREATE INDEX device_PrimaryDI on gudidDevice(PrimaryDI);
CREATE TABLE gudidGmdnTerms AS SELECT * FROM gudid.gmdnTerms;
CREATE INDEX gmdnTerms_PrimaryDI on gudidGmdnTerms(PrimaryDI);
CREATE TABLE gudidProductCodes AS SELECT * FROM gudid.productCodes;
CREATE INDEX productCodes_PrimaryDI on gudidProductCodes(PrimaryDI);
CREATE TABLE gudidIdentifiers AS SELECT * FROM gudid.identifiers;
CREATE INDEX identifiers_PrimaryDI on gudidIdentifiers(PrimaryDI);
CREATE TABLE gudidSterilizationMethodTypes AS SELECT * FROM gudid.sterilizationMethodTypes;
CREATE INDEX sterilizationMethodTypes_PrimaryDI ON gudidSterilizationMethodTypes(PrimaryDI);
CREATE TABLE gudidEnvironmentalConditions AS SELECT * FROM gudid.environmentalConditions;
CREATE INDEX environmentalConditions_PrimaryDI ON gudidEnvironmentalConditions(PrimaryDI);
CREATE TABLE gudidContacts AS SELECT * FROM gudid.contacts;
CREATE INDEX contacts_PrimaryDI ON gudidContacts(PrimaryDI);
