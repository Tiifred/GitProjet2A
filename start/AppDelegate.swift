//
//  AppDelegate.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate{
    // *** Description plateau ***
    let margebas=47
    let margegauche=25
    let interstice = 4
    let carreau = 54
    // *** fin Description  ***
    
    var controleur = Controleur()

    var grid = NSImage(named: "grid")
    var step:Int

    
    
    @IBOutlet weak var window: NSWindow!
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        ImgArea.image = grid
         controleur.plateau.lecture()
            draw()
        step=controleur.path.count

    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
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
    
    @IBAction func PreviousMove(sender: NSButton) {
        
    }
    
    
    @IBAction func nextMove(sender: NSButton) {
    }
    

    
    func resize(image: NSImage, w: Int, h: Int) -> NSImage {
        let destSize = NSMakeSize(CGFloat(w), CGFloat(h))
        let newImage = NSImage(size: destSize)
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
                    var imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp?.imageRotatedByDegreess(180)
                    }
                    if(imgtmp!.size.width < imgtmp!.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        self.ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        self.ImgArea.addSubview(imgView)
                    }
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
                    
                    
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 180, height: 57))
                    var imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp?.imageRotatedByDegreess(180)
                    }
                    
                    if(imgtmp!.size.width < imgtmp!.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        self.ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        self.ImgArea.addSubview(imgView)
                    }
                }
            }else{
                if(controleur.plateau.cars[i].length==2){
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-1)*interstice + (6-controleur.plateau.cars[i].x-2)*57 )
                    
                    
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 119))
                    var imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp?.imageRotatedByDegreess(180)
                    }
                    
                    if(imgtmp!.size.width > imgtmp!.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        self.ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        self.ImgArea.addSubview(imgView)
                    }
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-2)*interstice + (6-controleur.plateau.cars[i].x-3)*57 )
                    
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 180))
                    var imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp?.imageRotatedByDegreess(180)
                    }
                    if(imgtmp!.size.width > imgtmp!.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        self.ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        self.ImgArea.addSubview(imgView)
                    }
                }
            }
        }
        
    }
    
    
}