//
//  NewsListViewModel.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/20/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

class NewsListViewModel {
    var news: [NewsViewModel] = [NewsViewModel]()
    
    init(apiManager: APIManager, completion: @escaping () -> Void) {
        apiManager.getNews { (berita) in
            self.news = berita.map(NewsViewModel.init)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func populateNews(_ berita: [News]) {
        self.news = berita.map(NewsViewModel.init)
    }
}

extension NewsListViewModel {
    
}
