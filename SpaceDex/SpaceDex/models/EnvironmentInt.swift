//
//  EnvironmentInt.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 4/1/21.
//

import Foundation

class EnvironmentInt: ObservableObject {
    @Published var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    init() {
        self.value = 0
    }
}
