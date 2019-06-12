//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 创建UIView
    ///
    /// - Parameters:
    ///   - frame: 位置
    ///   - bgColor: 背景颜色
    /// - Returns: view    
    convenience init(frame: CGRect, bgColor: Int) {
        self.init()
        self.frame = frame
        self.backgroundColor = kRGBColorFromHex(rgbValue: bgColor)
    }
    
    func viewController()->UIViewController? {

        var nextResponder: UIResponder? = self

        repeat {
            nextResponder = nextResponder?.next

            if let viewController = nextResponder as? UIViewController {
                return viewController
            }

        } while nextResponder != nil

        return nil
    }
    
}
