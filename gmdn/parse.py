import xml.sax
import xml.sax.handler
import json

fp = open("gmdnData.json", "w")

class DataHandler(xml.sax.handler.ContentHandler):
    def __init__(self):
        self._buffer = []
        self._record = {}

    def startElement(self, name, attrs):
        self._buffer = []
        if name == "term":
            self._record = {}

    def endElement(self, name):
        if name == "term":
            fp.write(json.dumps(self._record))
            fp.write("\n")
        else:
            self._record[name] = ''.join(self._buffer)

    def characters(self, data):
        self._buffer.append(data)

xml.sax.parse("gmdnData24_6.xml", DataHandler())

fp.close()

fp = open("gmdnCategory.json", "w")

class CategoryHandler(xml.sax.handler.ContentHandler):
    def __init__(self):
        self._buffer = []
        self._record = {}

    def startElement(self, name, attrs):
        self._buffer = []
        if name == "category":
            self._record = {}

    def endElement(self, name):
        if name == "category":
            fp.write(json.dumps(self._record))
            fp.write("\n")
        else:
            self._record[name] = ''.join(self._buffer)

    def characters(self, data):
        self._buffer.append(data)

xml.sax.parse("gmdn_category_en_20240601.xml", CategoryHandler())

fp.close()


fp = open("gmdnCategoryTermLink.json", "w")

class CategoryTermLinkHandler(xml.sax.handler.ContentHandler):
    def __init__(self):
        self._buffer = []
        self._record = {}

    def startElement(self, name, attrs):
        self._buffer = []
        if name == "categoryTermLink":
            self._record = {}

    def endElement(self, name):
        if name == "categoryTermLink":
            fp.write(json.dumps(self._record))
            fp.write("\n")
        else:
            self._record[name] = ''.join(self._buffer)

    def characters(self, data):
        self._buffer.append(data)

xml.sax.parse("gmdn_categoryTermLink_en_20240601.xml", CategoryTermLinkHandler())

fp.close()
