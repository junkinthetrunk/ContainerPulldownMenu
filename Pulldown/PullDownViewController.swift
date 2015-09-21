//
//  PullDownViewController.swift
//  Pulldown
//
//  Created by Maria Gomez on 9/1/15.
//  Copyright © 2015 Maria Gomez. All rights reserved.
//


import UIKit


protocol PullDownDelegate {
    
    func selectedMenuDidUpdate(name: String)
}


class PullDownViewController : UIViewController {
    
    struct properties {
        static let data = [ "Apples","Oranges", "Bananas" ]
    }

    @IBOutlet private weak var tableView: UITableView!
    
    var delegate : PullDownDelegate?

    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self

        //show last separator
        tableView.tableFooterView = UIView.init(frame: CGRectZero)

    }
    
}


extension PullDownViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        cell.menuTitle?.text = properties.data[indexPath.row].uppercaseString
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.data.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let delegate = self.delegate {
            delegate.selectedMenuDidUpdate(properties.data[indexPath.row])
        }

        
    }

}

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var menuTitle: UILabel!
    
    let colorPurple = UIColor(red: 97.0/255.0, green: 10.0/255.0, blue: 153.0/255.0, alpha: 1.0)

    
    override func awakeFromNib() {
        self.separatorInset = UIEdgeInsetsZero
        self.layoutMargins = UIEdgeInsetsZero
        
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        
        blurView.backgroundColor = colorPurple
        blurView.clipsToBounds = true
        
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        
        blurView.addSubview(vibrancyView)
        self.selectedBackgroundView = blurView
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.menuTitle.textColor = UIColor.whiteColor()
       
        }
        else {
            self.menuTitle.textColor = colorPurple
        }
        
    }
}


