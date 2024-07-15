new-mhra.sqlite: Makefile schema.sql DVC_DEVICE_PRODUCT_MAPPING.sql DVC_DEVICE_PRODUCT.sql DVC_DEVICE.sql DVC_ORGANISATION.sql DVC_REF_UDI_ENTITY.sql
	rm new-mhra.sqlite || true
	sqlite3 new-mhra.sqlite < schema.sql
	sh convert.sh DVC_DEVICE_PRODUCT_MAPPING DVC_DEVICE_PRODUCT_MAPPING.sql | sqlite3 new-mhra.sqlite
	sh convert.sh DVC_DEVICE_PRODUCT DVC_DEVICE_PRODUCT.sql | sqlite3 new-mhra.sqlite
	sh convert.sh --hex DVC_DEVICE DVC_DEVICE.sql | sqlite3 new-mhra.sqlite
	sh convert.sh DVC_ORGANISATION DVC_ORGANISATION.sql | sqlite3 new-mhra.sqlite
	sh convert.sh DVC_REF_UDI_ENTITY DVC_REF_UDI_ENTITY.sql | sqlite3 new-mhra.sqlite
	sqlite3 new-mhra.sqlite < dedupe-products.sql
	sqlite3 new-mhra.sqlite < indexes.sql

