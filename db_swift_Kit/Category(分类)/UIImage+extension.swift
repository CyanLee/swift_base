//
//  UIImage+extension.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/14.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 根据颜色生成一张纯色的图片
    ///
    /// - Parameter color: 指定的颜色
    /// - Returns: 纯色图片
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
}
