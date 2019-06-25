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
    
    deinit {
        print("没有循环引用")
    }
    
    /// 重写初始化
    ///
    /// - Parameter collecView: collecView
    init(collecView: UICollectionView) {
        super.init()
        collectionView = collecView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    

}
