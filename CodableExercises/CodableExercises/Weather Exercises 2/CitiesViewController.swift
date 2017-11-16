//
//  CitiesViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "CitiesInfo", ofType: "json") else {
            print("Error: path not configured correctly")
            return
        }
        
        let myURL = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: myURL) else {
            print("Error: data not configured correctly")
            return
        }
        
        let myDecoder = JSONDecoder()
        
        do {
            let cities = try myDecoder.decode(Weather.self, from: data)
            self.cities = cities.list
        } catch let error {
            print(error)
        }
        
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? CitiesDetailedViewController {
            guard let currentIndexPath = citiesTableView.indexPath(for: cell) else {
                return
            }
            destinationVC.city = cities[currentIndexPath.row]
        }
    }
    
}

//MARK: - Table View Methods
extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    //Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "detailedSegue", sender: selectedCell)
    }
    
    //Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let currentCity = cities[indexPath.row]
        
        cell.textLabel?.text = currentCity.name
        cell.detailTextLabel?.text = currentCity.main.temp.description + " degrees Celsius"
        
        return cell
    }
    
}
