import xml.sax
import xml.sax.handler
import json

class MyHandler(xml.sax.handler.ContentHandler):
    def __init__(self):
        self._buffer = []
        self._record = {}

    def startElement(self, name, attrs):
        self._buffer = []
        if name == "term":
            self._record = {}

    def endElement(self, name):
        if name == "term":
            print(json.dumps(self._record))
        else:
            self._record[name] = ''.join(self._buffer)

    def characters(self, data):
        self._buffer.append(data)
    

handler = MyHandler()

xml.sax.parse("gmdnData24_4.xml", handler)

