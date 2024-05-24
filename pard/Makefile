.PHONY: all
all: pard.sqlite

pard.sqlite: ../schema.sql devices.json manufacturers.json
	cat $< insert_manufacturers.sql insert_devices.sql update_search.sql ../cleanse.sql | sqlite3 $@

JSON_FLAGS := -H 'Accept: application/json' -H 'Content-Type: application/json' -X POST

devices.json:
	curl https://pard.mhra.gov.uk/searchDevices ${JSON_FLAGS} -d '{"searchTerm": ""}' > $@

manufacturers.json:
	curl https://pard.mhra.gov.uk/searchManufacturers ${JSON_FLAGS} -d '{"searchTerm": ""}' > $@
