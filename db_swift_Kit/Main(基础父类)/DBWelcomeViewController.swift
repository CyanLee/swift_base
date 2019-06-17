//
//  DBWelcomeViewController.swift
//  db_swift_Kit
//
//  Created by 管家人 on 2019/6/14.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

public enum DataType: String {
    case gif    = "gif"
    case png    = "png"
    case jpeg   = "jpeg"
    case tiff   = "tiff"
    case defaultType
}

class DBWelcomeViewController: DBBaseViewController {

    
    /// 图片名字数组 或者 url数组
    private var gifNames: Array<Any>?
    /// 播放速度
    private var gifTime: Double?
    
    /// 是否是网络请求的
    private var isurl: Bool = false
    
    /// 创建一个滚动视图
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView.init(frame: self.view.bounds)
        view.backgroundColor = UIColor.clear
        view.bounces = false
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        self.view.addSubview(view)
        return view
    }()
    
    
    /// 初始化
    ///
    /// - Parameter imgNames: 图片名字数组 或者 url数组
    /// - Parameter isurl: 是否是网络图片 或者是 本地图片
    ///   init(names:Array<String>,isurl type:Bool = false)
    ///   这种写法有点强,就是第二个值可以不传,默认为false,就等于写了另一个init方法 init(names:Array<String>)
    public convenience init(names:Array<String>,isurl type:Bool = false) {
        self.init()
        scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width * CGFloat(names.count), height: UIScreen.main.bounds.height)
        setupImgView(names: names,isurl: type)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    /// 创建imgV
    ///
    /// - Parameter names: 图片名字数组 或者 url数组
    /// - Parameter isurl: 是否是网络图片 或者是 本地图片
    func setupImgView(names:Array<String>,isurl:Bool) {
        for index in 0..<names.count {
            let imgV = UIImageView.init(frame: CGRect(x: (CGFloat(index) * UIScreen.main.bounds.size.width), y: 0.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
            /// 如果是网络图片
            if isurl {
                let url = URL(string: names[index])
                do {
                    let data = try Data(contentsOf: url!)
                    imgV.db_startGifWithData(data: data as NSData)
//                    let image = UIImage(data: data)
//                    imgV.image = image;
                }catch let error as NSError {
                    print(error)
                }
            }else{
                /// 静态和gif都是调这个方法
                imgV.db_startGifWithImageName(name: names[index])
            }
            scrollView.addSubview(imgV)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
