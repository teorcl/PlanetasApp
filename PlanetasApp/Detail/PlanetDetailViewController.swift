//
//  PlanetDetailViewController.swift
//  PlanetasApp
//
//  Created by TEO on 4/01/23.
//

import UIKit

protocol PlanetDetailViewControllerProtocol: AnyObject {
    func setNamePlanet(_ namePlanet: String)
    func setNumberSatellites(_ numberSatellites: String)
    func setPlanetDescription(_ planetDescription: String)
    func setOrbitalPeriod(_ orbitalPeriod: String)
    func setDistanceToSun(_ distanceToSun: String)
    func setPlanetImages(_ images: [String])
}

class PlanetDetailViewController: UIViewController {
    
    private let brain : PlanetDetailBrainProtocol = PlanetDetailBrain()
    
    @IBOutlet weak var namePlanetLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberSatellitesLabel: UILabel!
    @IBOutlet weak var orbitalPeriodLabel: UILabel!
    @IBOutlet weak var distanceToSunLabel: UILabel!
    @IBOutlet var planetImages: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.setViewController(self)
        brain.processViewDidLoad()
    }
    
    func setPlanetDetail(_ planetDetail: PlanetDetailDTO){
        brain.setPlanetDetail(planetDetail)
    }
}

extension PlanetDetailViewController: PlanetDetailViewControllerProtocol {
    func setNamePlanet(_ namePlanet: String) {
        namePlanetLabel.text = namePlanet
    }
    
    func setNumberSatellites(_ numberSatellites: String) {
        numberSatellitesLabel.text = "Número de satélites: \(numberSatellites)"
    }
    
    func setPlanetDescription(_ planetDescription: String) {
        descriptionLabel.text = planetDescription
    }
    
    func setOrbitalPeriod(_ orbitalPeriod: String){
        orbitalPeriodLabel.text = "Período orbital: \(orbitalPeriod)"
    }
    
    func setDistanceToSun(_ distanceToSun: String){
        distanceToSunLabel.text = "Distancia al sol: \(distanceToSun)"
    }
    
    func setPlanetImages(_ images: [String]){
        for i in 0...images.count-1 {
            planetImages[i].image = UIImage(named: images[i])
        }
    }
}
