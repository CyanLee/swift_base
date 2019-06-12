//
//  Const.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/14.
//  Copyright © 2019 今日. All rights reserved.
//


import UIKit

/// 屏幕的宽
let SW = UIScreen.main.bounds.size.width

/// 屏幕的高
let SH = UIScreen.main.bounds.size.height


/// 宽的比例
///
/// - Parameter width: 控件的宽度
/// - Returns: 计算比例后的宽度
func propW(width: CGFloat) -> CGFloat {
    return (width / 375.0) * SW
}

/// 高的比例
///
/// - Parameter height: 控件的高度
/// - Returns: 计算比例后的高度
func propH(height: CGFloat) -> CGFloat {
    return (height / 667.0) * SH
}

/// 主色调
///
/// - Returns: <#return value description#>
func mainColor() -> UIColor {
    return kRGBColorFromHex(rgbValue: 0xFFDD01)
}


/// 文字主色
///
/// - Returns: <#return value description#>
func titleMainColor() -> UIColor {
    return kRGBColorFromHex(rgbValue: 0x333333)
}


/// 文字次色
///
/// - Returns: <#return value description#>
func titleEdgeColor() -> UIColor {
    return kRGBColorFromHex(rgbValue: 0xCECECE)
}

///  kRGBColorFromHex(0x1D1D26)
///
/// - Parameter rgbValue: 色值
/// - Returns: UIColor
func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                   alpha: 1.0)
}


/// 判断是否为iphoneX
///
/// - Returns: 是或不是
func isX() -> Bool {
    if UIScreen.main.bounds.height == 812 {
        return true
    }
    return false
}


/// 获取导航栏高度
///
/// - Returns: CGFloat
func knaviH() -> CGFloat {
    if isX() {
        return 88
    }
    return 64
}


