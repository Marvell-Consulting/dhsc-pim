-- Account for NULL exported as strings
UPDATE organisations
    SET REP_ORGANISATION_ID = NULL
    WHERE REP_ORGANISATION_ID = 'NULL';

-- Normalise enums
UPDATE products
    SET "Product Status" = 'On the GB & NI market'
    WHERE "Product Status" IN (
        'GB & NI ',
        'GB and NI',
        'On GB & NI market',
        'On GB NI market',
        'On GB&NI Market ',
        'On GB&NI Markets',
        'on GB&NI Markets ',
        'On The GB & NI Market',
        'On the GB & NI Market',
        'On the GB & NI market ',
        'On the GB and NI Market',
        'On the GB and NI market'
    );

UPDATE products
    SET "Product Status" = 'On the GB market'
    WHERE "Product Status" IN (
        'GB',
        'GB market'
    );

UPDATE products
    SET "Product Status" = 'On the UK market'
    WHERE "Product Status" IN (
        'On the UK and NI Market' -- TODO is this the same? IS it the same as GB + NI?
    );

UPDATE products
    SET "Product Status" = 'No longer placed on the GB or NI market'
    WHERE "Product Status" IN (
        'No longer on the GB or NI market'
    );
