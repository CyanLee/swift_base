//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    struct collectionHelperKeys {
        static var helper: Void?
    }
    
    var collectionHelper: CollectionHelper? {
        get {
            return (objc_getAssociatedObject(self, &collectionHelperKeys.helper) as? CollectionHelper)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &collectionHelperKeys.helper, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// 建立CollectionHelper与collection之间的桥梁
    /// - layout:   UICollectionViewFlowLayout
    /// - Returns:  CollectionHelper本身
    func makeConfigureHelper(layout: UICollectionViewFlowLayout) -> CollectionHelper {
        let helper = CollectionHelper.init(collecView: self, layout: layout)
        self.collectionHelper = helper
        return self.collectionHelper!
    }
    
    /// 初始化 collectionView
    ///
    /// - Parameters:
    ///   - frame: 位置
    ///   - delegate: 代理
    ///   - setScrollDirection: 滑动方向
    ///   - itemSize: cell大小
    ///   - minimumInteritemSpacing: 水平方向的空隙
    ///   - minimumLineSpacing: 垂直方向的空隙
    ///   - layoutSectionInset: 上下左右的距离
    /// - Returns: collectionView
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
    convenience init(frame: CGRect, delegate: Any?, setScrollDirection:UICollectionView.ScrollDirection, itemSize:CGSize, minimumInteritemSpacing:CGFloat, minimumLineSpacing:CGFloat, layoutSectionInset:UIEdgeInsets) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionInset = layoutSectionInset
        layout.scrollDirection = setScrollDirection
        self.init(frame: frame, collectionViewLayout: layout)
        self.delegate = delegate as? UICollectionViewDelegate
        self.dataSource = delegate as? UICollectionViewDataSource
        self.backgroundColor = UIColor.white
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }

    
    /// 初始化 collectionView(带headerView 或 footerView)
    ///
    /// - Parameters:
    ///   - frame: 位置
    ///   - delegate: 代理
    ///   - setScrollDirection: 滑动方向
    ///   - itemSize: cell大小
    ///   - minimumInteritemSpacing: 水平方向的空隙
    ///   - minimumLineSpacing: 垂直方向的空隙
    ///   - layoutSectionInset: 上下左右的距离
    ///   - layoutHeaderReferenceSize: headerView的大小
    ///   - layoutFooterReferenceSize: footerView的大小
    /// - Returns: collectionView
    convenience init(frame: CGRect, delegate: Any?, setScrollDirection:UICollectionView.ScrollDirection, itemSize:CGSize, minimumInteritemSpacing:CGFloat, minimumLineSpacing:CGFloat, layoutSectionInset:UIEdgeInsets, layoutHeaderReferenceSize:CGSize, layoutFooterReferenceSize:CGSize) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionInset = layoutSectionInset
        layout.scrollDirection = setScrollDirection
        layout.headerReferenceSize = layoutHeaderReferenceSize
        layout.footerReferenceSize = layoutFooterReferenceSize
        self.init(frame: frame, collectionViewLayout: layout)
        self.delegate = delegate as? UICollectionViewDelegate
        self.dataSource = delegate as? UICollectionViewDataSource
        self.backgroundColor = UIColor.white
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
}
