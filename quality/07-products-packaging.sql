SELECT
    'Products with packaging with separate UDI-DI number',
    (SELECT COUNT(*) FROM products WHERE
        ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL AND "Package Di Number Level1" <> "Udi Number") OR
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL AND "Package Di Number Level2" <> "Udi Number") OR
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL AND "Package Di Number Level3" <> "Udi Number"));
SELECT
    'Products with packaging DI numbers but not marked as such in "Product Di" field',
    (SELECT COUNT(*) FROM products WHERE "Package Di" <> 'Yes' AND
        ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL) OR
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL) OR
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL));
SELECT
    'Products with packaging DI numbers but not a "Udi Number"',
    (SELECT COUNT(*) FROM products WHERE ("Udi Number" = '' OR 'Udi Number' IS NULL) AND
        ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL) OR
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL) OR
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL));
SELECT
    'Products with exactly one level of packaging DI numbers',
    (SELECT COUNT(*) FROM products WHERE
        ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL) AND NOT
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL) AND NOT
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL));
SELECT
    'Products with exactly two levels of packaging DI numbers',
    (SELECT COUNT(*) FROM products WHERE
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL) AND NOT
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL));

SELECT
    'Products with exactly three levels of packaging DI numbers',
    (SELECT COUNT(*) FROM products WHERE
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL));
SELECT
    'Products with missing levels of packaging DI numbers',
    (SELECT COUNT(*) FROM products WHERE
        (NOT ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL) AND
        ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL)) OR
        (NOT ("Package Di Number Level1" <> '' AND "Package Di Number Level1" IS NOT NULL) AND
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL)) OR
        (NOT ("Package Di Number Level2" <> '' AND "Package Di Number Level2" IS NOT NULL) AND
        ("Package Di Number Level3" <> '' AND "Package Di Number Level3" IS NOT NULL)));
