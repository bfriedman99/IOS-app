//
//  ContentView.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sightingList: SightingList
    @State var achievementList: AchievementList
    @State private var aSelected = false
    @State private var selectedAchievement: Achievement?
    @State private var newSighting = Sighting()
    @State private var addSighting = false
    @State private var sortingDirection = true;
    @State private var imgs = ["heart", "heart.fill"]
    @State private var dummy = 0
    @State private var dummys = ["", " "]
    @State private var selected = false
    @State private var selectedSighting: Sighting?
    
    var body: some View {
        TabView {
            ZStack {
                VStack{
                    if sightingList.list.count == 0 {
                        Text("No entries! Please add a new sighting in the \"New Entry\" tab below!").padding().frame(width: 320, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                }.padding()
                                Text("\(dummys[dummy])")
                            }.onTapGesture() {
                                selected = true
                                selectedSighting = sighting
                            }
                        }
                    }
                }
                if selected {
                    Rectangle().foregroundColor(.white).opacity(1)
                    VStack {
                        Text("Stellar Object:   \(selectedSighting!.name)").padding()
                        Text("Information:   \(selectedSighting!.info)").padding()
                        Text("Location Seen:   \(selectedSighting!.location)").padding()
                        selectedSighting?.picture.resizable().frame(width: 300, height: 300).padding()
                        Button("Close", action: {selected = false; selectedSighting = nil}).padding()
                    }
                    
                }
            }.tabItem { Label("Sightings", systemImage: "aqi.low") }
            NewSightingView()
                .environmentObject(sightingList)
                .tabItem { Label("New Entry", systemImage: "plus") }
            VStack {
                if sightingList.list.count == 0 {
                    Text("No favorites! Favorite a sighting to see it here.")
                }
                else {
                    ForEach(0..<sightingList.list.count) { i in
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
            }.tabItem { Label("Favorites", systemImage: "heart.fill") }
            ZStack {
                VStack {
                    List(0..<achievementList.list.count, id: \.self) { i in
                        let achievement = achievementList.list[i]
                        if achievementList.checkAchievements(sightingList) {
                            
                        }
                        HStack {
                            Text("\(achievement.name)")
                            if achievement.achieved {
                                Image(systemName: "star.fill")
                            }
                            else {
                                Image(systemName: "star")
                            }
                        }.onTapGesture() {
                            aSelected = true
                            selectedAchievement = achievement
                        }
                    }
                    if aSelected {
                        Rectangle().foregroundColor(.white).opacity(1)
                        VStack {
                            Text(" \(selectedAchievement!.name)").padding()
                            Text("\(selectedAchievement!.desc)").padding()
                            Button("Close", action: {aSelected = false; selectedAchievement = nil}).padding()
                        }
                        
                    }
                }
            }.tabItem { Label("Achievements", systemImage: "star.fill") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(achievementList: AchievementList()).environmentObject(SightingList())
    }
}
