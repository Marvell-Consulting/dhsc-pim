CREATE TABLE device (
PrimaryDI string primary key,
publicDeviceRecordKey string,
publicVersionStatus string,
deviceRecordStatus string,
publicVersionNumber string,
publicVersionDate string,
devicePublishDate string,
deviceCommDistributionEndDate string,
deviceCommDistributionStatus string,
brandName string,
versionModelNumber string,
catalogNumber string,
dunsNumber string,
companyName string,
deviceCount string,
deviceDescription string,
DMExempt string,
premarketExempt string,
deviceHCTP string,
deviceKit string,
deviceCombinationProduct string,
singleUse string,
lotBatch string,
serialNumber string,
manufacturingDate string,
expirationDate string,
donationIdNumber string,
labeledContainsNRL string,
labeledNoNRL string,
MRISafetyStatus string,
rx string,
otc string,
deviceSterile string,
sterilizationPriorToUse
);

CREATE TABLE gmdnTerms (
PrimaryDI string,
gmdnPTName string,
gmdnPTDefinition string,
gmdnCode string,
gmdnCodeStatus string,
implantable string
);
CREATE INDEX gmdnTerms_PrimaryDI on gmdnTerms(PrimaryDI);

CREATE TABLE productCodes (
PrimaryDI string,
productCode string,
productCodeName string
);
CREATE INDEX productCodes_PrimaryDI on productCodes(PrimaryDI);

CREATE TABLE identifiers (
PrimaryDI string,
deviceId string,
deviceIdType string,
deviceIdIssuingAgency string,
containsDINumber string,
pkgQuantity string,
pkgDiscontinuedate string,
pkgStatus string,
pkgType string
);
CREATE INDEX identifiers_PrimaryDI on identifiers(PrimaryDI);
