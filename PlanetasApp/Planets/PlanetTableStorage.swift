//
//  PlanetTableStorage.swift
//  PlanetasApp
//
//  Created by TEO on 4/01/23.
//

import Foundation

protocol PlanetTableStorageProtocol {
    func getNumberOfPlanets() -> Int
    func getPlanetForIndex(for index: Int) -> PlanetTableDTO
    func getDetailPlanetForIndex(for index: Int) -> PlanetDetailDTO
}

class PlanetTableStorage {
    let planetStorage: PlanetStorageProtocol = PlanetStorage()
}

extension PlanetTableStorage: PlanetTableStorageProtocol {
    func getNumberOfPlanets() -> Int {
        let planets = planetStorage.getPlanetsForTable()
        return planets.count
    }

    func getPlanetForIndex(for index: Int) -> PlanetTableDTO {
        let planets = planetStorage.getPlanetsForTable()
        return planets[index]
    }
    
    func getDetailPlanetForIndex(for index: Int) -> PlanetDetailDTO {
        let planetDetail = planetStorage.getPlanetDetail(for: index)
        return planetDetail
    }
}
