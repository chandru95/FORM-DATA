//
//  CollectionViewCell.swift
//  Formdata
//
//  Created by Shyam kumar on 30/10/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var dateUIview: UIView!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var viewed: UIView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
       
        }
}
