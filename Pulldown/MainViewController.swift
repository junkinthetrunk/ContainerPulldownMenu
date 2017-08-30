//
//  MainViewController
//  Pulldown
//
//  Created by Maria Gomez on 9/1/15.
//  Copyright © 2015 Maria Gomez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate
{
  
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var containerTopConstraint: NSLayoutConstraint!
  
    @IBOutlet weak var selectedMenuItem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.isHidden = true
        self.container.alpha = 0
        self.containerTopConstraint.constant = -200
        
        selectedMenuItem.alignImageRight()
        if let menuController = childViewControllers.first as? PullDownViewController {
            menuController.delegate = self
        }
                
    }
    

    //MARK - open and closing methods
  
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        container.isHidden ? openPullDown() : closePullDown()
        
    }
    
    
    func openPullDown()
    {
        self.container.isHidden = false
        
        UIView.animate(withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                self.containerTopConstraint.constant = 0
                self.container.alpha = 1
                self.selectedMenuItem.imageView?.transform = CGAffineTransform( rotationAngle: 180 * CGFloat(Double.pi/180))
                self.view.layoutIfNeeded()
            },
            completion: { finished in
            }
        )
        
    }
    
    func closePullDown()
    {
        UIView.animate(withDuration: 0.3,
            animations: {
                self.container.alpha = 0
                self.containerTopConstraint.constant = -200
                self.selectedMenuItem.alignImageRight()
                self.selectedMenuItem.imageView?.transform = CGAffineTransform(rotationAngle: -1 * CGFloat(Double.pi/180))
                self.view.layoutIfNeeded()
            },
            completion: { finished in
                self.container.isHidden = true
            }
        )
    }
    
}

extension MainViewController : PullDownDelegate {
    
    
    func selectedMenuDidUpdate(_ name: String) {

        selectedMenuItem.setTitle(name.uppercased(), for: UIControlState())
        
        closePullDown()
    }
    
}



