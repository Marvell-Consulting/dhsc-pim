.PHONY: all
all: rename_products normalise_status fix_nulls

.PHONY: rename_products
rename_products:
	cat rename_product_fields.sql | sqlite3 mhra.sqlite

.PHONY: normalise_status
normalise_status:
	sqlite3 mhra.sqlite <normalise_product_status.sql

.PHONY: fix_nulls
fix_nulls:
	sqlite3 mhra.sqlite <fix_nulls.sql
