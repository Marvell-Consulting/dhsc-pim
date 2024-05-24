SELECT
    'Products with UDI Numbers',
    (SELECT COUNT(*) FROM products WHERE "Udi Number" IS NOT NULL AND "Udi Number" <> '');
SELECT
    'Products with GTINs',
    (SELECT COUNT(*) FROM products WHERE "Udi Entity ID" = 1);
SELECT
    'Products with no Brand name',
    (SELECT COUNT(*) FROM products WHERE "Brand Trade Name" = '' OR "Brand Trade Name" IS NULL);
SELECT
    'Product listed as model with no model name',
    (SELECT COUNT(*) FROM products WHERE "Is Model" = '1' AND ("MODEL" = '' OR "MODEL" IS NULL));
SELECT
    'Products with no Product Code',
    (SELECT COUNT(*) FROM products WHERE "Product Code" = '' OR "Product Code" IS NULL);
SELECT
    'Products with URLs',
    (SELECT COUNT(*) FROM products WHERE "Url Additional" <> '' AND "Url Additional" IS NOT NULL);

SELECT
    'Products provided as sterile',
    (SELECT COUNT(*) FROM products WHERE "Is Sterile" = '1');
SELECT
    'Products with unknown sterility',
    (SELECT COUNT(*) FROM products WHERE "Is Sterile" <> '1' AND "Is Sterile" <> '0');
SELECT
    'Sterile products with no method',
    (SELECT COUNT(*) FROM products WHERE "Is Sterile" = '1'
        AND ("Other Sterilisation" = '' OR "Other Sterilisation" IS NULL)
        AND ("Method Sterilisation" = '' OR "Method Sterilisation" IS NULL));
SELECT
    'Possible Product Statuses',
    (SELECT COUNT(DISTINCT "Product Status") FROM products);
SELECT
    'Products containing latex',
    (SELECT COUNT(*) FROM products WHERE "Is Containing Latex" = '1');
SELECT
    'Products with unknown latex',
    (SELECT COUNT(*) FROM products WHERE "Is Containing Latex" <> '1' AND "Is Containing Latex" <> '0');

SELECT
    'Products with critical warnings',
    (SELECT COUNT(*) FROM products WHERE "Is Critical Warning" = '1');
SELECT
    'Products with unknown critical warning',
    (SELECT COUNT(*) FROM products WHERE "Is Critical Warning" <> '1' AND "Is Critical Warning" <> '0');
