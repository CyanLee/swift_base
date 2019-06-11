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
    //创建
    
//    1 //定义闭包类型 (就是一个函数类型)
//    2 typealias MyClosureType = (Int, Int) -> Int
//    3 var myCloure:MyClosureType?
//    typedef UITableViewCell* (^WMZCellCallBlock)(NSIndexPath *indexPath,UITableView* tableView,id model);
    
    //    let dealCell = { (cellBlock: WMZCellCallBlock) -> TableViewHelper in
    //        return
    //    }
    
    
    /*
        这里是运用了block的传值和回调
        声明一个block是用来进行 内到外 的回调
        在声明一个方法进行 外到内 的传值
     */
    
    /// cell样式的回调block(内部->外部)
    typealias DBCellCallBlock = (_ indexPath: IndexPath , _ tableView: UITableView) -> UITableViewCell
    var db_CellCellBlock : DBCellCallBlock?
    
    /// row个数的回调block(内部->外部)
    typealias DBRowIndexNumBlock = (_ section: Int) -> Int
    var db_RowIndexNumBlock : DBRowIndexNumBlock?
    

    /// cell的传值函数(外部->内部)
    ///
    /// - Parameter cellBlock: cell的回调block(内部->外部) 这里就是要调用这个block
    /// - Returns: TableViewHelper
    func dealCellCall(callCellBlock: @escaping DBCellCallBlock) -> TableViewHelper {
        db_CellCellBlock = callCellBlock
        return self
    }
    
    
    /// row个数的回调block(内部->外部)
    ///
    /// - Parameter sectionIndexNumBlock: 分区个数的回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealRowIndexNum(rowIndexNumBlock: @escaping DBRowIndexNumBlock) -> TableViewHelper {
        db_RowIndexNumBlock = rowIndexNumBlock
        return self
    }
    
    
    init(tableV: UITableView) {
        super.init()
        tableV.delegate = self
        tableV.dataSource = self
        tableView = tableV
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(db_RowIndexNumBlock!(section))
        return db_RowIndexNumBlock!(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return db_CellCellBlock!(indexPath,tableView)
    }
    
    
}
