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
     // *** Description plateau ***
        let margebas=47
        let margegauche=25
        let interstice = 4
        let carreau = 54
    // *** fin Description  ***
    
    
    var controleur = Controleur()
    
   // for i in 0..controleur.plateau.cars.count{
    
    //}
    var grid = NSImage(named: "grid")
    var blucar = NSImage(named : "CarH-blue")
    var blucarV = NSImage(named : "CarV-blue")
    var blutruck = NSImage(named : "TruckH-blue")
    var blutruckV = NSImage(named : "TruckV-blue")
    var ds = NSImage(named: "DS21")
    
    
    
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        ImgArea.image = grid
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var ImgArea: NSImageView!
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
        /*if(controleur.plateau.cars[2].isAllowed("minus", val: 1)){
            print("ici")
            controleur.plateau.cars[2].moveMinus(1)
        }
        label.stringValue = controleur.plateau.afficheTab()*/
        draw()
		    }
	
    @IBAction func plus(sender: NSButton) {

    }
    
    func resize(image: NSImage, w: Int, h: Int) -> NSImage {
        var destSize = NSMakeSize(CGFloat(w), CGFloat(h))
        var newImage = NSImage(size: destSize)
        newImage.lockFocus()
        image.drawInRect(NSMakeRect(0, 0, destSize.width, destSize.height), fromRect: NSMakeRect(0, 0, image.size.width, image.size.height), operation: NSCompositingOperation.CompositeSourceOver, fraction: CGFloat(1))
        newImage.unlockFocus()
        newImage.size = destSize
        return NSImage(data: newImage.TIFFRepresentation!)!
    }
    
    func draw(){
        for i in 0..<controleur.plateau.cars.count{
            if(!(controleur.plateau.cars[i].isVertical)){
                if(controleur.plateau.cars[i].length==2){
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
                    
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 119, height: 57))
                    // traitement de l'image
                  //  let coucou
                    
                    let imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    let tmp = resize(imgtmp!,w:119,h:57)
                    //let tmp = resize(blucar!,w:119,h:57)
                    imgView.image = tmp
                    self.ImgArea.addSubview(imgView)
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 180, height: 57))
                    //     let tmp = resize(blucar!,w:119+,h:57)
                    //let tmp = resize((NSImage(named: controleur.plateau.cars[i].img))!,w:180,h:57)
                    let tmp = resize(blucar!,w:180,h:57)
                    imgView.image = tmp

                    self.ImgArea.addSubview(imgView)
                }
            }else{
                if(controleur.plateau.cars[i].length==2){
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-1)*interstice + (6-controleur.plateau.cars[i].x-2)*57 )
                    let tmp = resize(blucar!,w:57,h:119)
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 119))
                    //let tmp = resize((NSImage(named: controleur.plateau.cars[i].img))!,w:57,h:119)
                    imgView.image = tmp

                    self.ImgArea.addSubview(imgView)
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-2)*interstice + (6-controleur.plateau.cars[i].x-3)*57 )
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 180))
                    //     let tmp = resize(blucar!,w:119+,h:57)
                    let tmp = resize(blucar!,w:57,h:180)
                    //let tmp = resize((NSImage(named: controleur.plateau.cars[i].img))!,w:57,h:180)
                    imgView.image = tmp

                    self.ImgArea.addSubview(imgView)
                }

            
            }
    }
    
    
    
    
   }

}