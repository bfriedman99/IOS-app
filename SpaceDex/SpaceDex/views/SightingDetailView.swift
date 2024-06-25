//
//  SightingDetailView.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import SwiftUI

struct SightingDetailView: View {
    @EnvironmentObject private var sightingList: SightingList
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            Image("testudo").scaledToFit()
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

struct SightingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SightingDetailView()
    }
}
