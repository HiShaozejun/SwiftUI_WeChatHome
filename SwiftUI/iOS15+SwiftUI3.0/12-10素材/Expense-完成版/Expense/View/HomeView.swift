//
//  HomeView.swift
//  Expense
//
//  Created by Lebus on 2022/5/5.
//

import SwiftUI

struct HomeView: View {
    @State private var flag = true
    var body: some View {
        VStack {
            ContentView()
            Button(flag ? "刷新" : "再次刷新") {
                flag.toggle()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
