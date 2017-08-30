//
//  PullDownViewController.swift
//  Pulldown
//
//  Created by Maria Gomez on 9/1/15.
//  Copyright © 2015 Maria Gomez. All rights reserved.
//


import UIKit


protocol PullDownDelegate {
    
    func selectedMenuDidUpdate(_ name: String)
}


class PullDownViewController : UIViewController {
    
    struct properties {
        static let data = [ "Apples","Oranges", "Bananas" ]
    }

    @IBOutlet fileprivate weak var tableView: UITableView!
    
    var delegate : PullDownDelegate?

    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self

        //show last separator
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)

    }
    
}


extension PullDownViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.menuTitle?.text = properties.data[indexPath.row].uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let delegate = self.delegate {
            delegate.selectedMenuDidUpdate(properties.data[indexPath.row])
        }

        
    }

}

