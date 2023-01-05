import UIKit

//既然函数也是一种类型,那自然就能和之前的Int,String一样可以作为另外一个函数的参数

//一般类型作为函数的参数
let para = "Lebus"
func xx(para: String) -> String {
    //使用para参数做一些处理等...
    return ""
}
xx(para: para)
xx(para: "Lebus")


//闭包作为函数的参数
//作为参数时,也是和其他类型一样,形式参数这边写类型(泛指这一类无参数无返回值的函数)
//实际调用这个外层函数的时候传具体的数据(闭包)进去
func getJob(after: () -> ()) {
    print("大学毕业了")
    after()
    print("找到满意的工作了")
}

let staticTodo = {
    print("跟Lebus学iOS开发")
}
//在调用外层函数,需要放入实参时,自然也是和其他类型的数据一样,可以传存这个数据的变量进去
getJob(after: staticTodo) //做为别的函数参数的闭包(staticTodo)被称作回调函数callback
//也可直接传入具体的数据(闭包)
getJob(after: {
    print("跟Lebus学iOS开发")
})


//还可以这样传.
//既然闭包是函数,那自然也可以这样来做
//定义一个和存闭包的变量一样的函数名,并且参数个数类型和返回值个数类型都一样,此时提示重复声明,说明其实是一个东西
//所以表面上看闭包是一个没有名字的函数,但其实是有名字的,就是赋给的那个变量的名字
func staticTodoFunc() {
    print("跟Lebus学iOS开发")
}
getJob(after: staticTodoFunc)


//复杂闭包作为函数参数的情况
//重载overload--可以根据参数类型和个数,返回值类型和个数的不同区分函数,故只要其中一个不一样,就可以定义为同名函数
func getJob(after: (String, String) -> String) {
    print("大学毕业了")
    after("Lebus", "iOS")
    print("找到满意的工作了")
}
let dynamicTodo = { (who: String, course: String) -> String in
    "跟\(who)学\(course)"
}
getJob(after: dynamicTodo)
//当然也可以和上面一样传闭包或函数名进去,此处演示传闭包本体进去的情况
getJob(after: { (who: String, course: String) -> String in
    "跟\(who)学\(course)"
})



//函数式编程
//简单的理解:函数可以和其他类型一样被赋给某个变量,作为函数的参数或者返回值.
//这是一种编程范式,简单的说也就是编程风格/习惯,我们之前讲过的oop也是一种编程范式,在UIKit中大量使用(大量使用class对象),而SwiftUI将主要使用函数式编程这样一种编程规范(大量使用函数)
