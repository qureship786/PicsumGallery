//
//  AuthorCollectionViewCell.swift
//  PicsumGallery
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import UIKit

class AuthorCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorId: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorImageView.image = nil
        authorName.text = ""
        authorId.text = ""
    }
    
}
