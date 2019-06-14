//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UIImageView {
    /// 创建UIImageView
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - cornerRadius: 圆度
    ///   - frame: 位置
    /// - Returns: UIImageView
    convenience init(imageName: String, cornerRadius: CGFloat, frame: CGRect) {
        self.init()
        self.frame = frame
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFill
        if cornerRadius > 0 {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
}
