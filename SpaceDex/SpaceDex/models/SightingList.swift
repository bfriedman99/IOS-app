//
//  SightingList.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import Foundation

class SightingList: ObservableObject {
    @Published var list: [Sighting]
    @Published var nameList: [String]
    
    init() {
        list = []
        nameList = []
    }
    
    func addSighting(_ sighting: Sighting) {
        var alreadyInList = false
        if list.count > 0 {
            print("in if statement")
            for i in 0..<list.count {
                print("in for loop")
                print(list[i].name.caseInsensitiveCompare(sighting.name).rawValue)
                if list[i].name.caseInsensitiveCompare(sighting.name).rawValue == 0 {
                    print("already in list")
                    alreadyInList = true
                }
            }
        }
        if !alreadyInList {
            list.append(sighting)
            nameList.append(sighting.name)
        }
    }
    
    func sortByParameter(sortingParam: String, sortingDirection: Bool) {
        if sortingDirection {
            if sortingParam == "date" {
                var tempArray = list
                for i in 1..<tempArray.count
                {
                    let j = tempArray[i]
                    var k = i

                    while k > 0 && tempArray[k - 1].date > j.date {
                        tempArray[k] = tempArray[k - 1]
                        k = k - 1
                    }
                    tempArray[k] = j
                }
                list = tempArray
            }
            if sortingParam == "name" {
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
        else {
            if sortingParam == "date" {
                var tempArray = list
                for i in 1..<tempArray.count
                {
                    let j = tempArray[i]
                    var k = i

                    while k > 0 && tempArray[k - 1].date < j.date {
                        tempArray[k] = tempArray[k - 1]
                        k = k - 1
                    }
                    tempArray[k] = j
                }
                list = tempArray
            }
            if sortingParam == "name" {
                var tempArray = list
                for i in 1..<tempArray.count
                {
                    let j = tempArray[i]
                    var k = i

                    while k > 0 && tempArray[k - 1].name.caseInsensitiveCompare(j.name).rawValue < 0 {
                        tempArray[k] = tempArray[k - 1]
                        k = k - 1
                    }
                    tempArray[k] = j
                }
                list = tempArray
            }
        }
    }
}
