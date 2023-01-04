//
//  PlanetStorage.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import Foundation

protocol PlanetStorageProtocol {
    func getPlanetsForTable() -> [PlanetTableDTO]
}

class PlanetStorage {
    let planets = [
        Planet(name: "Tierra", numberSatellites: "1", image: "tierra"),
        Planet(name: "Marte", numberSatellites: "2", image: "marte"),
        Planet(name: "Mercurio", numberSatellites: "0", image: "mercurio"),
        Planet(name: "Venus", numberSatellites: "0", image: "venus"),
        Planet(name: "Júpiter", numberSatellites: "79", image: "jupiter"),
        Planet(name: "Saturno", numberSatellites: "82", image: "saturno"),
        Planet(name: "Urano", numberSatellites: "27", image: "urano"),
        Planet(name: "Neptuno", numberSatellites: "14", image: "neptuno"),
        Planet(name: "Plutón", numberSatellites: "4", image: "pluton")
    ]
}

extension PlanetStorage: PlanetStorageProtocol {
        
    func getPlanetsForTable() -> [PlanetTableDTO] {
        var planetTableStorage: [PlanetTableDTO] = []
        for planet in planets {
            let planetForTable: PlanetTableDTO
            planetForTable = PlanetTableDTO(name: planet.name, numberSatellites: planet.numberSatellites, image: planet.image)
            planetTableStorage.append(planetForTable)
        }
        return planetTableStorage
    }
    
}
