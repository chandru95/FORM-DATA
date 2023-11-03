//
//  WorkTypeTableViewCell.swift
//  Formdata
//
//  Created by Admin on 01/11/23.
//

import UIKit

class WorkTypeTableViewCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var view1: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
