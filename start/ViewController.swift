//
//  ViewController.swift
//  start
//
//  Created by Projet 2A on 13/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation
import Cocoa

class ViewController  : NSViewController {
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override func keyDown(event: NSEvent) {
    if (event.keyCode == 1){
    print("down")
    }
    }
    
    override func keyUp(event: NSEvent) {
    if (event.keyCode == 1){
    print("up")
    }
    }
    }
   