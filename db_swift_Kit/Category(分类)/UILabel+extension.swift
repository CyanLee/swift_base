//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// 创建UILabel
    ///
    /// - Parameters:
    ///   - title: 文字内容
    ///   - textColor: 文字颜色
    ///   - fontSize: 字体大小
    ///   - frame: 位置
    /// - Returns: UILabel    
    convenience init(title: String, textColor: Int, font: UIFont, frame: CGRect) {
        self.init()
        self.text = title
        self.textColor = kRGBColorFromHex(rgbValue: textColor)
        self.font = font
        self.frame = frame
    }
}
