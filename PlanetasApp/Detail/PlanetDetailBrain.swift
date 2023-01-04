//
//  PlanetDetailBrain.swift
//  PlanetasApp
//
//  Created by TEO on 4/01/23.
//

import Foundation

protocol PlanetDetailBrainProtocol {
    func setPlanetDetail(_ planetDetail: PlanetDetailDTO)
    func setViewController(_ viewController: PlanetDetailViewControllerProtocol)
    func processViewDidLoad()
}

class PlanetDetailBrain {
    weak var viewController: PlanetDetailViewControllerProtocol?
    var planetDetail : PlanetDetailDTO?
    
    func updateUI(){
        setNamePlanet()
        setNumberSatellites()
    }
    
    func setNamePlanet(){
        guard let planetDetail = planetDetail else { return }
        guard let viewController = viewController else { return}
        viewController.setNamePlanet(planetDetail.name)
    }
    
    func setNumberSatellites(){
        guard let planetDetail = planetDetail else { return }
        guard let viewController = viewController else { return}
        viewController.setNumberSatellites(planetDetail.numberSatellites)
    }
}

extension PlanetDetailBrain: PlanetDetailBrainProtocol {
    func setPlanetDetail(_ planetDetail: PlanetDetailDTO) {
        self.planetDetail = planetDetail
    }
    
    func setViewController(_ viewController: PlanetDetailViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func processViewDidLoad() {
        updateUI()
    }
}
