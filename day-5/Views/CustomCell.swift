//
//  CustomCell.swift
//  day-5
//
//  Created by admin on 6/19/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol OptionButtonsDelegate{
    func closeFriendsTapped(at index:IndexPath)
}

class CustomCell: UITableViewCell {

     var delegate:OptionButtonsDelegate!
    
    var indexPath:IndexPath!
    
    @IBAction func closeFriendsAction(_ sender: UIButton) {
        self.delegate?.closeFriendsTapped(at: indexPath)
    }
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var lblTitile: UILabel!
    
    @IBOutlet weak var lblSubTitile: UILabel!
    
    @IBOutlet weak var btnAccept: UIButton!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
