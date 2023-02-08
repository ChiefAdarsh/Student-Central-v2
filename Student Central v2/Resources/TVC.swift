//
//  TVC.swift
//  funn
//
//  Created by Rushil Patel on 2/6/23.
//

import UIKit

class TVC: UITableViewCell {

    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
