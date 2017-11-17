//
//  NewsViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }

    func loadData() {
        guard let path = Bundle.main.path(forResource: "NewsInfo", ofType: "json") else {
            print("Error: path not configured correctly")
            return
        }
        
        let myURL = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: myURL) else {
            print("Error: cannot convert into data")
            return
        }
        
        do {
            let myDecoder = JSONDecoder()
            let results = try myDecoder.decode(ResultsWrapper.self, from: data)
            self.articles = results.articles
        } catch let error {
            print(error)
        }
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? NewsDetailedViewController {
            guard let currentIndexPath = newsTableView.indexPath(for: cell) else {
                return
            }
            
            destinationVC.article = articles[currentIndexPath.row]
        }
    }
    
}

//MARK: - Table View Methods
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "detailedSegue", sender: selectedCell)
    }
    
    //Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        let currentArticle = articles[indexPath.row]
        
        cell.textLabel?.text = currentArticle.title
        cell.detailTextLabel?.text = currentArticle.description
        
        return cell
    }
    
}
