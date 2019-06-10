//
//  BViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/1.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class BViewController: DBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "B"
        print(pushDat as Any)
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let b = CViewController()
        self.navigationController?.pushViewController(b, animated: true)
//        popViewControllerSpecified(specifiedVc: "AViewController")
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
