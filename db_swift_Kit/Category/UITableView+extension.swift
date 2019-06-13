//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

/// 暂时不知道这个key有什么用,也不知道为啥写外面
//private var key: Void?

extension UITableView {
    
    /// 使用 私 结构体 并设置静态变量属性 作为存储  private var key: Void?这种方法也行
    struct tableViewHelperKeys {
        static var helper: Void?
    }
    
    /// 通过runtime添加一个存储属性
    /// TableViewHelper这个鬼就是tabbleView的一个中间件 所有tableView代理的相关方法都是经他的手
    var tableViewHelper: TableViewHelper? {
        get {
            return (objc_getAssociatedObject(self, &tableViewHelperKeys.helper) as? TableViewHelper)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tableViewHelperKeys.helper, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
    
    
    /// 建立TableViewHelper与tableView之间的桥梁
    ///
    /// - Returns:  TableViewHelper本身
    func makeConfigureHelper() -> TableViewHelper {
        let helper = TableViewHelper.init(tableV: self)
        self.tableViewHelper = helper
        return self.tableViewHelper!
    }
    
    
}
