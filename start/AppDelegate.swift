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
       lecture()
         label.stringValue = ""
        label.stringValue += controleur.plateau.afficheTab()
        
    }

    @IBAction func step(sender: NSButton) {
    controleur.mooving()
    }
    
    
    @IBAction func Move(sender: NSButton) {
        if(controleur.plateau.cars[6].isAllowed("minus", val: 3)){
            print("ici")
            controleur.plateau.cars[6].moveMinus(3)
        }
        label.stringValue = controleur.plateau.afficheTab()
    }
    
    @IBAction func plus(sender: NSButton) {
        if(controleur.plateau.cars[6].isAllowed("plus", val: 3)){
            print("ou la ")
            controleur.plateau.cars[6].movePlus(3)
        }
        label.stringValue = controleur.plateau.afficheTab()

    }
    
    
    func datbool(s:String)->Bool{
        if(s == "h"){
            return false
        }
        return true
    }
    
    
    func lecture(){
        
        let deflvl = catchlvl(1)
        var tablvl = deflvl.lines
       for i in 1..<tablvl.count{
    controleur.plateau.cars.append(Car(Id:i,length: Int(tablvl[i].words()[2])!,X:Int(tablvl[i].words()[0])!,Y:Int(tablvl[i].words()[1])!, isVertical: (datbool(tablvl[i].words()[3])), p: controleur.plateau))
        }
        
    }
    
    func catchlvl(lvl:Int)->String{
    var strBuffer : String = ""
    var copy = false
    
    
    if let aStreamReader = StreamReader(path:"/Users/projet2a/Documents/projet/start/CardSet-1") {
    defer {
    aStreamReader.close()
    }
    while let line = aStreamReader.nextLine() {
    if(line.matchPattern("level \(lvl)")) {
    strBuffer = ""
    copy = true
    }
    
    if(line == "" && copy) {
    copy = false
    return strBuffer
    }
    
    strBuffer += line + "\r"
    
    }
    }
    return strBuffer + "jbh \n"
    }
}

