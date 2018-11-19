//
//  NewsViewModel.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/20/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct NewsViewModel {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
}

extension NewsViewModel {
    init(news: News) {
        self.source = news.source
        self.author = news.author
        self.title = news.title
        self.description = news.description
        self.url = news.url
        self.urlToImage = news.urlToImage
        self.publishedAt = news.publishedAt
        self.content = news.content
    }
}
