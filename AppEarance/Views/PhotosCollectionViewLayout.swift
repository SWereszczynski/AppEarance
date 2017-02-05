//
//  PhotosCollectionViewLayout.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 30.01.2017.
//  Copyright © 2017 zaven. All rights reserved.
//

import UIKit

class PhotosCollectionViewLayout: UICollectionViewLayout {

    let screenSize = UIScreen.main.bounds
    
    let itemSize = CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
    var angleAtExtreme: CGFloat {
        return collectionView!.numberOfItems(inSection: 0) > 0 ?
            -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * angleBetweenPhotos : 0
    }
    var angle: CGFloat {
        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width -
            collectionView!.bounds.width)
    }
    var radius: CGFloat = 1500
    var angleBetweenPhotos: CGFloat {
        return atan(itemSize.width / radius)
    }
    var attributesList = [PhotosCollectionViewLayoutAttributes]()
    
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
                      height: collectionView!.bounds.height)
    }

    override class var layoutAttributesClass: AnyClass {
        return PhotosCollectionViewLayoutAttributes.self
    }
    
    override func prepare() {
        super.prepare()
        
        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width/2)
        let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
        self.attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map({ (i) -> PhotosCollectionViewLayoutAttributes in
            let attributes = PhotosCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            attributes.size = self.itemSize
            attributes.center = CGPoint(x: centerX, y: self.collectionView!.bounds.midY)
            attributes.angle = self.angle + (self.angleBetweenPhotos * CGFloat(i))
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            return attributes
        })
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributesList[indexPath.row]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

class PhotosCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            zIndex = Int(angle * 1000000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: PhotosCollectionViewLayoutAttributes =
            super.copy(with: zone) as! PhotosCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = self.anchorPoint
        copiedAttributes.angle = self.angle
        return copiedAttributes
    }
}
