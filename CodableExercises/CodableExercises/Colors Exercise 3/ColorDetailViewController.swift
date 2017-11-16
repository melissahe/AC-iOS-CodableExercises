//
//  ColorDetailViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        colorNameLabel.text = color.name.value
        hexValueLabel.text = color.hex.clean
        redValueLabel.text = color.rgb.r.description
        greenValueLabel.text = color.rgb.g.description
        blueValueLabel.text = color.rgb.b.description
    }
    
}
