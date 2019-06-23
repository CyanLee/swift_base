//
//  UILabel+extension.swift
//  zxjSwift
//
//  Created by 今日 on 2019/3/16.
//  Copyright © 2019 今日. All rights reserved.
//

import UIKit

extension UIImageView {
    /// 创建UIImageView
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - cornerRadius: 圆度
    ///   - frame: 位置
    /// - Returns: UIImageView
    convenience init(imageName: String, cornerRadius: CGFloat, frame: CGRect) {
        self.init()
        self.frame = frame
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFill
        if cornerRadius > 0 {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    ////////////////////////////////////////////////////////    gif播放   ////////////////////////////////////////////////////////
    /// 本地的(不管是图片还是gif动图)获取对应的路径,利于转成data
    /// 如果没有则是资源包里的图片,直接赋值
    ///
    /// - Parameter name: 路径
    public func db_startGifWithImageName(name:String){
        if let path = Bundle.main.path(forResource: name, ofType: nil) {
            guard let data = NSData(contentsOfFile: path) else {return}
            self.db_startGifWithData(data: data)
        }else {
            self.image = UIImage.init(named: name)
        }
    }
    
//    /// 播放gif
//    /// 实现动图效果
//    ///
//    /// - Parameter filePath: 资源路径
//    private func db_startGifWithFilePath(filePath:String) {
//        //1.加载GIF图片，并转化为data类型
//        guard let data = NSData(contentsOfFile: filePath) else {return}
//        //2.从data中读取数据，转换为CGImageSource
//        guard let imageSource = CGImageSourceCreateWithData(data, nil) else {return}
//        let imageCount = CGImageSourceGetCount(imageSource)
//        //3.遍历所有图片
//        var images = [UIImage]()
//        var totalDuration : TimeInterval = 0
//        for i in 0..<imageCount {
//            //3.1取出图片
//            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else {continue}
//            let image = UIImage(cgImage: cgImage)
//            images.append(image)
//
//            //3.2取出持续时间
//            guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? NSDictionary  else {continue}
//            guard let gifDict = properties[kCGImagePropertyGIFDictionary]  as? NSDictionary else  {continue}
//            guard let frameDuration = gifDict[kCGImagePropertyGIFDelayTime] as? NSNumber else {continue}
//            totalDuration += frameDuration.doubleValue
//        }
//
//        //4.设置imageview的属性
//        self.animationImages = images
//        self.animationDuration = totalDuration
//        self.animationRepeatCount = 0
//
//        //5.开始播放
//        self.startAnimating()
//    }
    
    /// 通过data转换为gif
    /// 实现动图效果
    ///
    /// - Parameter data: 资源data
    func db_startGifWithData(data: NSData) {
        guard let imageSource = CGImageSourceCreateWithData(data, nil) else {return}
        let imageCount = CGImageSourceGetCount(imageSource)
        //3.遍历所有图片
        var images = [UIImage]()
        var totalDuration : TimeInterval = 0
        for i in 0..<imageCount {
            //3.1取出图片
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else {continue}
            let image = UIImage(cgImage: cgImage)
            images.append(image)
            
            //3.2取出持续时间
            guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) else {continue}
            guard let gifDict = (properties as NSDictionary)[kCGImagePropertyGIFDictionary]  as? NSDictionary else  {continue}
            guard let frameDuration = gifDict[kCGImagePropertyGIFDelayTime] as? NSNumber else {continue}
            totalDuration += frameDuration.doubleValue
        }
        
        //4.设置imageview的属性
        self.animationImages = images
        self.animationDuration = totalDuration
        self.animationRepeatCount = 0
        
        //5.开始播放
        self.startAnimating()
    }
    
    /// gif暂停
    public func db_imageStopAnimating() {
        self.stopAnimating()
    }
    ////////////////////////////////////////////////////////    gif播放   ////////////////////////////////////////////////////////
    
}
