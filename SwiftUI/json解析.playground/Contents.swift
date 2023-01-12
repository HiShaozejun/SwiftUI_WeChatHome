import UIKit

/**
    解决 Immutable property will not be decoded because it is declared with an initial value which cannot be overwritten 警告
    原因：
    遵守 Codable协议的Person，每次解码的时候，是无法覆盖当前的id值，它还是初始的值，需要使用var修饰
 */
struct Person: Codable {
    let value: Int = 1
}

let json = """
{"value":"2"}
"""

let decoder = JSONDecoder()
let model = try! decoder.decode(Person.self, from: json.data(using: .utf8)!)
print(model)

//结果还是1 需要将value修饰符改为 var定义

