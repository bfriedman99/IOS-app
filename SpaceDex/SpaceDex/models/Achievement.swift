//
//  Achievement.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 4/15/21.
//

import Foundation
import SwiftUI
import CoreLocation

class Achievement: ObservableObject {
    @Published var name: String
    @Published var achieved: Bool
    @Published var desc: String
    
    init(name: String, achieved: Bool, desc: String) {
        self.name = name
        self.achieved = achieved
        self.desc = desc
    }
}
