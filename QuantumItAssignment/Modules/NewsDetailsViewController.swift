//
//  NewsDetailsViewController.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 25/08/23.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet var imgHeadlinePicture: UIImageView!
    @IBOutlet var lblHeadline: UILabel!
    @IBOutlet var lblPublisherName: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    var selectedArticle: Article?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let article = selectedArticle {
               imgHeadlinePicture.imageFromUrl(urlString: article.urlToImage)
               lblHeadline.text = article.title
               lblPublisherName.text = article.author
               lblDate.text = article.publishedAt.formatted()
               lblDescription.text = article.description
           }
    }
    
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        let headlinesVC = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
        self.navigationController?.pushViewController(headlinesVC, animated: true)
    }
    

}
