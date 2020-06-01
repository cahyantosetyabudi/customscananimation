//
//  ViewController.swift
//  SampleBlinkIDScanner
//
//  Created by Cahyanto Setya Budi on 31/05/20.
//  Copyright © 2020 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: ViewFinder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
        containerView.startScanLineAnimation()
    }
    
    @IBAction func startFlipAnimation(_ sender: UIButton) {
        containerView.startFlipAnimation()
    }
    
}

