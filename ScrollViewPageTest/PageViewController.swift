//
//  PageViewController.swift
//  ScrollViewPageTest
//
//  Created by Alfred Choi on 2017-05-14.
//  Copyright © 2017 Alfred Choi. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var pageLabel = UILabel()
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.pageLabel)
        self.view.addSubview(self.tableView)
        
        self.pageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.pageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.pageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.pageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.pageLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.pageLabel.bottomAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
