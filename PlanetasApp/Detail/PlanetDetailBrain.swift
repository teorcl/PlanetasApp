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
    func setPlanetImages()
}

class PlanetDetailBrain {
    weak var viewController: PlanetDetailViewControllerProtocol?
    var planetDetail : PlanetDetailDTO?
    
    func updateUI(){
        setNamePlanet()
        setNumberSatellites()
        setPlanetDescription()
        setOrbitalPeriod()
        setDistanceToSun()
        setPlanetImages()
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
    
    func setPlanetDescription(){
        guard let planetDetail = planetDetail else { return }
        guard let viewController = viewController else { return}
        viewController.setPlanetDescription(planetDetail.description)
    }
    
    func setOrbitalPeriod(){
        guard let planetDetail = planetDetail else { return }
        guard let viewController = viewController else { return}
        viewController.setOrbitalPeriod(planetDetail.orbitalPeriod)
    }
    
    func setDistanceToSun(){
        guard let planetDetail = planetDetail else { return }
        guard let viewController = viewController else { return}
        viewController.setDistanceToSun(planetDetail.distanceToSun)
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
    
    func setPlanetImages() {
        guard let viewController = viewController else { return}
        guard let planetDetail = planetDetail else { return }
        let images = planetDetail.planetImages
        viewController.setPlanetImages(images)
    }
}
