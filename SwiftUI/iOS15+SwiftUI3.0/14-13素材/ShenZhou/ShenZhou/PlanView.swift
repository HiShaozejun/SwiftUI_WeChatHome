//
//  PlanView.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/22.
//

import SwiftUI

struct PlanView: View {
    let plan: Plan
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVStack {
                    //1.徽章图片
                    Image(plan.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.6)
                        .padding(.top)
                    
                    //2.任务简介
                    VStack(alignment: .leading) {
                        
                        SZDivider()
                        
                        Text("任务简介")
                            .boldTitleWithPadding()
                        Text(plan.description)
                        
                        SZDivider()
                        if plan.members != nil {
                            Text("宇航员")
                                .boldTitleWithPadding()
                        }
                    }
                    .padding(.horizontal)
                    
                    //3.参与此次任务的宇航员
                    if let members = plan.members {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(members, id: \.name) { member in
                                    NavigationLink {
                                        AstronautView(name: member.name)
                                    } label: {
                                        HStack {
                                            Image(member.name)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 104, height: 72)
                                                .clipShape(Capsule())
                                                .overlay(
                                                    Capsule()
                                                        .strokeBorder(.white)
                                                )
                                            
                                            VStack(alignment: .leading) {
                                                Text(member.name)
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                                Text(member.birth)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(plan.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(kDarkBGColor)
    }
}

struct PlanView_Previews: PreviewProvider {
    static let plan = PlanVM().plans[12]
    static var previews: some View {
        PlanView(plan: plan).preferredColorScheme(.dark)
    }
}
