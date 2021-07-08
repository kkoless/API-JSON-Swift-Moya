//
//  UserInfoTableViewCell.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var websiteLabel: UILabel!
	
	@IBOutlet weak var streetLabel: UILabel!
	@IBOutlet weak var suiteLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var zipcodeLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
