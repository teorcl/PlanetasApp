//
//  PlanetsTableViewController.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import UIKit



class PlanetsTableViewController: UITableViewController {
    
    private struct Const {
        static let cellIdentifier = "PlanetCell"
    }
    
    let brain: PlanetBrainProtocol = PlanetBrain()
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brain.getNumberOfPlanets()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier, for: indexPath) as! PlanetCellProtocol
        let planet = brain.getPlanetForIndex(for: indexPath.row)
        let planetImage = UIImage(named: planet.image)
        cell.setNamePlanet(planet.name)
        cell.setNumberSatellites(planet.numberSatellites)
        cell.setPlanetImage(planetImage)
        return cell
    }
    
}
