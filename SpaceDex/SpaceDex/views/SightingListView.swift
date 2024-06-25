//
//  SightingListView.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import SwiftUI

struct SightingListView: View {
    @EnvironmentObject var sightingList: SightingList
    @EnvironmentObject var favoriteCount: EnvironmentInt
    @State private var newSighting = Sighting()
    @State private var addSighting = false
    @State private var sortingDirection = true;
    @State private var imgs = ["heart", "heart.fill"]
    @State private var dummy = 0
    @State private var dummys = ["", " "]
    
    var body: some View {
        VStack{
            if sightingList.list.count == 0 {
                Text("No entries! Please add a new sighting!")
            }
            else {
                HStack{
                    Button(action: {sightingList.sortByParameter(sortingParam: "date", sortingDirection: sortingDirection)
                        sortingDirection = !sortingDirection
                    }, label: {
                        Text("Date")
                    }).padding()
                    Button(action: {sightingList.sortByParameter(sortingParam: "name", sortingDirection: sortingDirection)
                        sortingDirection = !sortingDirection
                    }, label: {
                        Text("Name")
                    }).padding()
                }
                List(0..<sightingList.list.count, id: \.self) { i in
                    let sighting = sightingList.list[i]
                    HStack {
                        Text("\(sighting.name)" as String).frame(minWidth:75, alignment: .leading).scaledToFill().background(Color.white)
                        sighting.picture.resizable().frame(width: 75, height: 75).padding()
                        Text("\(sighting.displayDate)" as String).frame(minWidth:75, alignment: .leading).scaledToFill().background(Color.white).padding()
                        Image(systemName: imgs[sighting.img]).onTapGesture {
                            sighting.img = (sighting.img + 1) % 2
                            sighting.favorite = !sighting.favorite
                            dummy = (dummy + 1) % 2
                            //favoriteCount.value += 1
                        }.padding()
                        Text("\(dummys[dummy])")
                    }
                }
            }
        }
    }
}

struct SightingListView_Previews: PreviewProvider {
    static var previews: some View {
        SightingListView().environmentObject(SightingList())
    }
}
