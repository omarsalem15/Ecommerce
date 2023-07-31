//
//  CartCell.swift
//  ODC-Project
//
//  Created by Omar Salem on 30/07/2023.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartQuantity: UILabel!
    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var cartPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
