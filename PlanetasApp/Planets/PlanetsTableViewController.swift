//
//  PlanetsTableViewController.swift
//  PlanetasApp
//
//  Created by TEO on 3/01/23.
//

import UIKit

protocol PlanetsTableViewControllerProtocol: AnyObject {
    func navigateTowardsDetail()
    func increaseCounter()
    func getSelectedCells() -> Int
    func presentAlert(with message: String, and title: String)
}

class PlanetsTableViewController: UITableViewController {
    
    private struct Const {
        static let cellIdentifier = "PlanetCell"
        static let segueDestination = "goToDetail"
    }
    
    let brain: PlanetBrainProtocol = PlanetBrain()
    var counterCellSelected = 0 //
    
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
        cell.accessoryType = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        if cell.accessoryType != .checkmark {
            cell.accessoryType = .checkmark
            brain.processPlanetSeleted(for: indexPath.row)
            brain.validateConsultedPlanets()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let planetDetailViewController = segue.destination as? PlanetDetailViewController else { return }
        let planetDetail = brain.getPlanetDetail()
        planetDetailViewController.setPlanetDetail(planetDetail)
    }
    
    func resetTable(){
        tableView.reloadData()
        resetcounterCellSelected()
    }
    
    func resetcounterCellSelected(){
        counterCellSelected = 0
    }
    
}

extension PlanetsTableViewController: PlanetsTableViewControllerProtocol {
    func navigateTowardsDetail() {
        performSegue(withIdentifier: Const.segueDestination, sender: self)
    }
    
    func increaseCounter() {
        counterCellSelected += 1
    }
    
    func getSelectedCells() -> Int {
        counterCellSelected
    }
    
    func presentAlert(with message: String, and title: String) {
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.resetTable()
        }
        alert.addAction(resetAction)
        present(alert, animated: true)
    }
}
