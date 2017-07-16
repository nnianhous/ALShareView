//
//  ALShareItem.swift
//  Fox
//
//  Created by N年後 on 2017/4/24.
//  Copyright © 2017年 TRZX. All rights reserved.
//

import UIKit


typealias Handler = () -> Void

class ALShareItem: NSObject {

    var icon: String? /**< 图标名称 */
    var title: String? /**< 标题 */
    var handler:Handler?

    init(title:String,icon:String) {
        self.title = title
        self.icon = icon
    }
}
