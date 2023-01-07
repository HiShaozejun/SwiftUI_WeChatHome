//
//  SwiftUI_Alert.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/7.
/**
    Alert知识点学习
 */

import SwiftUI

struct SwiftUI_Alert: View {
    
    @State private var isShowAlert = false
    @State private var isShowAlert2 = false
    var body: some View {
        
        VStack {
            
            Button {
                isShowAlert = !isShowAlert
            } label: {
                Text("Alert演示1")
            }.alert(isPresented: $isShowAlert) {
                
                Alert(
                       title: Text("Current Location Not Available"),
                       message: Text("Your current location can’t be " +
                                       "determined at this time.")
                )
                
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 10))
            
            
            Button {
                isShowAlert2 = !isShowAlert2
            } label: {
                Text("Alert演示2")
            }.alert(isPresented: $isShowAlert2) {
                
                Alert(
                    title: Text("Unable to Save Workout Data"),
                    message: Text("The connection to the server was lost."),
                    primaryButton: .default(
                        Text("Try Again"),
                        action: {
                            
                        }
                    ),
                    secondaryButton: .destructive(
                        Text("Delete"),
                        action: {
                            
                        }
                    )
                )
            }
        }
    }
}

struct SwiftUI_Alert_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Alert()
    }
}
