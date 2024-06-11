all: gmdn.sqlite

gmdnData24_4.json: gmdnData24_4.xml
	python parse.py > gmdnData24_4.json

gmdn.sqlite: schema.sql gmdnData24_4.json
	rm gmdn.sqlite || true
	sqlite3 gmdn.sqlite < schema.sql
	mpjson-read < gmdnData24_4.json | mpsqlite --mode=insert gmdn.sqlite gmdn_term > /dev/null
