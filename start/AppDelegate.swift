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
 let car = Car(Id:1,length:2,X:1,Y:1,isVertical:true)
    let plateau = Plateau()
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var label: NSTextField!
    @IBAction func addcar(sender: NSButton) {
       plateau.cars.append(car)
        plateau.cars.append(car)
        //print(car.affiche())
        for i in 0..<plateau.cars.count{
            label.stringValue += plateau.cars[i].affiche()
        }
        
    }

    @IBAction func Move(sender: NSButton) {
        //car.moveMinus(1)
       // label.stringValue+=car.affiche()
         plateau.cars.append(car)
      label.stringValue =  plateau.afficheTab()
    }
    func lecture(){
         
        
    }
}

