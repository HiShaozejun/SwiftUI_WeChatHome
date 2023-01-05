import UIKit

func getJob(para1: Int, para2: String, after: (String, String) -> String) {
    print("大学毕业了")
    after("Lebus", "iOS")
    print("找到满意的工作了")
}

getJob(para1: 1, para2: "Lebus", after: { (who: String, course: String) -> String in
    "跟\(who)学\(course)"
})

//尾随闭包语法--trailing closure syntax
getJob(para1: 1, para2: "Lebus") { who, course in
    "跟\(who)学\(course)"
}


//简单的尾随闭包
func getJob(after: () -> ()) {
    print("大学毕业了")
    after()
    print("找到满意的工作了")
}
getJob {
    print("跟Lebus学iOS开发")
}


//两个闭包参数
//https://docs.swift.org/swift-book/LanguageGuide/Closures.html
//func loadPicture(from server: Server, completion: (Picture) -> (), onFailure: () -> ()) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
//
//loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture.")
//}


