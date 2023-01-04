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
}

class PlanetDetailViewController: UIViewController {
    
    private let brain : PlanetDetailBrainProtocol = PlanetDetailBrain()
    
    @IBOutlet weak var namePlanetLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberSatellitesLabel: UILabel!
    @IBOutlet weak var orbitalPeriodLabel: UILabel!
    @IBOutlet weak var distanceToSunLabel: UILabel!
    
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
}
