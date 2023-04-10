//
//  TableViewCell.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 5.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet var teamName: UILabel!
    
    @IBOutlet var teamImage: UIImageView!
    
    @IBOutlet var teamFeatures: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
