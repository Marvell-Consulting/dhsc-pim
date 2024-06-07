gudid.sqlite: schema.sql device.txt identifiers.txt contacts.txt gmdnTerms.txt productCodes.txt sterilizationMethodTypes.txt environmentalConditions.txt deviceSizes.txt premarketSubmissions.txt
	rm gudid.sqlite || true
	sqlite3 gudid.sqlite < schema.sql
	mpcsv-read -D '|' < gmdnTerms.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite gmdnTerms > /dev/null
	mpcsv-read -c -D '|' < device.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite device > /dev/null
	mpcsv-read -D '|' < productCodes.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite productCodes > /dev/null
	mpcsv-read -D '|' < identifiers.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite identifiers > /dev/null
	mpcsv-read -D '|' < sterilizationMethodTypes.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite sterilizationMethodTypes > /dev/null
	mpcsv-read -D '|' < environmentalConditions.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite environmentalConditions > /dev/null
	mpcsv-read -D '|' < contacts.txt | mptable2alist -H | mpsqlite --mode=insert gudid.sqlite contacts > /dev/null

# These two files haven't been required yet, so we are not yet importing them. If they are required, add appropriate table definitions to schema.sql and then add mpcsv-read | ... lines importing the files:
# deviceSizes
# premarketSubmissions


