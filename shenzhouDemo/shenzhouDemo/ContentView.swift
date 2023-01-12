//
//  ContentView.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import SwiftUI

struct ContentView: View {

    let viewmodel = PlanViewModel()

    let coulums = [GridItem(.adaptive(minimum: 150),spacing: 10),GridItem(.adaptive(minimum: 150))]

    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false){
                
                    LazyVGrid(columns: coulums,spacing: 20) {
                        
                        ForEach(viewmodel.plans) { plan in
                            
                        NavigationLink {
                            ShipDetailView(plan: plan)
                        } label: {
                            VStack() {
                                
                                Image(plan.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(plan.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(plan.launchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.gray)
                            }
                            
                            //自定义修饰符
//                            .modifier(CustomerModifiers(cornerRadius: 10, lineWidth: 2, color: .gray))
                            //修饰符进一步优化
                            .customerModifiers(cornerRadius: 10, lineWidth: 2, color: .gray)

                            // 添加边框
//                            .cornerRadius(10)
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.gray,lineWidth: 1)
//                            }
                            
                            
                        }
                    }
                }
            }
            .navigationTitle("神州飞船")
            .navigationBarTitleDisplayMode(.inline)
            .background(KBgColor)
            //指定系统的颜色模式
            .preferredColorScheme(.dark)
            .padding()
            
        }
//        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
