//
//  Sighting.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/17/21.
//

import Foundation
import SwiftUI
import CoreLocation

class Sighting: ObservableObject {
    @Published var name: String
    @Published var picture: Image
    @Published var date: Date
    @Published var displayDate: String
    @Published var info: String
    @Published var location: String
    @Published var favorite: Bool
    @Published var img = 0
    
    init(_ name: String, picture: Image, date: Date, info: String, location: String, favorite: Bool, img: Int) {
        self.name = name
        self.picture = picture
        self.date = date
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.displayDate = dateFormatter.string(from: date)
        self.info = info
        self.location = location
        self.favorite = favorite
        self.img = img
    }
    
    init() {
        self.name = ""
        self.picture = Image.init("Cosmos")
        self.date = Date.init()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.displayDate = dateFormatter.string(from: Date.init())
        self.info = ""
        self.location = "(0, 0)"
        self.favorite = false
        self.img = 0
    }
}
