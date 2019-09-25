//
//  ViewController.swift
//  akcoreTest
//
//  Created by julien@macmini on 25/09/2019.
//  Copyright © 2019 jbloit. All rights reserved.
//

import Cocoa
import AudioKit
import AudioKitUI

class ViewController: NSViewController {
    
    let conductor = Conductor.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func toggleSoundButton(_ sender: Any) {
        conductor.toggleSound()
    }
    
}

