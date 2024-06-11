SELECT
   'GMDN terms known internally',
   (SELECT COUNT(DISTINCT termCode) FROM gmdn_term);

SELECT
   'Total GMDN records included obsoleted',
   (SELECT COUNT(termCode) FROM gmdn_term);

SELECT
   'GMDN terms not 5 digits long',
   (SELECT COUNT(*) FROM gmdn_term WHERE NOT (termCode REGEXP '[0-9]{5}'));

SELECT
   'Non-numeric GMDN terms',
   (SELECT COUNT(*) FROM gmdn_term WHERE termCode > '99999' OR termCode < '00000');

SELECT
   'GMDN terms that contain "single-use"',
   (SELECT COUNT(*) FROM gmdn_term WHERE termDefinition LIKE '%single-use%');
