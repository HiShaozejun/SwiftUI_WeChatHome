import UIKit

struct Model: Decodable {
    var value: String = "1"
}

let json = """
{"value": "2"}
"""

let decoder = JSONDecoder()
let model = try! decoder.decode(Model.self, from: json.data(using: .utf8)!)
print(model)
