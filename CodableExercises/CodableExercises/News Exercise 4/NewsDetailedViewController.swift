//
//  NewsDetailedViewController.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class NewsDetailedViewController: UIViewController {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextView: UITextView!
    
    var article: Article!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? "Unknown Author"
        let characterSet = CharacterSet.init(charactersIn: "TZ")
        
        let publishedDate = article.publishedAt.components(separatedBy: characterSet).dropLast().joined(separator: " ")
        
        publishedAtLabel.text = publishedDate
        urlLabel.text = article.url
        newsDescriptionTextView.text = article.description
            
        getImages()
    }
    
    func getImages() {
        
    }
    
}
