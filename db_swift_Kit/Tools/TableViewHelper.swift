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
    
    //
    typealias WMZCellCallBlock = (_ indexPath: IndexPath , _ tableView: UITableView) -> UITableViewCell
    var db_cellBlock : WMZCellCallBlock?
    
//    let dealCell = { (cellBlock: WMZCellCallBlock) -> TableViewHelper in
//        return
//    }
    
    func dealCell(cellBlock: @escaping WMZCellCallBlock) -> TableViewHelper {
        db_cellBlock = cellBlock
        return self
    }
    
    
    
    init(tableV: UITableView) {
        super.init()
        tableV.delegate = self
        tableV.dataSource = self
        tableView = tableV
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return db_cellBlock!(indexPath,tableView)
    }
    
    
}
