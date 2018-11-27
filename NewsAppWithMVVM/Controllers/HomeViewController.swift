//
//  ViewController.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/19/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var mainNewsImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainTitleNewsLabel: UILabel!
    @IBOutlet weak var mainSourceNewsLabel: UILabel!
    
    var newsListViewModel: NewsListViewModel!
    var apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsListViewModel = NewsListViewModel(apiManager: apiManager, completion: {
            self.tableView.reloadData()
            self.mainTitleNewsLabel.text = self.newsListViewModel.news.first?.title
            self.mainSourceNewsLabel.text = self.newsListViewModel.news.first?.author
        })
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListViewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let newsViewModel = newsListViewModel.news[indexPath.row]
        
        cell.labelTitleNews.text = newsViewModel.title
        cell.labelAuthorNews.text = newsViewModel.author
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailNews" {
            let destination = segue.destination as! DetailViewController
            let selectedNews = sender as! HomeTableViewCell
            let indexPath = tableView.indexPath(for: selectedNews)
            let news = newsListViewModel.news[indexPath!.row]
            destination.newsViewModel = news
        }
    }
}
