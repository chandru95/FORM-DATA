//
//  TableViewCell.swift
//  Formdata
//
//  Created by Shyam kumar on 30/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var clusterbutton1: UIButton!
    @IBOutlet weak var worktypebutton1: UIButton!
    @IBOutlet weak var clusterDropIcon: UIImageView!
    @IBOutlet weak var ClusterSelectBtnOutlet: UIButton!
    @IBOutlet weak var worktypedropicon: UIImageView!
    @IBOutlet weak var worktypeselectbtnOutlet: UIButton!
    @IBOutlet weak var clusterselectbtnview: UIView!
    @IBOutlet weak var worktypeselectbtnview: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var sesionLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var worktypeLabel: UILabel!
    @IBOutlet weak var clusterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
