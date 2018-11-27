//
//  DetailViewController.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    var newsViewModel: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTitleLabel.text = newsViewModel.title
        newsDescriptionLabel.text = newsViewModel.description
    }
}
