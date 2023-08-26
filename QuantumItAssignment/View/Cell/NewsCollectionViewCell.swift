//
//  NewsCollectionViewCell.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 26/08/23.
//

// e5cc2701a68b4a54b8d2abe2fcf548f3
import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgNews: UIImageView!
    @IBOutlet var lblNewsHeadline: UILabel!
    @IBOutlet var lblAuthorName: UILabel!
    @IBOutlet var lblDate: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()

        imgNews.layer.cornerRadius = 10
            // Set font and size for lblNewsHeadline
            lblNewsHeadline.font = UIFont(name: "RobotoSlab-Regular", size: 20)

            // Set font and size for lblAuthorName
            lblAuthorName.font = UIFont(name: "RobotoSlab-Bold", size: 12)
        }
    
}
