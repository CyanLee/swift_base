//
//  DBTabBarController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/1.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class DBTabBarController: UITabBarController,UITabBarControllerDelegate,DBMiddleTabBarDelegate {
 
    //tabbar选中状态的枚举
    enum DBTabBarItemStatus {
        case DBTabBarItemStatusSelected //选中状态
        case DBTabBarItemStatusDefault  //默认状态
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    /// 初始化方法
    ///
    /// - Parameters:
    ///   - names: 控制器名称数组

    init(names:Array<String>) {
        super.init(nibName: nil, bundle: nil)
        delegate = self
        configChildControllerWithNames(names: names)
    }
    
    /// 初始化方法(带自定义tabar)
    ///
    /// - Parameters:
    ///   - names: 控制器名称数组
    ///   - fifth: 是否显示第五个tabbar(自定义大大的)
    ///   - fifthImgName: 第五个tabbar的图片
    init(names:Array<String>,fifth:Bool,fifthImgName:String) {
        super.init(nibName: nil, bundle: nil)
        delegate = self
        
        if fifth == true {
            let tab = DBMiddleTabBarView.init(frame: .zero)
            tab.imgName = fifthImgName
            tab.addDelegate = self
            self.setValue(tab, forKey: "tabBar")
        }
        
        configChildControllerWithNames(names: names)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //根据名字初始化子视图控制器
    private func configChildControllerWithNames(names:Array<String>) {
        setViewControllers(navigationControllersWithStr(staArr: names) as? [UIViewController], animated: true)
    }
    
    private func navigationControllersWithStr(staArr:Array<String>) -> Array<Any> {
        //Any:全部类型
        var naviVCArr = [DBNavigationController]()
        for name in staArr {
            //第一步:获取项目名称
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
            print("当前工程名字"+clsName!)
            //第二步:拼接参数字符串 项目名+.+需要加载的类的名称
            let c = NSClassFromString(clsName! + "." + name) as! UIViewController.Type
            print(c)
            //初始化控制器
            let vc = c.init()
            let naviVC = DBNavigationController(rootViewController: vc).setuptitleColorAndBarTintColor(titleColor: 0xffffff,barTintColor: 0xFFDD01)
            //把生成的navi放进数组
            naviVCArr.append(naviVC)
//            naviVC.setViewControllers(<#T##viewControllers: [UIViewController]##[UIViewController]#>, animated: <#T##Bool#>)

        }
        return naviVCArr
    }
        
    //标签标题
    func setupItemTitles(titles:Array<String>) -> DBTabBarController {
        //index:下标 value:viewControllers遍历出来的控制器
        for (index,value) in (viewControllers?.enumerated())! {
            value.tabBarItem.title = titles[index];
        }
        return self
    }
    
    //单独设置不同颜色的标签颜色
    
    
    //标签标题默认颜色
    func setupItemsTitleDefaultColor(color:Int) -> DBTabBarController {
        for value in viewControllers! {
            value.tabBarItem .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kRGBColorFromHex(rgbValue: color)], for: .normal)
        }
        return self
    }
    
    //标签标题高亮颜色
    func setupItemsTitleSelectedColor(color:Int) -> DBTabBarController {
        for value in viewControllers! {
            value.tabBarItem .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kRGBColorFromHex(rgbValue: color)], for: .selected)
        }
        return self
    }
    
    //设置选中图片
    func setUpSelectImages(images:Array<String>) -> DBTabBarController {
        for (index,value) in (viewControllers?.enumerated())! {
            value.tabBarItem.selectedImage = UIImage(named: images[index])?.withRenderingMode(.alwaysOriginal)
        }
        return self
    }
    
    //设置未选中图片
    func setUpUnSelectImages(images:Array<String>) -> DBTabBarController {
        for (index,value) in (viewControllers?.enumerated())! {
            value.tabBarItem.image = UIImage(named: images[index])?.withRenderingMode(.alwaysOriginal)
        }
        return self
    }
    
    //去除tabbar顶部黑线(没有测试)
    func removeTabbarTopBlackLine() {
        //方法1
        UITabBar.appearance().clipsToBounds = true
        //方法2
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().clipsToBounds = true
        UITabBar.appearance().backgroundImage = UIImage(named: "")!.withRenderingMode(.alwaysOriginal)
        UITabBar.appearance().shadowImage = UIImage(named: "")!.withRenderingMode(.alwaysOriginal)
    }

    //点解tabbar的响应事件
    internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //当前被点解的控制器
        let navVC = viewController as? DBNavigationController
        let vc = navVC?.viewControllers.first
//        上一个控制器
//        let navSelectVC = tabBarController.selectedViewController as? DBNavigationController
//        let selectdVC = navSelectVC?.viewControllers.first
        print(vc ?? "")
//        print(selectdVC ?? "")
        return true
    }
    
    //暂不知道什么用
    private func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) -> Bool {
        print("fuck");
        return true
    }
    
    
    func addClick() {
        print("我是中间")
    }
    
//    //把十六进制的颜色转为Color(暂时放这)
//    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
//        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
//                       green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
//                       blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
//                       alpha: 1.0)
//    }
    
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
