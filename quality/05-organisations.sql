SELECT
    'Organisations',
    (SELECT COUNT(*) FROM organisations);

SELECT
    'Organisations without Companies House Number',
    (SELECT COUNT(*) FROM organisations WHERE COMPANY_REGISTRATION_NUMBER IS NULL OR COMPANY_REGISTRATION_NUMBER = '');

SELECT
    'Organisations without VAT Number',
    (SELECT COUNT(*) FROM organisations WHERE VAT_REGISTRATION_NUMBER IS NULL OR VAT_REGISTRATION_NUMBER = '');

SELECT
    'Organisations without Postcode',
    (SELECT COUNT(*) FROM organisations WHERE MAN_POSTCODE IS NULL OR MAN_POSTCODE = '');

SELECT
    'Organisations in the UK with invalid UK postcode',
    (SELECT COUNT(*) FROM organisations WHERE
        MAN_POSTCODE IS NOT NULL AND MAN_POSTCODE <> 'NULL' AND (MAN_COUNTRY REGEXP '[Uu]nited [Kk]ingdom')
        AND NOT (MAN_POSTCODE REGEXP
        -- Regex by ctwheels, https://stackoverflow.com/a/51828886/3729369 used under CC-BY-SA 4.0
        -- Tweaked for unlimited whitespace/dots and to remove word boundaries that confuse SQLite.
        '[A-Za-z][A-HJ-Ya-hj-y]?[0-9][0-9A-Za-z]?[ \.]*[0-9][A-Za-z]{2}|[Gg][Ii][Rr][ \.]*0[Aa]{2}'));

SELECT
    'MHRA Account numbers duplicated',
    (SELECT COUNT(*) FROM (
        SELECT COUNT(MAN_ACCOUNT_NUMBER) AS uses FROM organisations
        GROUP BY MAN_ACCOUNT_NUMBER HAVING uses > 1));

SELECT
    'Organisations with Representatives',
    (SELECT COUNT(*) FROM organisations WHERE REP_ORGANISATION_ID IS NOT NULL);

SELECT
    'Organisations with Representatives different to them',
    (SELECT COUNT(*) FROM organisations WHERE REP_ORGANISATION_ID <> MAN_ORGANISATION_ID);

SELECT
    'Organisations with Representatives missing',
    (SELECT COUNT(*)
     FROM organisations AS manufacturers
        LEFT OUTER JOIN organisations AS representatives
        ON manufacturers.REP_ORGANISATION_ID = representatives.MAN_ORGANISATION_ID
     WHERE manufacturers.REP_ORGANISATION_ID IS NOT NULL
     AND representatives.MAN_ORGANISATION_ID IS NULL)
