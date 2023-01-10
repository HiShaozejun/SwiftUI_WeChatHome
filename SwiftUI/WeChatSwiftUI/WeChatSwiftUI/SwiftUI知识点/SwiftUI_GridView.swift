//
//  SwiftUI_GridView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/10.

/**
    网格布局 GridView,默认是不可以滚动，需要包裹scrollview
 */

import SwiftUI


/**
    自适应网格布局
 */
struct SwiftUI_GridView: View {
    
    /**
        根据屏幕的宽度动态展示几列或者几行
     */
//    let item = [GridItem(.adaptive(minimum: 60))]
    
    /**
     adaptive： 先分配固定宽度，剩余的宽度系统平均分配
     flexible和adaptive的混合搭配使用
     */
    
    let item = [GridItem(.adaptive(minimum: 60)),GridItem(.flexible(minimum: 60))]
    
    var body: some View {
            
        LazyVGrid(columns: item) {
            ForEach(0..<50) { index in
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                    .frame(height: 40)
                    .overlay {
                        Text("\(index)").foregroundColor(.white).fontWeight(.bold).font(.title)
                    }
            }
        }
    }
}

/**
    水平网格布局
 */
struct HGridView : View {
    
    /**
     fixed: 高度
     */
    let rows = [
                GridItem(.fixed(40),spacing: 20),
                GridItem(.fixed(40), spacing: 20),
                GridItem(.fixed(40), spacing: 20)
                ]
    
    
    var body: some View {
        
        ScrollView(.horizontal) {
            
            LazyHGrid(rows: rows) {
                
                ForEach(0..<3) { idx in
                    
                    Section {
                        ForEach(0..<8) { row in
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(hue: 0.03 * Double(row), saturation: 1, brightness: 1))
                                .frame(width: 100)
                                .overlay {
                                    Text("\(row)").foregroundColor(.white).fontWeight(.bold).font(.title)
                                }
                            
                        }
                    } header: {
                        Text("header\(idx + 1)").font(.title).fontWeight(.bold)
                    } footer: {
                        Text("fotter\(idx + 1)").font(.title).fontWeight(.bold)
                    }

                }
                
            }
        }
    }
}

/**
    垂直网格布局
 */
struct VGridView: View {
    
    // 垂直方向滚动，集合有几个就有几列
    /**
     fixed: 方格的宽度
     space: 相邻间距
     flexiblea: 弹性布局,可设置最小和最大宽度
     */
    let items = [
                GridItem(.flexible(minimum: 200)),
                GridItem(.fixed(90), spacing: 20),
                GridItem(.fixed(70), spacing: 50)
                ]
    
    var body: some View {
        
        ScrollView() {
            //垂直方向网格视图
            /**
              pinnedViews: 是否悬停
             */
            LazyVGrid(columns: items,alignment: .center,pinnedViews: [.sectionHeaders,.sectionFooters]) {
                
                ForEach(0..<4) { sectionIndex in
                 
                    Section {
                        
                        ForEach(0..<10) { index in
                         
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness:1))
                                  .frame(height: 80)
                                  .overlay {
                                      Text("\(index)").foregroundColor(.white).font(.title)
                                  }
                        }
                        
                    } header: {
                        
                        Text("Header\(sectionIndex + 1)")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment:.center)
                    } footer: {
                        Text("Fotter\(sectionIndex + 1)")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment:.center).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    }
                }
            }
        }
    }
}


struct SwiftUI_GridView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_GridView()
    }
}
