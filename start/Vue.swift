//
//  VueControler.swift
//  start
//
//  Created by Projet 2A on 11/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation
import Cocoa

class Vue{
    
    // *** Description plateau ***
    let margebas=47
    let margegauche=25
    let interstice = 4
    let carreau = 54
    // *** fin Description  ***
    
    
    var controleur = Controleur()
    var fin=0
    var current=0
    var pat = ""
    var carnumber = 1500
    // for i in 0..controleur.plateau.cars.count{
    
    //}
    var grid = NSImage(named: "grid")

    init(){
        
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
    
    func addtext(image:NSImage, text:NSString, point:NSPoint) -> NSImage{
        image.lockFocus()
        
        let textFont = NSFont(name: "Arial", size: 12)
        let textColor = NSColor.blackColor()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        
        
        //Setups up the font attributes that will be later used to dictate how the text should be drawn

        
        let multipleAttributes = [
            NSForegroundColorAttributeName: NSColor.greenColor(),
            NSBackgroundColorAttributeName: NSColor.yellowColor(),
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue ]
        
        //Put the image into a rectangle as large as the original image.
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        
        // Creating a point within the space that is as bit as the image.
        let rect: CGRect = CGRectMake(point.x, point.y, image.size.width, image.size.height)
        
        //Now Draw the text into an image.
        text.drawInRect(rect, withAttributes: multipleAttributes)
        
        // Create a new image out of the images we have created
       // var newImage: NSImage
        // End the context now that we have the image we need
       image.unlockFocus()
        
        //And pass it back up to the caller.
        return image
        
    
    }
    
    func draw(ImgArea: NSImageView!){
        for v in ImgArea.subviews{
            v.removeFromSuperview()
        }
        for i in 0..<controleur.plateau.cars.count{
            var imgtmp:NSImage
            if(i != carnumber){
            
            let filePath1 = "/Users/projet2a/Documents/projet/start/Images/\(controleur.plateau.cars[i].img).png"
            let file1 = NSURL(fileURLWithPath: filePath1, isDirectory: false)
             imgtmp = NSImage(contentsOfURL: file1)!
            }
            else {
                let filePath1 = pat
                let file1 = NSURL(fileURLWithPath: filePath1, isDirectory: false)
                 imgtmp = NSImage(contentsOfURL: file1)!

            }
            
            
            if(!(controleur.plateau.cars[i].isVertical)){
                if(controleur.plateau.cars[i].length==2){
                    
                    
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 119, height: 57))
   
                    imgtmp = addtext(imgtmp, text: "ojnl",point:imgView.frame.origin)

                    

                    let txtView = NSTextView(frame:NSRect(x: x1+50 , y: y1+5, width: 30, height: 30))
					txtView.drawsBackground = false
                    txtView.selectable = false
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp.imageRotatedByDegreess(180)
                    }
                    if(imgtmp.size.width < imgtmp.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        ImgArea.addSubview(imgView)
                    }
					ImgArea.addSubview(txtView)
					txtView.textStorage?.appendAttributedString(NSAttributedString(string: "\(i)"))
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
                    
                    let txtView = NSTextView(frame:NSRect(x: x1+80 , y: y1+5, width: 35, height: 30))
					txtView.drawsBackground = false
                    txtView.selectable = false
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 180, height: 57))
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp.imageRotatedByDegreess(180)
                    }
                    
                    
                    if(imgtmp.size.width < imgtmp.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        ImgArea.addSubview(imgView)
                    }
					ImgArea.addSubview(txtView)
					txtView.textStorage?.appendAttributedString(NSAttributedString(string: "\(i)"))
                }
            }else{
                if(controleur.plateau.cars[i].length==2){
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-1)*interstice + (6-controleur.plateau.cars[i].x-2)*57 )
                    
                    let txtView = NSTextView(frame:NSRect(x: x1+20 , y: y1+40, width: 30, height: 30))
					txtView.drawsBackground = false
                    txtView.selectable = false
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 119))
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp.imageRotatedByDegreess(180)
                    }
                    
                    if(imgtmp.size.width > imgtmp.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        ImgArea.addSubview(imgView)
                    }
					ImgArea.addSubview(txtView)
					txtView.textStorage?.appendAttributedString(NSAttributedString(string: "\(i)"))
                    
                }
                else{
                    let x1 = (margegauche + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
                    let y1 = (margebas + (6-controleur.plateau.cars[i].x-2)*interstice + (6-controleur.plateau.cars[i].x-3)*57 )
                    let txtView = NSTextView(frame:NSRect(x: x1+20 , y: y1+70 ,width: 30, height: 30))
					txtView.drawsBackground = false
                    txtView.selectable = false
                    let imgView = NSImageView(frame:NSRect(x: x1 , y: y1, width: 57, height: 180))
                    if(controleur.plateau.cars[i].orientation == "f"){
                        imgtmp = imgtmp.imageRotatedByDegreess(180)
                    }
                    if(imgtmp.size.width > imgtmp.size.height){
                        imgView.image = imgtmp
                        imgView.rotateByAngle(90)
                        ImgArea.addSubview(imgView)
                    }
                    else{
                        imgView.image = imgtmp
                        ImgArea.addSubview(imgView)
                    }
					ImgArea.addSubview(txtView)
					txtView.textStorage?.appendAttributedString(NSAttributedString(string: "\(i)"))
                }
                
            }
        }
    }
}