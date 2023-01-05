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
    func processPlanetSeleted(for index: Int) 
    func getPlanetDetail() -> PlanetDetailDTO
    func updatePlanetsConsulted()
    func wereAllPlanetsConsulted() -> Bool
    func validateConsultedPlanets()
}

class PlanetBrain {
    private struct Const {
        static let message = "Todos los planetas fueron consultados"
        static let title = "Consulta completa"
    }
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
        updatePlanetsConsulted()
    }
    
    func getPlanetDetail() -> PlanetDetailDTO {
        guard let planetDetail = planetDetail else {
            return PlanetDetailDTO(name: "", numberSatellites: "", description: "", orbitalPeriod: "", distanceToSun: "")
        }
        return planetDetail
    }
    
    func updatePlanetsConsulted() {
        guard let tableViewController = tableViewController else {return}
        tableViewController.increaseCounter()
    }
    
    func wereAllPlanetsConsulted() -> Bool {
        guard let tableViewController = tableViewController else {
            return false
        }
        let planetsConsulted = tableViewController.getSelectedCells()
        let totalPlanets = planetTableStorage.getNumberOfPlanets()
        return planetsConsulted == totalPlanets
    }
    
    func validateConsultedPlanets() {
        if wereAllPlanetsConsulted() {
            guard let tableViewController = tableViewController else { return }
            tableViewController.presentAlert(with: Const.message, and: Const.title)
        }
    }
}
