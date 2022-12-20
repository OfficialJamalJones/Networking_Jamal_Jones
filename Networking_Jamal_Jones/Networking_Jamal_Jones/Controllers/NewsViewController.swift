//
//  NewsViewController.swift
//  Networking_Jamal_Jones
//
//  Created by Consultant on 12/20/22.
//

import UIKit

class NewsViewController: UITableViewController {
    
    var model = NetworkingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.model.loadJson(filename: "example_1")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.articles!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let article = model.articles![indexPath.row]
        cell.articleImage.layer.cornerRadius = 6
        cell.articleImage.image = article.loadImage()
        cell.articleSource.text = article.source
        cell .articleTitle.text = article.title
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

   
}
