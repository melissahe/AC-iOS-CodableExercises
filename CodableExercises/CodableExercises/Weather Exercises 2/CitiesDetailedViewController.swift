//
//  CitiesDetailedViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class CitiesDetailedViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempLowLabel: UILabel!
    @IBOutlet weak var tempHighLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        cityNameLabel.text = city.name
        tempLabel.text = city.main.temp.description + " degrees Celsius"
        tempLowLabel.text = city.main.temp_min.description + " degrees Celsius"
        tempHighLabel.text = city.main.temp_max.description + " degrees Celsius"
        humidityLabel.text = city.main.humidity.description + "%"
        weatherLabel.text = "\(city.weather[0].main) | \(city.weather[0].description)"
        windSpeedLabel.text = city.wind.speed.description + " mph"
    }
    
}
