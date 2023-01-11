//
//  AstronautsView.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import SwiftUI

struct AstronautsView: View {
    
    let astronautsViewModel = AstronautsViewModel()
    
    let astronautsName: String
    
    var currentAstronauts: AstronautsModel? {
        astronautsViewModel.astronautsData.first { astronauts in
            return astronauts.name == astronautsName
        }
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack() {
                
                Image(astronautsName).resizable().scaledToFit()
                if let des  = currentAstronauts?.description {
                    Text(des)
                }
            }
        }.navigationTitle(astronautsName)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautsView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautsView(astronautsName: "杨利伟")
    }
}
