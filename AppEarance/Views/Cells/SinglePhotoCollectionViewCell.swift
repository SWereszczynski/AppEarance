//
//  SinglePhotoCollectionViewCell.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 30.01.2017.
//  Copyright © 2017 zaven. All rights reserved.
//

import UIKit

class SinglePhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var singlePhotoImageView: UIImageView!
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        contentView.layer.cornerRadius = 5
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.singlePhotoImageView.contentMode = .scaleAspectFit
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let photoLayoutAttributes = layoutAttributes as! PhotosCollectionViewLayoutAttributes
        self.layer.anchorPoint = photoLayoutAttributes.anchorPoint
        self.center.y += (photoLayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
        
    }
    
}
