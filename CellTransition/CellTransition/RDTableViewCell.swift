//
//  RDTableViewCell.swift
//  CellTransition
//
//  Created by Guillermo Delgado on 01/08/2017.
//  Copyright © 2017 GuillermoRD. All rights reserved.
//

import UIKit

class RDTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
