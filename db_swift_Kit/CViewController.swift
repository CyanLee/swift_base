//
//  CViewController.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/7.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

class CViewController: DBBaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "C"
        
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
        
//        TableViewHelper.init(tableV: tableView).dealRowIndexNum { (Int) -> Int in
//            return 1
//        }.dealCellCall { (IndexPath, UITableView) -> UITableViewCell in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: IndexPath)
//            cell.textLabel?.text = "1"
//            return cell
//        }
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "1"
        return cell
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
