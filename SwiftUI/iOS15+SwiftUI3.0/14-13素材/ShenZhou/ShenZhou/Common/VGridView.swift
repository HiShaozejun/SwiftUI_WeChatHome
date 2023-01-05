//
//  VGridView.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/18.
//

import SwiftUI

struct VGridView: View {
    var body: some View {
        //垂直方向的网格视图:
        //columns参数的GridItem配置列宽(网格的宽度),列间距,里面内容对齐方式等;
        //LazyVGrid其余参数配置行间距,网格对齐方式,页眉页脚是否固定等
        
//        let columns = Array(repeating: GridItem(.fixed(100)), count: 3)

        // MARK: - 简单的GridView
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(0..<50) { index in
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
//                        .frame(height: 50)
//                        .overlay(Text("\(index)"))
//                }
//            }
//        }
        
        // MARK: - 带header和footer的多段GridView
//        ScrollView {
//            LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders, .sectionFooters]) {
//                ForEach(0..<5){ index in
//                    Section {
//                        ForEach(0..<10){ idx in
//                            RoundedRectangle(cornerRadius: 5)
//                                .foregroundColor(Color(hue: 0.03 * Double(index * 10 + idx), saturation: 1, brightness: 1))
//                                .frame(height: 50)
//                                .overlay(Text("\(index * 10 + idx)"))
//                        }
//                    } header: {
//                        Text("Header \(index + 1)")
//                            .bold()
//                            .font(.title)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    } footer: {
//                        Text("Footer \(index + 1)")
//                            .bold()
//                            .font(.title)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.bottom)
//                    }
//
//                }
//            }
//            .padding()
//        }
        
        
        // MARK: - 弹性网格
        //1.默认使用最大可用空间,2.会和其他flexible的格子等均分割剩余的空间
//        let flexibleColumns =
//        [
//            GridItem(.flexible(minimum: 200)),
//            GridItem(.flexible()),
//            GridItem(.fixed(100))
//        ]
//
//        ScrollView {
//            LazyVGrid(columns: flexibleColumns, spacing: 20) {
//                ForEach(0..<50) { index in
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
//                        .frame(height: 50)
//                        .overlay(Text("\(index)"))
//                }
//            }
//        }
        
        
        // MARK: - 自适应网格
        //根据最小值把可用区域平分成若干个满足最小值的格子。
        //可以理解adaptive是一个大的flexible格子，获得空间后再把这个大格子平分成若干个满足设置定值的小格子
//        let adaptiveColumns =
//        [
//            GridItem(.adaptive(minimum: 50)),
//            GridItem(.fixed(100))
//        ]
//        此时需注意GridItem的顺序
//        let adaptiveColumns =
//        [
//            GridItem(.adaptive(minimum: 50)),
//            GridItem(.flexible())
//        ]
//        let adaptiveColumns =
//        [
//            GridItem(.adaptive(minimum: 50)),
//            GridItem(.adaptive(minimum: 90))
//        ]
        let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                ForEach(0..<50) { index in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                        .frame(height: 150)
                        .overlay(Text("\(index)"))
                }
            }
        }

    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        VGridView()
    }
}




