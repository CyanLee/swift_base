//
//  CollectionHelper.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/25.
//  Copyright © 2019 cyan. All rights reserved.
//  collection的一个中间件,这里的思路是链式调用,最终目的是所用的东西都是外部传进来,不用写烦人的各种代理方法

import UIKit

class CollectionHelper: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    /// 创建一个CollectionView
    var collectionView: UICollectionView?
    /// 创建一个flowlayout
    var flowLayout = UICollectionViewFlowLayout()
    
    deinit {
        print("没有循环引用")
    }
    
    /// 重写初始化
    ///
    /// - Parameter collecView: collecView
    init(collecView: UICollectionView,layout: UICollectionViewFlowLayout) {
        super.init()
        collectionView = collecView
        flowLayout = layout
    }
    
    /// section个数的回调block(内部->外部)
    typealias DBSectionIndexNumBlock = (_ collectionView: UICollectionView) -> Int
    var db_SectionIndexNumBlock : DBSectionIndexNumBlock?
    
    /// row个数的回调block(内部->外部)
    typealias DBRowIndexNumBlock = (_ collectionView: UICollectionView , _ section: Int) -> Int
    var db_RowIndexNumBlock : DBRowIndexNumBlock?
    
    /// cell样式的回调block(内部->外部)
    typealias DBCellCallBlock = (_ collectionView: UICollectionView , _ indexPath: IndexPath) -> UICollectionViewCell
    var db_CellCellBlock : DBCellCallBlock?
    
    /// cell的点击事件
    typealias DBDidSelectRowAtBlock = (_ collectionView: UICollectionView , _ indexPath: IndexPath) -> Void
    var db_DidSelectRowAtBlock : DBDidSelectRowAtBlock?
    
    /// headerView样式的回调block(内部->外部)
    typealias DBHeaderCallBlock = (_ collectionView: UICollectionView , _ indexPath: IndexPath) -> UICollectionReusableView
    var db_HeaderCallBlock : DBHeaderCallBlock?
    
    /// footerView样式的回调block(内部->外部)
    typealias DBFooterCallBlock = (_ collectionView: UICollectionView , _ indexPath: IndexPath) -> UICollectionReusableView
    var db_FooterCallBlock : DBFooterCallBlock?
    
    /// section个数的回调block(外部->内部)
    ///
    /// - Parameter sectionIndexNumBlock: 分区个数的回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealSectionIndexNum(sectionIndexNumBlock: @escaping DBSectionIndexNumBlock) -> CollectionHelper {
        db_SectionIndexNumBlock = sectionIndexNumBlock
        return self
    }
    
    /// row个数的回调block(外部->内部)
    ///
    /// - Parameter sectionIndexNumBlock: row个数的回调block(内部->外部)
    /// - Returns: TableViewHelper
    func dealRowIndexNum(rowIndexNumBlock: @escaping DBRowIndexNumBlock) -> CollectionHelper {
        db_RowIndexNumBlock = rowIndexNumBlock
        return self
    }
    
    /// cell的u样式函数(外部->内部)
    ///
    /// - Parameter cellBlock: cell的回调block(内部->外部) 这里就是要调用这个block
    /// - Returns: TableViewHelper
    func dealCellCall(callCellBlock: @escaping DBCellCallBlock) -> CollectionHelper {
        db_CellCellBlock = callCellBlock
        return self
    }
    
    /// 点击事件
    ///
    /// - Parameter didSelectRowAtBlock:
    /// - Returns:
    func dealDidSelectRowAt(didSelectRowAtBlock: @escaping DBDidSelectRowAtBlock) -> CollectionHelper {
        db_DidSelectRowAtBlock = didSelectRowAtBlock
        return self
    }
    
    /// cell的大小
    func dealItemSize(itemSize:CGSize) -> CollectionHelper {
        flowLayout.itemSize = itemSize
        return self
    }
    
    /// 滑动方向 0:垂直 1:水平
    func deadScrollDirection(scrollDirection: Int) -> CollectionHelper {
        if scrollDirection == 0 {
            flowLayout.scrollDirection = .vertical
        }else{
            flowLayout.scrollDirection = .horizontal
        }
        return self
    }
    
    /// 水平方向的空隙
    func dealMinimumInteritemSpacing(minimumInteritemSpacing: CGFloat) -> CollectionHelper {
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    /// 垂直方向的空隙
    func dealMinimumLineSpacing(minimumLineSpacing: CGFloat) -> CollectionHelper {
        flowLayout.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    /// 上下左右的距离
    func dealLayoutSectionInset(layoutSectionInset: UIEdgeInsets) -> CollectionHelper {
        flowLayout.sectionInset = layoutSectionInset
        return self
    }
    
    /// headerView的大小
    func dealHeaderReferenceSize(headerReferenceSize: CGSize) -> CollectionHelper {
        flowLayout.headerReferenceSize = headerReferenceSize
        return self
    }
    
    /// footerView的大小
    func dealFooterReferenceSize(footerReferenceSize: CGSize) -> CollectionHelper {
        flowLayout.footerReferenceSize = footerReferenceSize
        return self
    }
    
    /// 写这个方法的原因 不想提示警告 所以写了一个不写返回值的方法
    func start() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.collectionViewLayout = flowLayout
    }

    /// 分区数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if db_SectionIndexNumBlock != nil {
            return db_SectionIndexNumBlock!(collectionView)
        }else{
            return 0
        }
    }

    /// row数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if db_RowIndexNumBlock != nil {
            return db_RowIndexNumBlock!(collectionView, section)
        }else{
            return 0
        }
    }

    /// cell样式
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if db_CellCellBlock != nil {
            return db_CellCellBlock!(collectionView,indexPath)
        }else{
            return UICollectionViewCell()
        }
    }
    
    /// 点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if db_DidSelectRowAtBlock != nil {
            db_DidSelectRowAtBlock!(collectionView,indexPath)
        }
    }
    
    /// 头部或尾部
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if db_HeaderCallBlock != nil {
                return db_HeaderCallBlock!(collectionView,indexPath)
            }else{
                return UICollectionReusableView()
            }
        }else{
            if db_FooterCallBlock != nil {
                return db_FooterCallBlock!(collectionView,indexPath)
            }else{
                return UICollectionReusableView()
            }
        }
    }
    
    
    
}
