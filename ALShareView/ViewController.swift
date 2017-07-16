//
//  ViewController.swift
//  ALShareView
//
//  Created by N年後 on 2017/7/16.
//  Copyright © 2017年 lifp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAction(_ sender: Any) {


        let wx_friend = ALShareItem(title: "微信好友", icon: "topic_share_wx_friend_normal_60x60_")
        wx_friend.handler  = {() -> Void in

        }

        let wx_session = ALShareItem(title: "朋友圈", icon: "topic_share_wx_session_normal_60x60_")
        wx_session.handler  = {() -> Void in


        }

        let picture = ALShareItem(title: "生成长图", icon: "topic_create_picture_icon_normal_60x60_")
        picture.handler  = {() -> Void in
            // 滚动截取TextView的内容
  
        }



        let shareItemsArray = [wx_friend,wx_session,picture]
        let shareView = ALShareView(frame: CGRect.zero, shareArray: shareItemsArray, functionArray: [])
        shareView.show()


        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

