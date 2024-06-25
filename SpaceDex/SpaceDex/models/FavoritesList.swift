//
//  FavoritesList.swift
//  SpaceDex
//
//  Created by Robbie Dittmar on 3/31/21.
//

import Foundation

class FavoritesList: ObservableObject {
    @Published var list: [Sighting]
    
    init() {
        list = []
    }
    
    func addFavorite(_ sighting: Sighting) {
        list.append(sighting)
    }
}
