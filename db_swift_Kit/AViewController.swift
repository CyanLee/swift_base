//
//  AViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/1.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class AViewController: DBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "A"
        equipmentInfo()
        setStatusBarStyleType(type: 1)
        // Do any additional setup after loading the view.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let b = BViewController()
//        self.navigationController?.pushViewController(b, animated: true)
        pushClass(className: "BViewController", data: "钊哥要找工作了")
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
