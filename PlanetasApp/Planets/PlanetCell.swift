//
//  PlanetCell.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import UIKit

protocol PlanetCellProtocol where Self: UITableViewCell {
    func setPlanetImage(_ planetImage: UIImage?)
    func setNamePlanet(_ namePlanet: String)
    func setNumberSatellites(_ numberOfSatellites: String)
}

class PlanetCell: UITableViewCell {
    
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var namePlanetLabel: UILabel!
    @IBOutlet weak var numberSatellitesLabel: UILabel!
    
}

extension PlanetCell: PlanetCellProtocol {
    func setPlanetImage(_ planetImage: UIImage?) {
        planetImageView.image = planetImage
    }
    
    func setNamePlanet(_ namePlanet: String) {
        namePlanetLabel.text = namePlanet
    }
    
    func setNumberSatellites(_ numberOfSatellites: String) {
        numberSatellitesLabel.text = "Número de satélites: \(numberOfSatellites)"
    }
    
    
}
