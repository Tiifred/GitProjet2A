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
	var fin=0
	var current=0
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
		controleur.plateau.lecture()
		 draw()
		

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var ImgArea: NSImageView!
    @IBOutlet weak var label: NSTextField!
	
	@IBAction func nextLvl(sender: NSButton) {
		if(controleur.plateau.lvl<41){
			controleur.tablist = [Plateau]()
			controleur.current = [Plateau]()
			controleur.next = [Plateau]()
			controleur.plateau = Plateau(lvl:controleur.plateau.lvl+1)
			controleur.b = true
			controleur.path = [Int]()
			controleur.sol = Plateau(lvl:controleur.plateau.lvl+1)
			controleur.stop = 0
			controleur.tablist.append(controleur.plateau)
			controleur.plateau.lecture()
			draw()
			controleur.calculed = false
			
			print("change lvl")
		}
	}
	
	@IBAction func searchsolution(sender: NSButton) {
		controleur.mooving()
		controleur.createPath()
		fin = controleur.path.count
		current = fin - 1
	}
	
	@IBOutlet weak var chooser: NSTextField!
	@IBAction func chooselvl(sender: NSButton) {
		if((chooser.intValue)<42 && (chooser.intValue)>0 ){
			controleur.tablist = [Plateau]()
			controleur.current = [Plateau]()
			controleur.next = [Plateau]()
			controleur.plateau = Plateau(lvl:Int(chooser.intValue))
			controleur.b = true
			controleur.path = [Int]()
			controleur.sol = Plateau(lvl:Int(chooser.intValue))
			controleur.stop = 0
			controleur.tablist.append(controleur.plateau)
			
			print("change lvl")
			controleur.plateau.lecture()
			draw()
			controleur.calculed = false
			
		}
	}
	
	
	
	@IBAction func previousLvl(sender: NSButton) {
		if(controleur.plateau.lvl>0){
			
			controleur.tablist = [Plateau]()
			controleur.current = [Plateau]()
			controleur.next = [Plateau]()
			controleur.plateau = Plateau(lvl:controleur.plateau.lvl-1)
			controleur.b = true
			controleur.path = [Int]()
			controleur.sol = Plateau(lvl:controleur.plateau.lvl-1)
			controleur.stop = 0
			controleur.tablist.append(controleur.plateau)
			
			print("change lvl")
			controleur.plateau.lecture()
			draw()
			controleur.calculed = false
		}
	}

	@IBAction func previousMove(sender: NSButton) {
		if(current != fin-1 && controleur.calculed){
			controleur.plateau = controleur.tablist[controleur.path[current + 1]]
			draw()
			current = current + 1
		}
	}

	@IBAction func nextMove(sender: NSButton) {
		if(current != 0 && controleur.calculed){
			controleur.plateau = controleur.tablist[controleur.path[current - 1]]
			draw()
			current = current - 1
		}
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
		for v in ImgArea.subviews{
   v.removeFromSuperview()
		}
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
                    let imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    let tmp = resize(imgtmp!,w:180,h:57)
                    imgView.image = tmp

                    self.ImgArea.addSubview(imgView)
                }
            }else{
                if(controleur.plateau.cars[i].length==2){
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-1)*interstice + (6-controleur.plateau.cars[i].x-2)*57 )
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 119))
                    let imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    let tmp = resize(imgtmp!,w:57,h:119)
                    imgView.image = tmp

                    self.ImgArea.addSubview(imgView)
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-2)*interstice + (6-controleur.plateau.cars[i].x-3)*57 )
                    
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 180))
                    let imgtmp = NSImage(named : controleur.plateau.cars[i].img)
                    if(imgtmp!.size.width > imgtmp!.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(270)
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