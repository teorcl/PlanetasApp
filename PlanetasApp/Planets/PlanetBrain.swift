//
//  PlanetBrain.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import Foundation

protocol PlanetBrainProtocol {
    func getNumberOfPlanets() -> Int
    func getPlanetForIndex(for index: Int) -> Planet
}

class PlanetBrain {
    let planetStotage: PlanetStorageProtocol = PlanetStorage()
}

extension PlanetBrain: PlanetBrainProtocol {
    func getNumberOfPlanets() -> Int {
        planetStotage.getNumberOfPlanets()
    }
    
    func getPlanetForIndex(for index: Int) -> Planet {
        planetStotage.getPlanetForIndex(for: index)
    }
    
    
}
