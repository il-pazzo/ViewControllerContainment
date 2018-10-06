//
//  SessionsViewController.swift
//  ViewControllerContainment
//
//  Created by Glenn Cole on 6/17/18.
//  Copyright © 2018 Glenn Cole. All rights reserved.
//  Based on code created by Bart Jacobs:
//  https://cocoacasts.com/managing-view-controllers-with-container-view-controllers
//

import UIKit

class SessionsViewController: UIViewController {

    var theLabel: UILabel = {
        let label = UILabel()
//        let label = UILabel( frame: CGRect(x: 0, y: 0, width: 300, height: 24))
//        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect( x:0, y:0, width:300, height:24 )
        label.textColor     = .black
        label.textAlignment = .center
//        label.numberOfLines = 3
//        label.font          = UIFont(name: "Helvetica-Bold", size: 22)
        label.font          = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        showSomeLabelWithSwift4()
//        showSomeLabelWithSwift3()
    }
    
    func showSomeLabelWithSwift4() {
        
        theLabel.text = "Hello from the SessionsViewController"
        theLabel.center = CGPoint( x: view.frame.width / 2, y: view.frame.height / 2 )
        
//        theLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 24)

        self.view.addSubview( theLabel )
    }
    func showSomeLabelWithSwift3()
    {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        
        // and set the text color too - remember good contrast
        label.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        label.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        
        // this changed in Swift 3 (much better, no?)
        label.textAlignment = .center
        
        label.text = "Greetings from the SessionsViewController"
        
        self.view.addSubview(label)
    }

//    override func viewDidLayoutSubviews() {
//        print( "viewDidLayoutSubviews..." )
//        theLabel.center = CGPoint( x: view.frame.width / 2, y: view.frame.height / 2 )
//        theLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 24)
//    }

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
