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


    let plateau = Plateau()
    //let m = Main
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var label: NSTextField!
    @IBAction func addcar(sender: NSButton) {
        
        //lecture()
        plateau.catchLvl(1)
        label.stringValue = ""
        label.stringValue += plateau.afficheTab()
        
    }

    @IBAction func Move(sender: NSButton) {
        if(plateau.cars[4].isAllowed("plus", val: 1)){
            plateau.cars[4].movePlus(1)
        }
        label.stringValue =  plateau.afficheTab()
    }
    
    
    func datbool(s:String)->Bool{
        if(s == "h"){
            return false
        }
        return true
    }
    
    
    func lecture(){
        
        let deflvl = catchlvl(1)
        print("**************")
        print(deflvl)
        print("**************")
        var tablvl = deflvl.lines
        for i in 1..<tablvl.count{
    plateau.cars.append(Car(Id:i,length: Int(tablvl[i].words()[2])!,X:Int(tablvl[i].words()[0])!,Y:Int(tablvl[i].words()[1])!, isVertical: (datbool(tablvl[i].words()[3])), p: plateau))
        }
        
    }
    
    func catchlvl(lvl:Int)->String{
        var strBuffer : String = ""
        var copy = false
    
        
        if let aStreamReader = StreamReader(path:"/Users/projet2a/Documents/CardSet-1") {
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
        return strBuffer + "\n"
    }
 
 
}

