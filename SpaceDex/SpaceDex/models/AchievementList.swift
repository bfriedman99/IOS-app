//
//  AchievementList.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 4/15/21.
//

import Foundation
import SwiftUI
import CoreFoundation

class AchievementList: ObservableObject {
    @Published var list: [Achievement]

    init() {
        list = [Achievement(name: "The Cosmos", achieved: false, desc: "Enter one sighting"), Achievement(name: "Praise the Sun!", achieved: false, desc: "Find the Sun"), Achievement(name: "And You Take the Moon!", achieved: false, desc: "Find the Moon"), Achievement(name: "Allow Me to Show You the Universe...", achieved: false, desc: "Find the Sun, the Moon, and all the planets in our solar system"), Achievement(name: "A Galaxy Far, Far Away", achieved: false, desc: "Find the Andromeda Galaxy"), Achievement(name: "Io You One", achieved: false, desc: "Find Io"), Achievement(name: "Reality Is Often Dissapointing", achieved: false, desc: "Find Titan"), Achievement(name: "This. Is. SPARTA!!!", achieved: false, desc: "Enter 300 sightings"), Achievement(name: "What a Piece of Junk!", achieved: false, desc: "Enter 1000 sightings")]
    }
    
    func addAchievement(_ achievement: Achievement) {
        var alreadyInList = false
        if list.count > 0 {
            print("in if statement")
            for i in 0..<list.count {
                print("in for loop")
                print(list[i].name.caseInsensitiveCompare(achievement.name).rawValue)
                if list[i].name.caseInsensitiveCompare(achievement.name).rawValue == 0 {
                    print("already in list")
                    alreadyInList = true
                }
            }
        }
        if !alreadyInList {
            list.append(achievement)
        }
    }
    
    func checkAchievements(_ sightingList: SightingList) -> Bool{
        if sightingList.list.count > 0 { //the cosmos
            for i in 0..<list.count {
                if list[i].name == "The Cosmos" {
                    list[i].achieved = true
                }
            }
            if sightingList.list.count > 299 {
                for i in 0..<list.count {
                    if list[i].name == "This. Is. SPARTA!!!" {
                        list[i].achieved = true
                    }
                }
            }
            if sightingList.list.count > 999 {
                for i in 0..<list.count {
                    if list[i].name == "What a Piece of Junk!" {
                        list[i].achieved = true
                    }
                }
            }
        }
        for i in 0..<sightingList.list.count { //praise the sun
            if sightingList.list[i].name == "Sun" {
                for i in 0..<list.count {
                    if list[i].name == "Praise the Sun!" {
                        list[i].achieved = true
                    }
                }
            }
            else if sightingList.list[i].name == "Moon" {
                for i in 0..<list.count {
                    if list[i].name == "And You Take the Moon!" {
                        list[i].achieved = true
                    }
                }
            }
            else if sightingList.list[i].name == "Andromeda" || sightingList.list[i].name == "Andromeda Galaxy" {
                for i in 0..<list.count {
                    if list[i].name == "A Galaxy Far, Far Away" {
                        list[i].achieved = true
                    }
                }
            }
            else if sightingList.list[i].name == "Io" {
                for i in 0..<list.count {
                    if list[i].name == "Io You One" {
                        list[i].achieved = true
                    }
                }
            }
            else if sightingList.list[i].name == "Titan" {
                for i in 0..<list.count {
                    if list[i].name == "Reality Is Often Dissapointing" {
                        list[i].achieved = true
                    }
                }
            }
        }
        if sightingList.nameList.contains("Sun") && sightingList.nameList.contains("Moon") && sightingList.nameList.contains("Earth") && sightingList.nameList.contains("Mars") && sightingList.nameList.contains("Venus") && sightingList.nameList.contains("Mercury") && sightingList.nameList.contains("Jupiter") && sightingList.nameList.contains("Saturn") && sightingList.nameList.contains("Uranus") && sightingList.nameList.contains("Neptune") {
            for i in 0..<list.count {
                if list[i].name == "Allow Me to Show You the Universe..." {
                    if list[i].achieved == false {
                        list[i].achieved = true
                        
                    }
                }
            }
        }
        if sightingList.nameList.contains("Stuart Vogel") {
            var flag = false
            for i in 0..<list.count {
                if list[i].name == "Stuart Vogel, Lord of the Cosmos" {
                    flag = true
                }
            }
            if !flag {
                list.append(Achievement(name: "Stuart Vogel, Lord of the Cosmos", achieved: true, desc: "Find Stuart Vogel"))
            }
        }
        return true
    }
    
    func sort() {
        var tempArray = list
        for i in 1..<tempArray.count
        {
            let j = tempArray[i]
            var k = i

            while k > 0 && tempArray[k - 1].name.caseInsensitiveCompare(j.name).rawValue > 0 {
                tempArray[k] = tempArray[k - 1]
                k = k - 1
            }
            tempArray[k] = j
        }
        list = tempArray
    }
}


