SQLITE_FILE ?= ../pard/pard.sqlite
ALL_QUALITY_CSVS := $(patsubst %.sql,%.csv,$(wildcard *.sql))

$(patsubst %.sqlite,%-quality.csv,${SQLITE_FILE}): ${ALL_QUALITY_CSVS}
	cat $^ > $@

%.csv: %.sql ${SQLITE_FILE}
	sqlite3 -readonly ${SQLITE_FILE} -csv <$< >$@

.PHONY: clean
clean:
	$(RM) ${ALL_QUALITY_CSVS}
