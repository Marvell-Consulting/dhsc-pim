merged.sqlite: ../mhra/mhra.sqlite ../gmdn/gmdn.sqlite ../gudid/gudid.sqlite import-mhra.sql import-gmdn.sql import-gudid.sql materialise-gudid-join.sql
	rm merged.sqlite || true
	sqlite3 merged.sqlite < import-mhra.sql
	sqlite3 merged.sqlite < import-gmdn.sql
	sqlite3 merged.sqlite < import-gudid.sql
	sqlite3 merged.sqlite < materialise-gudid-join.sql
