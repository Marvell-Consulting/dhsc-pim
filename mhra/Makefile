# Administrative things

basedata=DeviceRegistration_Devices_20240330.txt DeviceRegistration_Organisation_20240330.txt DeviceProductQuery2024-05-07.txt

.PHONY: all
all: mhra.sqlite rename_products normalise_status fix_nulls

clean:
	rm mhra.sqlite

mhra.tar.gz: Makefile $(basedata) schema.sql import-gmdn.sql import-gudid.sql materialise-gudid-join.sql read-products-2.sh mhra.sqlite
	rm mhra.tar.gz || true
	tar -zcf mhra.tar.gz $^

funny-product-records.sexpr: DeviceProductQuery2024-05-07.txt read-products-2.sh
	./read-products-2.sh | mpcsv-read -T -s | mpfilter '(lambda (x) (not (= (length x) 40)))' > funny-product-records.sexpr

.PHONY: all clean

# Building the sqlite DB

deepclean: clean
	rm mhra.sqlite

## Install chicken-scheme then run "chicken-install magic-pipes" to get the mp* tools

mhra.sqlite: read-products-2.sh schema.sql $(basedata)
	rm mhra.sqlite || true
	sqlite3 mhra.sqlite < schema.sql
	./read-products-2.sh | mpcsv-read -T | mpfilter '(lambda (x) (= (length x) 40))' | mptable2alist -H | mpsqlite --mode=insert mhra.sqlite products > /dev/null
	cat DeviceRegistration_Organisation_20240330.txt | sed 's_"MEDICARE-Trade" _\\"MEDICARE-Trade\\" _' | sed 's_"The Works" Preston House_\\"The Works\\" Preston House_' | sed 's_"Viktoria Mews 27 _\\"Viktoria Mews 27 _' | mpcsv-read -T | mptable2alist -H | mpsqlite --mode=insert mhra.sqlite organisations > /dev/null
	mpcsv-read -T < DeviceRegistration_Devices_20240330.txt  | mptable2alist -H | mpsqlite --mode=insert mhra.sqlite devices > /dev/null

# Data cleanup

.PHONY: rename_products
rename_products:
	cat rename_product_fields.sql | sqlite3 mhra.sqlite

.PHONY: normalise_status
normalise_status:
	sqlite3 mhra.sqlite <normalise_product_status.sql

.PHONY: fix_nulls
fix_nulls:
	sqlite3 mhra.sqlite <fix_nulls.sql
