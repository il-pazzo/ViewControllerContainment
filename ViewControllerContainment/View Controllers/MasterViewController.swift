//
//  MasterViewController.swift
//  ViewControllerContainment
//
//  Created by Glenn Cole on 6/17/18.
//  Copyright © 2018 Glenn Cole. All rights reserved.
//  Based on code created by Bart Jacobs:
//  https://cocoacasts.com/managing-view-controllers-with-container-view-controllers
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var currentVC: UIViewController? {
        
        didSet {
            if let oldVC = oldValue {
                remove( asChildViewController: oldVC )
            }
            if let newVC = currentVC {
                add( asChildViewController: newVC )
            }
        }
    }
    
    
    // MARK: - begin executable code
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }

    private func setupView() {
        
        setupSegmentedControl()
        
        updateView()
    }
    
    private func setupSegmentedControl() {
        
        segmentedControl.removeAllSegments()

        segmentedControl.insertSegment( withTitle: Segment.Summary.title,  at: Segment.Summary.index,  animated: true )
        segmentedControl.insertSegment( withTitle: Segment.Sessions.title, at: Segment.Sessions.index, animated: true )
        segmentedControl.addTarget( self, action: #selector(selectionDidChange(_:)), for: .valueChanged )
        
        segmentedControl.selectedSegmentIndex = Segment.Summary.index
    }
    
    @objc func selectionDidChange( _ sender: UISegmentedControl ) {
        
        updateView()
    }
    
    private func updateView() {

        if segmentedControl.selectedSegmentIndex == Segment.Summary.index {
            currentVC = summaryViewController
        }
        else {
            currentVC = sessionsViewController
        }
    }
    
    // MARK: - lazy properties to set up child view controllers
    
    private lazy var summaryViewController: SummaryViewController = {
        
        var    vc = SummaryViewController.instantiate() as! SummaryViewController
        return vc
    }()
    
    private lazy var sessionsViewController: SessionsViewController = {
        
        var    vc = SessionsViewController.instantiate() as! SessionsViewController
        return vc
    }()
    
    // MARK: - add/remove child VC to/from container view controller
    
    private func add( asChildViewController viewController: UIViewController ) {
        
        addChildViewController( viewController )
        
        view.addSubview( viewController.view )
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        
        viewController.didMove( toParentViewController: self )
    }
    
    private func remove( asChildViewController viewController: UIViewController ) {
        
        viewController.willMove( toParentViewController: nil )
        
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParentViewController()
    }
}

// MARK: - extension to define local constants

extension MasterViewController {
    
    fileprivate enum Segment {
        
        enum Summary {
            static let title = "Summary"
            static let index = 0
        }
        enum Sessions {
            static let title = "Sessions"
            static let index = 1
        }
    }
}
