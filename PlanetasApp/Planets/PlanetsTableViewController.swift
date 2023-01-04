//
//  PlanetsTableViewController.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import UIKit

protocol PlanetsTableViewControllerProtocol: AnyObject {
    func navigateTowardsDetail()
}

class PlanetsTableViewController: UITableViewController {
    
    private struct Const {
        static let cellIdentifier = "PlanetCell"
        static let segueDestination = "goToDetail"
    }
    
    let brain: PlanetBrainProtocol = PlanetBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.setTableViewController(self)
    }
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        brain.processPlanetSeleted(for: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let planetDetailViewController = segue.destination as? PlanetDetailViewController else { return }
        let planetDetail = brain.getPlanetDetail()
        planetDetailViewController.setPlanetDetail(planetDetail)
    }
    
}

extension PlanetsTableViewController: PlanetsTableViewControllerProtocol {
    func navigateTowardsDetail() {
        performSegue(withIdentifier: Const.segueDestination, sender: self)
    }
    
}
