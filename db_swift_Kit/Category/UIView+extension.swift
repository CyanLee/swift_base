//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UIView {
    
    
    /// xib实例化圆角
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// xib实例化边框宽度
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue > 0 ? newValue : 0
        }
    }
    
    /// xib实例化边框颜色
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
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
    
    
    /// 获取当前的的控制器
    ///
    /// - Returns: 当前控制器
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
