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
    var plateau = Plateau()
    
    
    
    

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var label: NSTextField!
    @IBAction func addcar(sender: NSButton) {
        let car = Car(Id:1,length:2,X:3,Y:3,isVertical:true,p:plateau)
        plateau.cars.append(car)
         label.stringValue = ""
        //plateau.cars.append(car)
        //print(car.affiche())
        for i in 0..<plateau.cars.count{
            label.stringValue += plateau.cars[i].affiche() + "added \n"
        }
        label.stringValue += plateau.afficheTab()
        print("heloooooooooooo")
        
    }

    @IBAction func Move(sender: NSButton) {
        //car.moveMinus(1)
       // label.stringValue+=car.affiche()
         //plateau.cars.append(car)
        plateau.cars[0].moveMinus(1)
      label.stringValue =  plateau.afficheTab()
    }
    func lecture(){
         
        
    }
}

