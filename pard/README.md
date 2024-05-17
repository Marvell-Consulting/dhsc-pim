# PARD data tools

PARD is the Public Access Registration Database found at
https://pard.mhra.gov.uk/.

It represents a publicly sharable cut of the MHRA's database of device
registrations.

The tools in this directory facilitate retrieving all of the data from PARD and
building it into an SQLite database that is compatible with the other tools in
this repository. This is so that public users of the repository can still try
out the other tools and prototypes without access to non-public data from MHRA.

## Building the data

Just run:

```
make -j all
```

to download PARD device and manufacturer data and import into `pard.sqlite`. The
resulting database will have the same schema as `../schema.sql` but with a
number of columns or rows missing, representing the private data not available
in PARD.
