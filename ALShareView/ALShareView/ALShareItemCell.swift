//
//  ALShareItemCell.swift
//  Fox
//
//  Created by N年後 on 2017/4/24.
//  Copyright © 2017年 TRZX. All rights reserved.
//

import UIKit
private extension Selector {
    static let iconClick = #selector(ALShareItemCell.iconClick(_:))

}

let kCellIdentifier_ALShareItemCell = "ALShareItemCell";


class ALShareItemCell: UICollectionViewCell {
    var item = ALShareItem(title: "", icon: ""){
        didSet {
            self.iconView.setImage(UIImage(named:item.icon!), for:.normal)
            self.titleView.text = item.title;
        }

    }

    let iconView:UIButton = {
        let tempiconView = UIButton()
        return tempiconView
    }()

    let titleView:UITextView = {
        let temptitleView = UITextView()
        temptitleView.textColor = UIColor.darkGray
        temptitleView.font = UIFont.systemFont(ofSize: 11)
        temptitleView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0)
        temptitleView.backgroundColor = nil;
        temptitleView.textAlignment = NSTextAlignment.center
        temptitleView.isUserInteractionEnabled = false
        return temptitleView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear

        self.addSubview(self.iconView)
        self.addSubview(self.titleView)
        iconView.addTarget(self, action: .iconClick, for: .touchUpInside)

    }


    func iconClick(_ send:UIButton)  {

        if (self.item.handler != nil) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kShareHideNotification), object: nil)
            self.item.handler!()
        }
        
        
    }



    override func layoutSubviews() {
        super.layoutSubviews()
        let topPadding = 15.0
        let iconView2titleH = 10.0
        let cellWidth = self.frame.size.width
        let titleInset = 4

        // 图标
        let iconViewX = kShareItemCellPadding / 2
        let iconViewY = topPadding
        let iconViewW = cellWidth - kShareItemCellPadding
        let iconViewH = cellWidth - kShareItemCellPadding
        self.iconView.frame = CGRect(x: iconViewX, y:  CGFloat(iconViewY), width: iconViewW, height: iconViewH)

        // 标题
        let titleViewX = -titleInset
        let titleViewY = CGFloat(topPadding) + iconViewH + CGFloat(iconView2titleH)
        let titleViewW = cellWidth + 2 * CGFloat(titleInset)
        let titleViewH:CGFloat = 30.0
        self.titleView.frame = CGRect(x: CGFloat(titleViewX), y:  CGFloat(titleViewY), width: titleViewW, height: titleViewH)

    }



    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
