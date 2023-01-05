//
//  ContentView.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/18.
//

import SwiftUI

struct ContentView: View {
    let planVM = PlanVM()
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(planVM.plans) { plan in
                        NavigationLink {
                            PlanView(plan: plan)
                        } label: {
                            VStack {
                                Image(plan.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(plan.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(plan.launchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(kLightBGColor)
                            }
                            //和stroke区别,stroke是沿着视图的边里外都描,border是沿边往里描--见文档
                            //目前版本,想搞出圆角边框用border和cornerRadius不行,需用以下方法
                            //.border(kLightBGColor, width: 10)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(kLightBGColor)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("神舟飞船")
            .background(kDarkBGColor)
        }
        .navigationViewStyle(.stack)
        //手动改深浅色模式,会应用于所有子视图(自然是不包含present出来的页面)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
