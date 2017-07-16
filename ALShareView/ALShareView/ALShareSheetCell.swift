//
//  ALShareSheetCell.swift
//  Fox
//
//  Created by N年後 on 2017/4/24.
//  Copyright © 2017年 TRZX. All rights reserved.
//

import UIKit
let kCellIdentifier_ALShareSheetCell = "ALShareSheetCell";

class ALShareSheetCell: UITableViewCell {

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let tempFlowLayout = UICollectionViewFlowLayout()
        tempFlowLayout.minimumInteritemSpacing = 0;
        tempFlowLayout.minimumLineSpacing = 0;
        tempFlowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        tempFlowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        tempFlowLayout.itemSize = CGSize(width: kShareItemCellWidth, height: kShareItemCellHeight)
        return tempFlowLayout
    }()


    lazy var collectionView: UICollectionView = {
        let tempCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        tempCollectionView.alwaysBounceHorizontal = true // 小于等于一页时, 允许bounce
        tempCollectionView.showsHorizontalScrollIndicator = false
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.backgroundColor = UIColor.clear
        tempCollectionView.register(ALShareItemCell.self, forCellWithReuseIdentifier:kCellIdentifier_ALShareItemCell)

        return tempCollectionView
    }()

    var itemArray:Array<ALShareItem> = []


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(self.collectionView)
        self.backgroundColor = UIColor.clear

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()

        self.collectionView.frame = self.bounds
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = nil;


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension ALShareSheetCell:UICollectionViewDataSource, UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.itemArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell: ALShareItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier_ALShareItemCell, for: indexPath) as! ALShareItemCell
                    cell.item = self.itemArray[indexPath.item] 

        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }



}
