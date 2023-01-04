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
    func processPlanetSeleted() // Editar
}

class PlanetBrain {
    weak var tableViewController: PlanetsTableViewControllerProtocol?
    let planetStorage: PlanetTableStorageProtocol = PlanetTableStorage()
}

extension PlanetBrain: PlanetBrainProtocol {
    func getNumberOfPlanets() -> Int {
        planetStorage.getNumberOfPlanets()
    }
    
    func getPlanetForIndex(for index: Int) -> PlanetTableDTO {
        planetStorage.getPlanetForIndex(for: index)
    }
    
    func setTableViewController(_ tableViewController: PlanetsTableViewControllerProtocol) {
        self.tableViewController = tableViewController
    }
    
    func processPlanetSeleted() {
        guard let tableViewController = tableViewController else {return}
        tableViewController.navigateTowardsDetail()
    }
}
