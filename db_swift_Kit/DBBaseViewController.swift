//
//  DBBaseViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/6.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

//反向传值代理
protocol DBPopDataDelegate:NSObjectProtocol {
    //反向传值实现方法
    func obtainPopData() -> Any?
}

class DBBaseViewController: UIViewController {

    //正向传值带过去的数据
    var pushDat : Any? = nil
    //反向传值闭包
    var popDataBlock:((_ popData:Any?) -> Void)?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// 返回到指定的同级界面(同一个tabbar)
    ///
    /// - Parameter specifiedVc: 指定控制器的名字
    func popViewControllerSpecified(specifiedVc:String) {
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        print("当前工程名字"+clsName!)
        //第二步:拼接参数字符串 项目名+.+需要加载的类的名称
        let c = NSClassFromString(clsName! + "." + specifiedVc) as! DBBaseViewController.Type
        print(c)
        //初始化控制器
        let vc = c.init()
        //type(of: vc)  == [vc Class]
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: type(of: vc)) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    
    /// 返回到tabbar首页
    ///
    /// - Parameters:
    ///   - currentVC: 当前控制器
    ///   - tabbarIndex: 跳转到第几个tabbar
    func popMainTabbar(currentVC:UIViewController,tabbarIndex:Int){
        let controller = UIApplication.shared.delegate?.window!?.rootViewController
        let bar = controller as! UITabBarController
        bar.selectedIndex = tabbarIndex
        currentVC.navigationController?.popToRootViewController(animated: true)
    }
    
    
    /// push到新的控制器
    ///
    /// - Parameters:
    ///   - className: 目标控制器名字
    ///   - data: 正向传值带的参数
    func pushClass(className:String,data: Any?) {
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        print("当前工程名字"+clsName!)
        //第二步:拼接参数字符串 项目名+.+需要加载的类的名称
        let c = NSClassFromString(clsName! + "." + className) as! DBBaseViewController.Type
        //初始化控制器
        let vc = c.init()
        print(vc)
        vc.pushDat = data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /// present到新界面
    ///
    /// - Parameters:
    ///   - className: 目标控制器名字
    ///   - data: 正向传值带的参数
    func presentClassName(className:String,data: Any?) {
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        print("当前工程名字"+clsName!)
        //第二步:拼接参数字符串 项目名+.+需要加载的类的名称
        let c = NSClassFromString(clsName! + "." + className) as! DBBaseViewController.Type
        //初始化控制器
        let vc = c.init()
        print(vc)
        vc.pushDat = data
        present(vc, animated: true, completion: nil)
    }
    
    
    /// 返回上一个界面
    /// 重写popViewController
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    
    /// 关闭导航界面
    /// 重写dismiss
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    
    /// 获取当前版本号
    ///
    /// - Returns: app当前版本号
    func getAppVersion() -> String {
        let dic = Bundle.main.infoDictionary
        let appVersion = dic?["CFBundleShortVersionString"]
        return appVersion as! String
    }
    
    
    /// 获取设备信息
    func equipmentInfo() {
        //设备信息
        let iosVersion = UIDevice.current.systemVersion //iOS版本
        let identifierNumber = UIDevice.current.identifierForVendor //设备udid
        let systemName = UIDevice.current.systemName //设备名称
        let model = UIDevice.current.model //设备型号
        let modelName = UIDevice.current.name //设备具体型号
        let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
        print("iOS版本：\(iosVersion)")
        print("设备udid：\(String(describing: identifierNumber))")
        print("设备名称：\(systemName)")
        print("设备型号：\(model)")
        print("设备具体型号：\(modelName)")
        print("设备区域化型号：\(localizedModel)")
    }
    
    
    /// 修改状态栏颜色
    ///
    /// - Parameter type: 1:为白色 0:黑色
    func setStatusBarStyleType(type: Int) {
        if 0 == type {
            self.navigationController?.navigationBar.barStyle = .default
        }else{
            self.navigationController?.navigationBar.barStyle = .black
        }
    }
    
}
