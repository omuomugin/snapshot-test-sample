//
//  CollectionViewCell.swift
//  snapshot-test
//
//  Created by Shunsuke Saaki on 2020/03/28.
//  Copyright © 2020 omuomugin. All rights reserved.
//

import UIKit

class SimpleCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func setupCell(title: String, description: String) {
        self.titleLabel.text = title;
        self.descriptionLabel.text = description;
    }
    
    static func cellHeight() -> CGFloat {
        return 120.0;
    }
}
