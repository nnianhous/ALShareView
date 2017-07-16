//
//  ALShareView.swift
//  Fox
//
//  Created by N年後 on 2017/4/24.
//  Copyright © 2017年 TRZX. All rights reserved.
//

import UIKit
private extension Selector {
    static let hide = #selector(ALShareView.hide)

}

public class ALShareView: UIView,ALShareSheetViewDelegate{


    /**< 半透明黑色背景 */
    var dimBackgroundView:UIView = {
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        bgView.backgroundColor = UIColor.black
        bgView.alpha = 0
        bgView.isUserInteractionEnabled = true

        return bgView
    }()


    /**< 分享面板 */
    var shareSheetView:ALShareSheetView = {

        let tempView = ALShareSheetView()
        tempView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height:tempView.initialHeight())
        return tempView

    }()



    /** 顶部标题Label, 默认内容为"分享" */
    var titleLabel:UILabel?

    /** 底部取消Button, 默认标题为"取消" */
    var cancelButton:UIButton?



    var shareArray = Array<ALShareItem>()
    var functionArray = Array<ALShareItem>()



     public init(frame: CGRect,shareArray:Array<ALShareItem>,functionArray:Array<ALShareItem>) {
        super.init(frame: frame)


        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.titleLabel = self.shareSheetView.titleLabel
        self.cancelButton = self.shareSheetView.cancelButton


        self.shareArray = shareArray
        self.functionArray = functionArray


        self.shareSheetView.dataArray.append(shareArray)
        if functionArray.count>0 {
            self.shareSheetView.dataArray.append(functionArray)
        }

        let tap = UITapGestureRecognizer(target: self, action: .hide)
        dimBackgroundView.addGestureRecognizer(tap)


        shareSheetView.sheetViewDelegate = self

        NotificationCenter.default.addObserver(self, selector: .hide, name: NSNotification.Name(rawValue: kShareHideNotification), object: nil)

    }




    /**
     *  显示\隐藏
     */
    public func show() {
        self.addToKeyWindow()
        self.showAnimationWithCompletion { (finished) in

        }

    }

    public func hide() {
        self.hideAnimationWithCompletion { (finished) in
            self.removeFromKeyWindow()
        }
    }


    /**
     取消按钮
     */
    func cancel(){
        self.hide()

    }


    override public func layoutSubviews() {
        super.layoutSubviews()

    }



    // MARK - private method

    func addToKeyWindow() {
        if !(self.superview != nil) {
            let keyWindow = UIApplication.shared.keyWindow
            keyWindow?.addSubview(self)
            self.addSubview(self.dimBackgroundView)
            self.addSubview(self.shareSheetView)
        }
    }


    func removeFromKeyWindow() {

        if (self.superview != nil) {
            self.removeFromSuperview()
        }
    }


    func showAnimationWithCompletion(completion:@escaping ((_ finished:Bool) -> Void))  {


        UIView.animate(withDuration: kShareAnimateDuration, animations: {
            self.dimBackgroundView.alpha = CGFloat(kShareDimBackgroundAlpha)
            var frame = self.shareSheetView.frame
            frame.origin.y = UIScreen.main.bounds.size.height - self.shareSheetView.shareSheetHeight()
            self.shareSheetView.frame = frame


        }, completion: completion)

    }


    func hideAnimationWithCompletion(completion:@escaping ((_ finished:Bool) -> Void))  {

        UIView.animate(withDuration: kShareAnimateDuration, animations: {

            self.dimBackgroundView.alpha = 0;
            var frame = self.shareSheetView.frame
            frame.origin.y = UIScreen.main.bounds.size.height
            self.shareSheetView.frame = frame

        }, completion: completion)
        
    }



    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }




    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
