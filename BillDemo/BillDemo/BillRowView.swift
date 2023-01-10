//
//  BillRowView.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.
//

import SwiftUI

struct BillRowView: View {
    var billName: String
    var billType: String
    var billMoney: String
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Text(billName)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                Text(billType)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack {
                Text(billMoney)
                    .foregroundColor(.primary)
                    .font(.system(size: 17))
            }
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}
