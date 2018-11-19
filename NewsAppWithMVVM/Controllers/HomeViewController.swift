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
    
    var newsListViewModel = NewsListViewModel() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNews()
    }
    
    func loadNews() {
        APIManager().getNews(completion: { news in
            let news = news.map({ (berita) -> NewsViewModel in
                return NewsViewModel(news: berita)
            })
            self.newsListViewModel = NewsListViewModel(berita: news)
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
