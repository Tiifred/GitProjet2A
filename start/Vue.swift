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
    
    func draw(ImgArea: NSImageView!){
        for v in ImgArea.subviews{
            v.removeFromSuperview()
        }
        for i in 0..<controleur.plateau.cars.count{
            var imgtmp:NSImage
            if(i != carnumber){
            
            let filePath1 = "/Users/projet2a/Documents/GitProjet2A/Images/\(controleur.plateau.cars[i].img).png"
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
                    let txtView = NSTextView(frame:NSRect(x: x1+50 , y: y1-20, width: 119, height: 57))
					txtView.drawsBackground = false
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
                    
                    let txtView = NSTextView(frame:NSRect(x: x1+90 , y: y1-20, width: 180, height: 57))
					txtView.drawsBackground = false
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
                    
                    let txtView = NSTextView(frame:NSRect(x: x1+20 , y: y1-50, width: 57, height: 119))
					txtView.drawsBackground = false
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
                    let txtView = NSTextView(frame:NSRect(x: x1+20 , y: y1-90 ,width: 57, height: 180))
					txtView.drawsBackground = false
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