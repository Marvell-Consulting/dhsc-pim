#!/bin/sh

# Convert from UTF16 to UTF8

# Remove title and trailing blank line

# The file uses CRLF as a line separator, but has some bare LFs inside field values, so tidy up by removing all LFs and converting the remaining CRs to LFs

# Then replace some values found inside fields with unquoted |s

iconv < DeviceProductQuery2024-05-07.txt -f UTF16LE -t UTF8 | \
    tail -n +3 | \
    tr -d '\n' | \
    tr '\r' '\n'
