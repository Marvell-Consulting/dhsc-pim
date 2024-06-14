all: gmdn.sqlite

gmdnData.json gmdnCategory.json gmdnCategoryTermLink.json: newData/gmdnData24_6.xml newData/gmdn_category_en_20240601.xml newData/gmdn_categoryTermLink_en_20240601.xml parse.py
	python parse.py

gmdn.sqlite: schema.sql gmdnData.json gmdnCategory.json gmdnCategoryTermLink.json find-parents.sql
	rm gmdn.sqlite || true
	sqlite3 gmdn.sqlite < schema.sql
	mpjson-read < gmdnData.json | mpsqlite --mode=insert gmdn.sqlite gmdn_term > /dev/null
	mpjson-read < gmdnCategory.json | mpsqlite --mode=insert gmdn.sqlite gmdn_category > /dev/null
	mpjson-read < gmdnCategoryTermLink.json | mpsqlite --mode=insert gmdn.sqlite gmdn_category_term_link > /dev/null
	sqlite3 gmdn.sqlite < find-parents.sql

gmdn_tree.txt: gmdn.sqlite gmdn_tree.sql
	sqlite3 gmdn.sqlite < gmdn_tree.sql > gmdn_tree.txt
