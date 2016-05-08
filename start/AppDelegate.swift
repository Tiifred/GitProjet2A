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


    func applicationDidFinishLaunching(aNotification: NSNotification) {
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var label: NSTextField!
    @IBAction func addcar(sender: NSButton) {
       controleur.plateau.lecture()
         label.stringValue = ""
        label.stringValue += controleur.plateau.afficheTab()
        
    }

    @IBAction func step(sender: NSButton) {
    controleur.mooving()
	controleur.createPath()
    }
    
    
    @IBAction func Move(sender: NSButton) {
        if(controleur.plateau.cars[2].isAllowed("minus", val: 1)){
            print("ici")
            controleur.plateau.cars[2].moveMinus(1)
        }
        label.stringValue = controleur.plateau.afficheTab()
		    }
	
    @IBAction func plus(sender: NSButton) {
        if(controleur.plateau.cars[2].isAllowed("plus", val: 1)){
            print("ou la ")
            controleur.plateau.cars[2].movePlus(1)
        }
        label.stringValue = controleur.plateau.afficheTab()

    }
    
    
    
    
    
   }

