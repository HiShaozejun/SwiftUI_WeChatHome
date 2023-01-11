//
//  ShipDetailView.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import SwiftUI

struct ShipDetailView: View {
    
    let plan: PlanModel
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    Image(plan.imageName).resizable().scaledToFit()
                        .frame(width: proxy.size.width * 0.6)
                    
                    Divider().background(.white).padding(.top,10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("任务简介")
                                .font(.title.bold())
                                .padding([.bottom])
                            Spacer()
                        }
                        Text(plan.description).padding([.bottom])
                            .lineSpacing(4)
                        
                    }.padding()
                    
                    // 分割线
                    if (plan.members != nil){
                        Divider().background(.white).padding(.top,10)
                    }
                    
                    if let menmber = plan.members {
                        LazyVStack(alignment: .leading) {
                            Text("宇航员")
                                .font(.title.bold())
                            
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(menmber,id: \.name) { menmber in
                                        NavigationLink {
                                            AstronautsView(astronautsName: menmber.name)
                                        } label: {
                                            HStack {
                                                Image(menmber.name)
                                                    .resizable().scaledToFill()
                                                    .frame(width: 100,height: 80)
                                                    .clipShape(Capsule())
                                                    .overlay {
                                                        Capsule().stroke(.white)
                                                    }
                                                VStack(alignment: .leading) {
                                                    Text(menmber.name).font(.title.bold())
                                                    Text(menmber.birth).font(.title3).foregroundColor(.secondary)
                                                }
                                            }
                                        }

                                    }
                                }
                            }
                        }.padding()
                    }
                }
            }
        }
    }
}

struct ShipDetailView_Previews: PreviewProvider {
    static let plan = PlanViewModel().plans[5]
    static var previews: some View {
        ShipDetailView(plan: plan).preferredColorScheme(.dark)
    }
}
