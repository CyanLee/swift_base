//
//  CViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/7.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class CViewController: DBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "C"
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        popViewControllerSpecified(specifiedVc: "AViewController")
        popMainTabbar(currentVC: self, tabbarIndex: 0)
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
