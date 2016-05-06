//
//  AppDelegate.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var controleur = Controleur()
    
    
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var label: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

   
    
    @IBAction func addcar(sender: NSButton) {
        controleur.lecture(1)
        label.stringValue = ""
        label.stringValue += controleur.afficheTab()
    }

    
    @IBAction func moovePlus(sender: NSButton) {
        if(controleur.plateau.cars[4].isAllowed("plus", val: 1)){
            controleur.plateau.cars[4].movePlus(1)
        }
        label.stringValue =  controleur.afficheTab()
    }
    
    @IBAction func mooveMinus(sender: NSButton) {
        if(controleur.plateau.cars[4].isAllowed("minus", val: 1)){
            controleur.plateau.cars[4].moveMinus(1)
        }
        label.stringValue =  controleur.afficheTab()
    }
 
}

