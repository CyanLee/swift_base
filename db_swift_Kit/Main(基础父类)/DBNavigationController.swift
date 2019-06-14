//
//  DBNavigationController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/2.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class DBNavigationController: UINavigationController {
    
    //返回按钮的图片
    var backImgName = ""
    //初始化全局UINavigationBar
    let navBar = UINavigationBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let navBar = UINavigationBar.appearance()
//        navBar.barTintColor = UIColor.red
        navBar.isTranslucent = false
//        navBar.tintColor = UIColor.black
        navBar.shadowImage = UIImage()
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        // Do any additional setup after loading the view.
    }
    
    //设置标题的颜色 导航的颜色
    func setuptitleColorAndBarTintColor(titleColor:Int,barTintColor:Int) -> DBNavigationController {
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:kRGBColorFromHex(rgbValue: titleColor)]
        navBar.barTintColor = kRGBColorFromHex(rgbValue: barTintColor)
        return self
    }
    
    //是否隐藏导航下面的下划线
    func setupHiddenLine(isHidden: Bool) -> DBNavigationController {
        navBar.shadowImage = UIImage()
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        return self
    }
    
    //设置返回按钮图片
    func setupBackImageName(imageName: String) -> DBNavigationController {
        backImgName = imageName
        return self
    }
    
    //设置tintColor颜色
    func setupTintColorColor(tintColor: Int) -> DBNavigationController {
        navBar.tintColor = kRGBColorFromHex(rgbValue: tintColor)
        return self
    }
    
    //设置标题字体大小
    func setupFontSize(fontSize: CGFloat) -> DBNavigationController {
        navBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)]
        return self
    }
    
    //设置导航栏的图片
    func setupNaviBackground(imgName: String) -> DBNavigationController {
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.barTintColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(named: imgName), for: .default)
        if #available(iOS 9.0, *) {
            navigationController?.navigationBar.subviews[0].subviews[0].isHidden = true;
        } else {
            navigationController?.navigationBar.subviews[0].subviews[1].isHidden = true;
        }
        return self
    }
    
    
    /**
     * 统一所有控制器导航栏左上角的返回按钮
     * 让所有push进来的控制器，它的导航栏左上角的内容都一样
     * 能拦截所有的push操作
     - viewController : 需要压栈的控制器
     - animated :       是否动画
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //这时push进来的控制器viewController,不是第一个子控制器(不是根控制器)
        if viewControllers.count > 0 {
            //push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: backImgName), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    //返回按钮
    @objc func navigationBackClick() {
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    } 

//    //把十六进制的颜色转为Color(暂时放这)
//    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
//        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
//                       green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
//                       blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
//                       alpha: 1.0)
//    }
    
}
