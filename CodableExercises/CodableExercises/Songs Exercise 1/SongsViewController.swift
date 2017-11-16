//
//  SongsViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController {

    @IBOutlet weak var songsTableView: UITableView!
    
    var songs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        songsTableView.delegate = self
        songsTableView.dataSource = self
    }

    func loadData() {
        guard let path = Bundle.main.path(forResource: "SongsInfo", ofType: "json") else { return }
        
        let myURL = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: myURL) else { return }
        
        let myDecoder = JSONDecoder()
        
        do {
            let songs = try myDecoder.decode([Song].self, from: data)
            self.songs = songs
        } catch let error {
            print(error)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? SongsDetailedViewController {
            guard let currentIndexPath = songsTableView.indexPath(for: cell) else {
                return
            }
            destinationVC.song = songs[currentIndexPath.row]
        }
    }
    
}

//MARK: - Table View Methods
extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "detailedSegue", sender: selectedCell)
    }
    
    //Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let currentSong = songs[indexPath.row]
        
        cell.textLabel?.text = currentSong.song_name
        cell.detailTextLabel?.text = currentSong.display_artist
        
        return cell
    }
    
}
