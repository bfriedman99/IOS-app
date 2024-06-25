//
//  SpaceDexApp.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import SwiftUI

@main
struct SpaceDexApp: App {
    @StateObject private var sightingList = SightingList()
    @StateObject private var achievementList = AchievementList()


    var body: some Scene {
        WindowGroup {
            ContentView(achievementList: AchievementList()).environmentObject(sightingList)
        }
    }
}
