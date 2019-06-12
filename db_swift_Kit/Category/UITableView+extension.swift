//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    var tableViewHelper: TableViewHelper? {
        set {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "key".hashValue)
            objc_setAssociatedObject(self, key, newValue as AnyObject , .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }

        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "key".hashValue)
            let obj: TableViewHelper? = objc_getAssociatedObject(self, key) as? TableViewHelper
            return obj
        }
    }
    
    
    /// 创建UITableView
    ///
    /// - Parameters:
    ///   - frame: 位置
    ///   - style: 表格风格
    ///   - separatorStyle: 去掉cell间的白线
    ///   - delegate: 代理
    /// - Returns: tableView    
    convenience init(frame: CGRect, style:UITableView.Style, separatorStyle:CGFloat,delegate:Any?) {
        self.init(frame: frame, style: style)
        self.backgroundColor = UIColor.white
        self.delegate = delegate as? UITableViewDelegate
        self.dataSource = delegate as? UITableViewDataSource
        self.separatorStyle = UITableViewCell.SeparatorStyle(rawValue: Int(separatorStyle))!
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.tableFooterView = UIView()
    }
    
    func makeConfigureHelper() -> TableViewHelper {
        let helper = TableViewHelper.init(tableV: self)
        self.tableViewHelper = helper
        return self.tableViewHelper!
    }
//
//    func backg() -> TableViewHelper? {
//        return objc_getAssociatedObject(self, "kBackgroundViewKey") as? TableViewHelper
//    }
//
//    // 这里的UIView可以是可选类型，也可以不是可选类型
//    func setBackg(backgroundView:TableViewHelper?)
//    {
//        objc_setAssociatedObject(self, "kBackgroundViewKey", backgroundView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
    
}
