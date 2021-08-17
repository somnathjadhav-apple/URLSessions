//
//  myTableViewCell.swift
//  API Parsing tableView
//
//  Created by Somnath on 12/07/21.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var postId: UILabel!
    
    @IBOutlet weak var Id: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var body: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
