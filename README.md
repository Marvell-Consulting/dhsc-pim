# DHSC-PIM

This repository contains alpha-phase exploration of data and prototypes for the DHSC PIM (Product Information Management) project.

## Data import scripts

The gmdn, gudid, mhra, and pard directories contain scripts to import data from these sources into sqlite databases.

The gmdn, gudid, and mhra importers use [Magic
Pipes](https://www.kitten-technologies.co.uk/project/magic-pipes) to parse
delimited files and process data into sqlite. To get Magic Pipes, install [Chicken Scheme 5](http://call-cc.org/) onto your system and then run:

```
chicken-install magic-pipes
```

All the importers use makefiles, so you can generate the data by running `make`
in the appropriate directory.

### Merging the databases

The merged-data directory contains a Makefile to merge the GMDN, MHRA and GUDID data into a single .sqlite database.

The mhra, gmdn and gudid importers must have been run before you run `make` in the merged-data directory.

### Source data

Note that the gmdn, gudid, and mhra importers require a copy of the data to be obtained - which is not included in this repository. The pard importer pulls data from a public API.

## Prototypes

The various versions of the prototype can be found in the prototypes directory which contains a [README](./prototypes/README.md) explaining how to build, install and configure the prototypes.
