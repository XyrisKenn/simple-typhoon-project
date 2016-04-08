//
//  BlogListView.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Foundation
import SwiftyJSON

public class BlogListView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var viewColor: UIColor?
    private var collectionView : UICollectionView!
    
    var fontPointSize : NSNumber?
    var fontName : String?
    private var titleFont : UIFont!
    
    public var blogs : JSON? {
        willSet(blogs) {
            if (blogs != nil) {
                self.collectionView.reloadData()
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initCollectionView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.collectionView.backgroundColor = viewColor
        
        self.titleFont = UIFont(name:fontName!, size: CGFloat(fontPointSize!))
    }
    
    // init UI components

    private func initCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSizeZero
        layout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.pagingEnabled = true
        
        let nib = UINib(nibName: "BlogListCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: "BlogCell")
        
        self.collectionView.backgroundColor = UIColor.whiteColor()
        self.addSubview(self.collectionView)
    }

    
    // delegate calls
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.blogs != nil) {
            return (self.blogs?["blogs"]["blog"].count)!
        } else {
            return 0
        }
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "BlogCell"
        
        let data = self.blogs?["blogs"]["blog"][indexPath.row]
        
        let cell : BlogListCollectionViewCell = self.collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BlogListCollectionViewCell
        
        let title = data!["name"]
        cell.titleLabel.font = self.titleFont
        cell.titleLabel.text = title.stringValue
        cell.backgroundColor = UIColor.whiteColor()

        return cell
    }
    
    // sizing
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.frame.size.width, 75.0)
    }

    
}
