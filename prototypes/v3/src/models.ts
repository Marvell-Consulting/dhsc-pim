export class KeyValue {
  key: string = "";
  title: string = "";
  value: any = "";
}

export class Organisation {
  MAN_ORGANISATION_ID: string = "";
  MAN_ACCOUNT_NUMBER: string = "";
  MAN_ORGANISATION_NAME: string = "";
  ORGANISATION_ROLE: string = "";
  MAN_ORGANISATION_TYPE: string = "";
  MAN_EUROPEAN_SERVICE_REGNO: string = "";
  ORGANISATION_REGISTRATION_STATUS: string = "";
  VAT_REGISTRATION_NUMBER: string = "";
  COMPANY_REGISTRATION_NUMBER: string = "";
  MAN_ADDR_LINE_1: string = "";
  MAN_ADDR_LINE_2: string = "";
  MAN_ADDR_LINE_3: string = "";
  MAN_ADDR_LINE_4: string = "";
  MAN_CITY: string = "";
  MAN_STATE: string = "";
  MAN_COUNTYSTATEPROVINCE: string = "";
  MAN_POSTCODE: string = "";
  MAN_COUNTRY: string = "";
  REP_ORGANISATION_ID: string = "";
  REP_ACCOUNT_NUMBER: string = "";
  REP_NAME: string = "";
  RELATIONSHIP: string = "";
  REP_ADDRESS_LINE_1: string = "";
  REP_ADDRESS_LINE_2: string = "";
  REP_ADDRESS_LINE_3: string = "";
  REP_ADDRESS_LINE_4: string = "";
  REP_CITY: string = "";
  REP_STATE: string = "";
  REP_COUNTY_STATE_PROVINCE: string = "";
  REP_POSTCODE: string = "";
  REP_COUNTRY: string = "";
}

export class Device {
  DEVICE_ID: string = "";
  MAN_ORGANISATION_ID: string = "";
  DEVICE_TYPE_NAME: string = "";
  DEVICE_RISK_CLASSIFICATION_ID: string = "";
  DEVICE_RISK_SUB_TYPE_CODE: string = "";
  DEVICE_RISK_SUB_TYPE_DESC: string = "";
  DEVICE_RISK_IS_ACTIVE: string = "";
  GMDN_ID: string = "";
  GMDN_CODE: string = "";
  GMDN_TERM_NAME: string = "";
  IS_REGISTRED_UNDER_2017_MDRS: string = "";
  IS_CUSTOM_MADE: string = "";
  IS_STERILE: string = "";
  METHOD_STERILISATION: string = "";
  OTHER_STERILISATION: string = "";
  IS_MEASURING: string = "";
  DEV_NOTIFIED_BODY_ID: string = "";
  NOTIFIED_BODY_NAME: string = "";
  DEVICE_REG_STATUS_CODE: string = "";
  REG_DEV_STATUS: string = "";
  SCHEDULEXVI: string = "";
  SINGLE_USE_DEVICE: string = "";
  DEV_UDI_NUMBERS: string = "";
  DEV_UDI_ENTITY_ID: string = "";
  DEV_UDI_ENTITY_CODE: string = "";
  IS_PERFORMANCE_STUDIES: string = "";
  DEVICE_TYPE_CODE: string = "";
  DEVICE_IMPLANTABLE: string = "";
  DEVICE_ACTIVE: string = "";
  ADMINISTER_REMOVE_MEDICINAL_PRODUCT: string = "";
  IS_REUSABLE_SURGICAL_INSTRUMENTS: string = "";
  MAXIMUM_NUMBER_REUSE: string = "";
}

export class Product {
  PRODUCT_ID: string = "";
  DEVICE_ID: string = "";
  MANUFACTURER_ID: string = "";
  MANUFACTURER_NAME: string = "";
  BRAND_TRADE_NAME: string = "";
  IS_MODEL: string = "";
  MODEL: string = "";
  PRODUCT_CODE: string = "";
  NOTIFIED_BODY_ID: string = "";
  NOTIFIED_BODY_NAME: string = "";
  DEVICE_PRODUCT_REGISTRATION_STATUS_ID: string = "";
  QUANTITY_PER_PACKAGE: string = "";
  IS_STERILE: string = "";
  METHOD_STERILISATION: string = "";
  OTHER_STERILISATION: string = "";
  UDI_NUMBER: string = "";
  UDI_ENTITY_ID: string = "";
  UDI_ENTITY_CODE: string = "";
  UDI_PI_TYPE: string = "";
  UNIT_OF_USE_UDI_DI: string = "";
  SECONDARY_UDI_NUMBER: string = "";
  SECONDARY_UDI_ENTITY_ID: string = "";
  SECONDARY_UDI_ENTITY_CODE: string = "";
  IS_DEVICE_DIRECTLY_MARKED_WITH_UDI_DI: string = "";
  DIRECT_MARKING_DI_DIFFERENT_FROM_UDI_DI: string = "";
  DIRECT_MARKING_DI: string = "";
  PACKAGE_DI: string = "";
  PACKAGE_DI_NUMBER_LEVEL1: string = "";
  PACKAGE_TYPE_LEVEL1: string = "";
  PACKAGE_DI_NUMBER_LEVEL2: string = "";
  PACKAGE_TYPE_LEVEL2: string = "";
  PACKAGE_DI_NUMBER_LEVEL3: string = "";
  PACKAGE_TYPE_LEVEL3: string = "";
  PRODUCT_STATUS: string = "";
  IS_CONTAINING_LATEX: string = "";
  IS_CLINICAL_SIZE: string = "";
  CLINICAL_SIZE_DESCRIPTION: string = "";
  URL_ADDITIONAL: string = "";
  IS_CRITICAL_WARNING: string = "";
  CRITICAL_WARNING_DESCRIPTION: string = "";
}

export class PARDProduct {
  DEVICE_ID: string = "";
  MAN_ORGANISATION_ID: string = "";
  GMDN_ID: string = "";
  GMDN_CODE: string = "";
  GMDN_TERM_NAME: string = "";
  DEVICE_TYPE_CODE: string = "";
  DEVICE_TYPE_NAME: string = "";
  DEV_NOTIFIED_BODY_ID: string = "";
  NOTIFIED_BODY_NAME: string = "";
  DEVICE_RISK_CLASSIFICATION_ID: string = "";
  DEVICE_RISK_SUB_TYPE_CODE: string = "";
  DEVICE_RISK_SUB_TYPE_DESC: string = "";
  DEVICE_RISK_IS_ACTIVE: string = "";
  DEVICE_REG_STATUS_CODE: string = "";
  REG_DEV_STATUS: string = "";
  IS_REGISTRED_UNDER_2017_MDRS: string = "";
  IS_STERILE: string = "";
  METHOD_STERILISATION: string = "";
  OTHER_STERILISATION: string = "";
  IS_MEASURING: string = "";
  SCHEDULEXVI: string = "";
  SINGLE_USE_DEVICE: string = "";
  DEV_UDI_NUMBERS: string = "";
  DEV_UDI_ENTITY_ID: string = "";
  DEV_UDI_ENTITY_CODE: string = "";
  DEVICE_IMPLANTABLE: string = "";
  DEVICE_ACTIVE: string = "";
  ADMINISTER_REMOVE_MEDICINAL_PRODUCT: string = "";
  IS_REUSABLE_SURGICAL_INSTRUMENTS: string = "";
  IS_CUSTOM_MADE: string = "";
  IS_PERFORMANCE_STUDIES: string = "";
  MAXIMUM_NUMBER_REUSE: string = "";
  MAN_ORGANISATION_NAME: string = "";
}

export const NameMap = new Map<string, string>([
  ["MANUFACTURER_NAME", "Manufacturer name"],
  ["GMDN_CODE", "GMDN code"],
  ["GMDN_TERM_NAME", "GMDN name"],
  ["BRAND_TRADE_NAME", "Brand name"],
  ["MODEL", "Model"],
  ["PRODUCT_CODE", "Manufacturer product code (MPC)"],
  ["NOTIFIED_BODY_NAME", "Notified Body"],
  ["IS_STERILE", "Sterile"],
  ["UDI_NUMBER", "UDI-DI"],
  ["UNIT_OF_USE_UDI_DI", "Unit of issue"],
  ["IS_CONTAINING_LATEX", "Contains latex"],
  ["COMPANY_REGISTRATION_NUMBER", "Companies house registration number"],
  ["MAN_ADDR_LINE_1", "Manufacturer address"],
  ["MAN_ADDR_LINE_2", "Manufacturer address (second line)"],
  ["MAN_ADDR_LINE_3", "Manufacturer address (third line)"],
  ["MAN_ADDR_LINE_4", "Manufacturer address (fourth line)"],
  ["MAN_CITY", "Manufacturer address (city)"],
  ["MAN_STATE", "Manufacturer address (state)"],
  ["MAN_COUNTYSTATEPROVINCE", "Manufacturer address (county/province)"],
  ["MAN_POSTCODE", "Manufacturer address (Postcode)"],
  ["MAN_COUNTRY", "Manufacturer address (Country)"],
  ["REP_NAME", "Supplier"],
  ["DEVICE_RISK_SUB_TYPE_DESC", "Risk class"],
  ["IS_CUSTOM_MADE", "Custom made"],
  ["IS_STERILE", "Sterile"],
  ["NOTIFIED_BODY_NAME", "Notified Body"],
  ["SINGLE_USE_DEVICE", "Single use"],
  [
    "IS_PERFORMANCE_STUDIES",
    "In-Vitro Diagnostic Medical Device for ‘Performance Evaluation’",
  ],
  ["DEVICE_IMPLANTABLE", "Implantable"],
  ["MAXIMUM_NUMBER_REUSE", "Limit of device reprocessing cycles"],
]);

export const PAQMap = new Map<string, string>([
  ["P_DESCR", "Product description"],
  ["P_NHS_ECLASS", "NHS eClass"],
  ["P_AUTHED_REP", "EU Authorised Representative"],
  ["P_FIRST_PLACED", "First placed on market"],
  ["P_STILL_PRODUCED", "Still in production"],
  ["P_PROD_ENDED", "Production ended"],
  ["P_MDDC", "Medical devices directive classification"],
  ["P_AIDD", "Active implantable devices directive"],
  ["P_IVD", "In-Vitro Diagnostics Medical Device Directive Category"],
  ["P_MQ_SYSTEMS", "Management / quality system standards"],
  ["P_CERT_BODY", "Certification body"],
  ["P_NO_OBJ", "MHRA 'no objection' reference number"],
  ["P_PMP", "Prescribing medical practitioner"],
  ["P_MAN_SUPP", "Manufacturer support"],
  [
    "P_AVAILABILITY",
    "Support includes availability of parts and supply of consumables / accessories",
  ],
  ["P_INC_TRAINING", "Support includes training, maintenance or repair"],
  ["P_WARRANTY", "Device warranty period"],
  ["P_LIFETIME", "Working lifetime"],
  ["P_NOTIFICATIONS", "Notification of device alerts or upgrades"],
  ["P_LOAN", "Identical loan equipment available"],
  ["P_INSTALL", "Installation or ancillary service requirements"],
  ["P_DISPOSABLE", "Disposable, non-serviceable device"],
  ["P_MAINT", "Maintenence, repair and technical support provided"],
  ["P_SERVICE_LOCATIOn", "Servicing facility location"],
  [
    "P_STAFF_TRAINED",
    "Servicing staff verifiably trained and competency assessed",
  ],
  ["P_QUAL", "Qualification or competency records available on request"],
  [
    "P_CERTIFIED",
    "Servicing organisation currently certified to any management system standards",
  ],
  ["P_MSS", "Management system standards"],
  [
    "P_ALT",
    "Contract alternatives offered include an option for in-house equipment servicing",
  ],
  ["P_DECOM", "Level of decontamination needed"],
  ["P_EN_ISO", "Instructions meet the requirements of EN-ISO-17664"],
  ["P_PROCESSING", "Needs processing or reprocessing before or between uses"],
  ["P_UNIQ_ID", "Device is uniquely identifiable"],
  [
    "P_TRANSMIT",
    "Stores or transmits patient information that will require information governance measures",
  ],
  ["P_CONNT", "Connects to IT or network services"],
  ["P_SAFETY_MEASURES", "Requires safety management measures"],
  ["P_HAZARDS", "Identified hazards"],
  ["P_PERF_QUALITY", "Requires performance quality assurance measures"],
  ["P_QA_MEASURES", "Quality assurance measures"],
  [
    "P_TRAINING_AVAILE",
    "Competency-based user training available from the manufacturer or an authorised provider",
  ],
  [
    "P_DECOM_TRAINING",
    "Competency-based decontamination / reprocessing training available from the manufacturer or an authorised provider",
  ],
  [
    "P_RECORDS",
    "Qualification / competency records of training providers available upon request",
  ],
  ["P_PHONE", "Manufacturer phone number"],
  ["P_EMAIL", "Manufacturer email"],
]);
