//
//  EquipmentInfoTools.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/10.
//  Copyright © 2019 cyan. All rights reserved.
//  设备信息,在当前类中你可以获得当前设备的一些基本信息
//  当前app的信息

import UIKit

class EquipmentInfoTools: NSObject {
    
    /// 获取当前版本号
    ///
    /// - Returns: app当前版本号
    func getAppVersion() -> String {
        let dic = Bundle.main.infoDictionary
        let appVersion = dic?["CFBundleShortVersionString"]
        return appVersion as! String
    }
    
    /// iOS系统版本号
    ///
    /// - Returns: iOS系统版本号
    func getEquipmentVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// 获取设备的udid
    ///
    /// - Returns: udid
    func getEquipmentUDID() -> String {
        return (String(describing: UIDevice.current.identifierForVendor))
    }
    
    /// 获取设备名称
    ///
    /// - Returns:
    func getEquipmentSystemName() -> String {
        return UIDevice.current.systemName
    }
    
    /// 获取设备型号
    ///
    /// - Returns: 设备型号
    func getEquipmentModel() -> String {
        return UIDevice.current.model
    }
    
    /// 获取设备具体型号
    ///
    /// - Returns: 设备具体型号
    func getEquipmentModelName() -> String {
        return UIDevice.current.name
    }
    
    /// 获取设备区域化型号
    /// 如A1533
    /// - Returns: 设备区域化型号
    func getEquipmentLocalizedModel() -> String {
        return UIDevice.current.localizedModel
    }
    
}
