//
//  SongsDetailedViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class SongsDetailedViewController: UIViewController {

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var song: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        songNameLabel.text = song.song_name
        artistNameLabel.text = song.display_artist
    }
    
}
