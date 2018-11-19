//
//  NewsListViewModel.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/20/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct NewsListViewModel {
    var news = [NewsViewModel]()
}

extension NewsListViewModel {
    init(berita: [NewsViewModel]) {
        self.news = berita
    }
}
