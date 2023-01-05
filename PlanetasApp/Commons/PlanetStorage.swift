//
//  PlanetStorage.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import Foundation

protocol PlanetStorageProtocol {
    func getPlanetsForTable() -> [PlanetTableDTO]
    func getPlanetDetail(for index: Int) -> PlanetDetailDTO
}

class PlanetStorage {
    let planets = [
        Planet(name: "Tierra", numberSatellites: "1", image: "tierra",description: "Es un planeta terrestre y rocoso. Tiene una superficie sólida y activa, con montañas, valles, cañones, llanuras y mucho más.",orbitalPeriod: "365 días",distanceToSun: "149.597.870 kilómetros aproximadamente",planetImages: ["tierra1","tierra2"]),
        
        Planet(name: "Marte", numberSatellites: "2", image: "marte", description: "Marte es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio.", orbitalPeriod: "687 días", distanceToSun: "227.9 millones km", planetImages: ["marte1","marte2"]),
        
        Planet(name: "Mercurio", numberSatellites: "0", image: "mercurio", description: "Mercurio es un planeta sólido y rocoso, es el planeta más cercano al Sol y es también el más pequeño de todos los planetas del Sistema Solar.", orbitalPeriod: "88 días", distanceToSun: "57.910.000 Km aproximadamente", planetImages: ["mercurio1","mercurio2"]),
        
        Planet(name: "Venus", numberSatellites: "0", image: "venus", description: "Venus es el segundo planeta del sistema solar en orden de proximidad al Sol y el tercero en cuanto a tamaño en orden ascendente después de Mercurio y Marte.", orbitalPeriod: "225 días", distanceToSun: "108.200.000 km aproximadamente",planetImages: ["venus1","venus2"]),

        Planet(name: "Júpiter", numberSatellites: "79", image: "jupiter", description: "Júpiter es el planeta más grande del sistema solar y el quinto en orden de lejanía al Sol.​ Es un gigante gaseoso que forma parte de los denominados planetas exteriores.", orbitalPeriod: "12 años", distanceToSun: "778.330.000 Km aproximadamente",planetImages: ["jupiter1","jupiter2"]),
        
        Planet(name: "Saturno", numberSatellites: "82", image: "saturno", description: "Saturno es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa después de Júpiter y el único con un sistema de anillos visible desde la Tierra.", orbitalPeriod: "29 años", distanceToSun: "1.429.400.000 Km aproximadamente", planetImages: ["saturno1","saturno2"]),

        Planet(name: "Urano", numberSatellites: "27", image: "urano", description: "Urano es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo.", orbitalPeriod: "84 años", distanceToSun: "2.870.990.000 Km aproximadamente", planetImages: ["urano1","urano2"]),

        Planet(name: "Neptuno", numberSatellites: "14", image: "neptuno", description: "Neptuno es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores, y dentro de estos, es uno de los gigantes helados, y es el primero que fue descubierto gracias a predicciones matemáticas.", orbitalPeriod: "165 años", distanceToSun: "4.504.300.000 Km aproximadamente", planetImages: ["neptuno1","neptuno2"]),
        
        Planet(name: "Plutón", numberSatellites: "4", image: "pluton", description: "Plutón es un planeta enano del sistema solar situado a continuación de la órbita de Neptuno.", orbitalPeriod: "284 años", distanceToSun: "5.934.456.500 Km aproximadamente", planetImages: ["pluton1","pluton2"])
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
        
    func getPlanetDetail(for index: Int) -> PlanetDetailDTO {
        let planet = planets[index]
        return PlanetDetailDTO(name: planet.name, numberSatellites: planet.numberSatellites, description: planet.description, orbitalPeriod: planet.orbitalPeriod, distanceToSun: planet.distanceToSun, planetImages: planet.planetImages)
    }
    
}
