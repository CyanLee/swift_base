//
//  AViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/1.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class AViewController: DBBaseViewController,DBPopDataDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "A"
        setStatusBarStyleType(type: 1)
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let b = DBWelcomeViewController.init(names: ["welcome_1.png","welcome_2.png","welcome_3.png"])
//        let b = DBWelcomeViewController.init(names: ["http://img3.dob500.cn/2019/03/14/201903141526439779.jpg","http://img3.dob500.cn/2019/03/14/201903141537226848.jpg","http://img3.dob500.cn/2019/03/14/201903141527451426.jpg"], isurl: true)
        b.delegate = self
        self.navigationController?.pushViewController(b, animated: true)
//        pushClass(className: "BViewController", data: "钊哥要找工作了")
    }
    
    func obtainPopData(popData: Any?) {
        print(popData as Any)
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
