//
//  PlanetBrain.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import Foundation

protocol PlanetBrainProtocol {
    func getNumberOfPlanets() -> Int
    func getPlanetForIndex(for index: Int) -> PlanetTableDTO
    func setTableViewController(_ tableViewController: PlanetsTableViewControllerProtocol)
    func processPlanetSeleted(for index: Int) // Editar
    func getPlanetDetail() -> PlanetDetailDTO
}

class PlanetBrain {
    weak var tableViewController: PlanetsTableViewControllerProtocol?
    let planetTableStorage: PlanetTableStorageProtocol = PlanetTableStorage()
    var planetDetail: PlanetDetailDTO?
}

extension PlanetBrain: PlanetBrainProtocol {
    func getNumberOfPlanets() -> Int {
        planetTableStorage.getNumberOfPlanets()
    }
    
    func getPlanetForIndex(for index: Int) -> PlanetTableDTO {
        planetTableStorage.getPlanetForIndex(for: index)
    }
    
    func setTableViewController(_ tableViewController: PlanetsTableViewControllerProtocol) {
        self.tableViewController = tableViewController
    }
    
    func processPlanetSeleted(for index: Int) {
        guard let tableViewController = tableViewController else {return}
        self.planetDetail = planetTableStorage.getDetailPlanetForIndex(for: index)
        tableViewController.navigateTowardsDetail()
    }
    
    func getPlanetDetail() -> PlanetDetailDTO {
        guard let planetDetail = planetDetail else {
            return PlanetDetailDTO(name: "", numberSatellites: "")
        }
        return planetDetail
    }
}
