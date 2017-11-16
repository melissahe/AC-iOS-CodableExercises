//
//  ColorViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorsTableView: UITableView!
    
    var colors: [Color] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        colorsTableView.delegate = self
        colorsTableView.dataSource = self
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "ColorInfo", ofType: "json") else {
            print("Error: path not configured correctly")
            return
        }
        
        let myURL = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: myURL) else {
            print("Error: data not configured correctly")
            return
        }
        
        do {
            let myDecoder = JSONDecoder()
            let colorScheme = try myDecoder.decode(ColorScheme.self, from: data)
            self.colors = colorScheme.colors
        } catch let error {
            print(error)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? ColorDetailViewController {
            guard let currentIndexPath = colorsTableView.indexPath(for: cell) else {
                print("Error: Couldn't find current index path")
                return
            }
            destinationVC.color = colors[currentIndexPath.row]
        }
    }
}

//MARK: - Table View Methods
extension ColorViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "detailedSegue", sender: selectedCell)
    }
    
    //Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let currentColor = colors[indexPath.row]
        
        let redValue = CGFloat(currentColor.rgb.fraction.r)
        let greenValue = CGFloat(currentColor.rgb.fraction.g)
        let blueValue = CGFloat(currentColor.rgb.fraction.b)
        
        cell.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        cell.textLabel?.text = currentColor.name.value
        cell.detailTextLabel?.text = currentColor.hex.value
        
        return cell
    }
    
}
