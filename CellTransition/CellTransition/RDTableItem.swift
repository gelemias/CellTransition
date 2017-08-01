//
//  RDTableItem.swift
//  CellTransition
//
//  Created by Guillermo Delgado on 01/08/2017.
//  Copyright © 2017 GuillermoRD. All rights reserved.
//

import UIKit

class RDTableItem: NSObject {

    init(withAvatar avatarImageView: UIImageView!,
         title: String!,
         subtitle: String!,
         contentString: String?,
         contentImage: UIImageView?) {

        self.avatarImageView = avatarImageView
        self.title = title
        self.subtitle = subtitle

        self.contentString = contentString
        self.contentImage = contentImage
    }

    var avatarImageView: UIImageView!
    var title: String!
    var subtitle: String!
    var contentString: String?
    var contentImage: UIImageView?
}
