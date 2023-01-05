import UIKit

//函数类型: 参数和返回值
func test() -> Void {
    print("test 函数")
}

//定义函数类型的变量
let a:()->Void = test
a();

func test1(param: Int) -> String {
    return String(param) + "测试"
}

let b:(_ param: Int) -> String = test1
let val = b(12)
print(val)

//函数类型作为参数
func test2(param:(Int)->Void) -> Void {
    param(12)
}
//调用
test2 { val in
    print(val)
}

//定义闭包变量
//有参数有返回值
let c = {(param1: String,param2: String) -> String in
    return param1 + param2
}
let val1 = c("hello", "word")
print(val1)

//有参数无返回值闭包
let d: (String) -> Void = { (param: String) in
    print(param)
}

//无参数有返回值
let e: () -> String = { () -> String in
    return "无参数有返回值"
}

//闭包定义完成直接()调用，变量不再是闭包类型，而是闭包的返回值类型
let titleLabel: UILabel = {
    let lab = UILabel()
    lab.text = "jason"
    return lab
}()

//闭包参数
func getJob(after:() -> Void) {
    print("大学毕业了")
    //闭包调用
    after()
    print("找到了工作")
}

let after = {
    print("开始编程学习")
}

func after1() -> Void {
    print("开始iOS课程学习")
}

//函数调用
getJob(after: after)
getJob(after: after1)








