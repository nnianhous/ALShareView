//
//  ALShareSheetView.swift
//  Fox
//
//  Created by N年後 on 2017/4/24.
//  Copyright © 2017年 TRZX. All rights reserved.
//

import UIKit
private extension Selector {
    static let cancelButtonClick = #selector(ALShareSheetView.cancelButtonClick(_:))
}


let kShareItemCellHeight:CGFloat = 123.0 // 每个item的高度
let kShareItemCellWidth:CGFloat = 72.0 // 每个item的宽度
let kShareCancelButtonHeight:CGFloat = 49.0 // 取消按钮的高度
let kShareTitleHeight:CGFloat = 30 //
let kShareTitlePadding:CGFloat = 20 //
let kShareItemCellPadding:CGFloat = 14.0    // item之间的距离
let kShareAnimateDuration = 0.3     // 动画时间
let kShareDimBackgroundAlpha = 0.3     // 半透明背景的alpha值
let kShareHideNotification = "kShareHideNotification"

/**
 *  取消按钮代理
 */
protocol ALShareSheetViewDelegate: class {
    /**
     取消按钮
     */
    func cancel()

}
class ALShareSheetView: UIToolbar {


    weak var sheetViewDelegate: ALShareSheetViewDelegate?






    /** 顶部标题Label, 默认内容为"分享" */
    let titleLabel:UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.darkGray
        tempLabel.textAlignment = .center
        tempLabel.text = "分享"
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        return tempLabel

    }()
    /** 底部取消Button, 默认标题为"取消" */
    let cancelButton:UIButton = {

        let tempButton = UIButton()
        tempButton.backgroundColor = UIColor.white
        tempButton.setTitle("取消", for: .normal)
        tempButton.setTitleColor(UIColor.darkText, for: .normal)
        tempButton.addTarget(self, action: .cancelButtonClick, for: .touchUpInside)
        return tempButton
    }()

    lazy var tableView: UITableView = {
        let tempTableView = UITableView(frame: CGRect.zero, style: .plain)
        tempTableView.rowHeight = 123
        tempTableView.dataSource = self
        tempTableView.delegate = self
        tempTableView.backgroundColor = UIColor.clear
        tempTableView.bounces = false
        tempTableView.register(ALShareSheetCell.self, forCellReuseIdentifier: kCellIdentifier_ALShareSheetCell)
        return tempTableView
    }()







    var dataArray:[[ALShareItem]] = Array<Array<ALShareItem>>() {
        didSet {
            self.tableView.reloadData()
        }

    }



    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
        self.addSubview(self.cancelButton)
    }


    override func layoutSubviews() {
        super.layoutSubviews()

        var  frame = self.frame
        frame.size.height = shareSheetHeight()
        self.frame = frame
        // 标题
        self.titleLabel.frame = CGRect(x: kShareTitlePadding, y: 0, width: UIScreen.main.bounds.size.width - 2 * kShareTitlePadding, height: self.titleHeight())
        // 取消按钮
        self.cancelButton.frame = CGRect(x: 0, y: self.bounds.size.height - kShareCancelButtonHeight, width: UIScreen.main.bounds.size.width, height: kShareCancelButtonHeight)
        // TableView
        self.tableView.frame = CGRect(x: 0, y: self.titleHeight(), width: UIScreen.main.bounds.size.width, height: CGFloat(self.dataArray.count) * kShareItemCellHeight)


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }






    func shareSheetHeight() -> CGFloat {

        return self.initialHeight() + CGFloat(self.dataArray.count) * kShareItemCellHeight - 1 // 这个-1用来让取消button挡住下面cell的seperator
    }
    func initialHeight() -> CGFloat {

        return kShareCancelButtonHeight + self.titleHeight()
    }


    func titleHeight() -> CGFloat {
        return (self.titleLabel.text?.characters.count )! > 0  ? kShareTitleHeight : CGFloat(0)
    }


    func cancelButtonClick(_ send:UIButton)  {

        if let sheetViewDelegate = self.sheetViewDelegate {
            sheetViewDelegate.cancel()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension ALShareSheetView:UITableViewDataSource,UITableViewDelegate {



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ALShareSheetCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier_ALShareSheetCell, for: indexPath) as! ALShareSheetCell
            cell.itemArray = self.dataArray[indexPath.row]
        return cell

    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
    }
    
    
    
    
    
    
    
}

