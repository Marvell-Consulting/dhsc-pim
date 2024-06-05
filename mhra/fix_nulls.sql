-- Account for NULL exported as strings
UPDATE organisations
    SET REP_ORGANISATION_ID = NULL
    WHERE REP_ORGANISATION_ID = 'NULL';
