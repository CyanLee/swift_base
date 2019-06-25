//
//  TableViewHelper.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/10.
//  Copyright © 2019 cyan. All rights reserved.
//  tableView的一个中间件,这里的思路是链式调用,最终目的是所用的东西都是外部传进来,不用写烦人的各种代理方法

import UIKit

class TableViewHelper: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    //创建一个tableView
    var tableView : UITableView? = nil
    
    /*
        这里是运用了block的传值和回调
        声明一个block是用来进行 内到外 的回调
        在声明一个方法进行 外到内 的传值
     */
    
    /// section个数的回调block(内部->外部)
    typealias DBSectionIndexNumBlock = (_ tableView: UITableView) -> Int
    var db_SectionIndexNumBlock : DBSectionIndexNumBlock?
    
    /// row个数的回调block(内部->外部)
    typealias DBRowIndexNumBlock = (_ tableView: UITableView , _ section: Int) -> Int
    var db_RowIndexNumBlock : DBRowIndexNumBlock?
    
    /// cell样式的回调block(内部->外部)
    typealias DBCellCallBlock = (_ tableView: UITableView , _ indexPath: IndexPath) -> UITableViewCell
    var db_CellCellBlock : DBCellCallBlock?
    
    /// cell的高度回调block(内部->外部)
    typealias DBHeightForRowAtBlock = (_ tableView: UITableView , _ indexPath: IndexPath) -> CGFloat
    var db_HeightForRowAtBlock : DBHeightForRowAtBlock?
    
    /// headerViewa样式回调block(内部->外部)
    typealias DBHeaderCallBlock = (_ tableView: UITableView , _ section: Int) -> UIView
    var db_HeaderCallBlock : DBHeaderCallBlock?
    
    /// headerViewa高度回调block(内部->外部)
    typealias DBHeaderHeightBlock = (_ tableView: UITableView , _ section: Int) -> CGFloat
    var db_HeaderHeightBlock : DBHeaderHeightBlock?
    
    /// footerViewa样式回调block(内部->外部)
    typealias DBFooterCallBlock = (_ tableView: UITableView , _ section: Int) -> UIView
    var db_FooterCallBlock : DBFooterCallBlock?
    
    /// footerViewa高度回调block(内部->外部)
    typealias DBFooterHeightBlock = (_ tableView: UITableView , _ section: Int) -> CGFloat
    var db_FooterHeightBlock : DBFooterHeightBlock?
    
    /// cell的点击事件
    typealias DBDidSelectRowAtBlock = (_ tableView:UITableView , _ indexPath: IndexPath) -> Void
    var db_DidSelectRowAtBlock : DBDidSelectRowAtBlock?
    
    
    deinit {
        print("没有循环引用")
    }
    
    init(tableV: UITableView) {
        super.init()
        tableView = tableV
    }
    
    /// section个数的回调block(外部->内部)
    ///
    /// - Parameter sectionIndexNumBlock: 分区个数的回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealSectionIndexNum(sectionIndexNumBlock: @escaping DBSectionIndexNumBlock) -> TableViewHelper {
        db_SectionIndexNumBlock = sectionIndexNumBlock
        return self
    }
    
    /// row个数的回调block(外部->内部)
    ///
    /// - Parameter sectionIndexNumBlock: row个数的回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealRowIndexNum(rowIndexNumBlock: @escaping DBRowIndexNumBlock) -> TableViewHelper {
        db_RowIndexNumBlock = rowIndexNumBlock
        return self
    }
    
    /// cell的u样式函数(外部->内部)
    ///
    /// - Parameter cellBlock: cell的回调block(内部->外部) 这里就是要调用这个block
    /// - Returns: TableViewHelper
    func dealCellCall(callCellBlock: @escaping DBCellCallBlock) -> TableViewHelper {
        db_CellCellBlock = callCellBlock
        return self
    }
    
    
    /// cell的高度回调block(外部->内部)
    ///
    /// - Parameter heightForRowAtBlock: cell的高度回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealHeightForRowAt(heightForRowAtBlock: @escaping DBHeightForRowAtBlock) -> TableViewHelper {
        db_HeightForRowAtBlock = heightForRowAtBlock
        return self
    }
    
    
    /// headerView样式回调blcok(外部->内部)
    ///
    /// - Parameter headerCallBlock: headerViewa样式回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealHeaderCall(headerCallBlock: @escaping DBHeaderCallBlock) -> TableViewHelper {
        db_HeaderCallBlock = headerCallBlock
        return self
    }
    
    /// headerView高度回调blcok(外部->内部)
    ///
    /// - Parameter headerHeightBlock: headerViewa高度回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealHeaderHeight(headerHeightBlock: @escaping DBHeaderHeightBlock) -> TableViewHelper {
        db_HeaderHeightBlock = headerHeightBlock
        return self
    }
    
    /// footerView样式回调blcok(外部->内部)
    ///
    /// - Parameter footerCallBlock: footerViewa样式回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealFooterCall(footerCallBlock: @escaping DBFooterCallBlock) -> TableViewHelper {
        db_FooterCallBlock = footerCallBlock
        return self
    }
    
    /// footerView高度回调blcok(外部->内部)
    ///
    /// - Parameter footerHeightBlock: footerViewa高度回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealFooterHeight(footerHeightBlock: @escaping DBFooterHeightBlock) -> TableViewHelper {
        db_FooterHeightBlock = footerHeightBlock
        return self
    }
    
    func dealDidSelectRowAt(didSelectRowAtBlock: @escaping DBDidSelectRowAtBlock) -> TableViewHelper {
        db_DidSelectRowAtBlock = didSelectRowAtBlock
        return self
    }
    
    /// 写这个方法的原因 不想提示警告 所以写了一个不写返回值的方法
    func start() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (db_SectionIndexNumBlock != nil) {
            return db_SectionIndexNumBlock!(tableView)
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db_RowIndexNumBlock!(tableView,section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return db_CellCellBlock!(tableView,indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (db_HeightForRowAtBlock != nil) {
            return db_HeightForRowAtBlock!(tableView,indexPath)
        }else{
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (db_HeaderCallBlock != nil) {
            return db_HeaderCallBlock!(tableView,section)
        }else{
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (db_HeaderHeightBlock != nil) {
            return db_HeaderHeightBlock!(tableView,section)
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (db_FooterCallBlock != nil) {
            return db_FooterCallBlock!(tableView,section)
        }else{
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (db_FooterHeightBlock != nil) {
            return db_FooterHeightBlock!(tableView,section)
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ((db_DidSelectRowAtBlock) != nil) {
            db_DidSelectRowAtBlock!(tableView,indexPath)
        }
    }
}
