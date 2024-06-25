//
//  FavoritesView.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/30/21.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var sightingList: SightingList
    //@EnvironmentObject var favoriteCount: EnvironmentInt
    @State private var newSighting = Sighting()
    @State private var addSighting = false
    
    var body: some View {
        VStack{
            if sightingList.list.count == 0 {
                Text("No favorites! Favorite a sighting to see it here.")
            }
            else {
                List(0..<sightingList.list.count, id: \.self) { i in
                    let sighting = sightingList.list[i]
                    if sighting.favorite == true {
                        HStack{
                            Text("\(sighting.name)" as String).frame(minWidth:100, alignment: .leading).scaledToFill().background(Color.white)
                            sighting.picture.resizable().frame(width: 75, height: 75).padding()
                            Text("\(sighting.displayDate)" as String).frame(minWidth:100, alignment: .leading).scaledToFill().background(Color.white).padding()
                        }
                    }
                }
            }
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
