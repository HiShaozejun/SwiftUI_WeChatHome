
import SwiftUI

/**
    ContentView遵循View的协议
 */
struct MyContentView: View {
    
    /**some View: 某种View视图，一种泛指*/
    var body: some View {
    
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            //声明式语法,修改UI控件的那些方法被称为修饰符modifier
            
            /**
              1.Text文字的对齐方式，只针对多行文本内容设置有效，
                multilineTextAlignment：设置对齐方式
                lineLimit： 设置文字行数
              2.SwiftUI中弱化了坐标点，默认视频居中，因为跨iOS平台性，坐标系参照点不同；
             
              3. 修饰符的链式调用的先后顺序，有时会出现不一样的情况，例如Text的background和frame
             */
            Text("我是一个Text，修改UI控件的那些方法被称为修饰符modifier").font(.title).fontWeight(.bold).foregroundColor(Color.blue).multilineTextAlignment(.leading).lineLimit(2).padding(10)
            
            Button("button") {
                print("我是一个button")
            }.font(.title).foregroundColor(.orange)
            
        }
        .padding(10.0)
    }
}

/**
    用来预览使用
 */
struct MyContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyContentView()
    }
}

