//
//  MyView.swift
//  test it
//
//  Created by Projet on 13/05/2016.
//  Copyright © 2016 Projet. All rights reserved.
//

import Foundation
import Cocoa



class MyView:NSImageView{
	
	var diffX :CGFloat = 0.0
	var diffY :CGFloat = 0.0
    var detected = false
	
	var vue = NSView()
	var Tvue = NSView()
	var pointstart = CGPoint(x:0,y:0)
	var pointend = CGPoint(x:0,y:0)
	
	override func mouseDown(theEvent: NSEvent) {
		 vue = NSView()
		Tvue = NSView()
        pointstart.x = (theEvent.locationInWindow.x - self.frame.origin.x)
        pointstart.y = (theEvent.locationInWindow.y - self.frame.origin.y)
		for v in self.subviews{
			if (v .isKindOfClass(NSImageView) && v != self){
				
				if (v.frame.contains(pointstart)){
					vue = v
                    detected = true
				}
            }
		}
		for v in self.subviews{
			if (v .isKindOfClass(NSTextView) && detected){
				if (vue.frame.contains(v.frame.origin)){
					Tvue = v
					
				}
			}
		}
		
	}
	//override var acceptsFirstResponder: Bool{return true}
	
	override func mouseUp(theEvent: NSEvent) {
		var b : Bool = false
        if(detected){
		
		if (vue.frame.width>vue.frame.height){
			for index in 0..<10{
				 let x1 = (24 + (1 + 2*index)*4 + index*54)
				
				if (vue.frame.origin.x - CGFloat(x1) < CGFloat(32) && vue.frame.origin.x - CGFloat(x1) > CGFloat(0) && !b){
					vue.frame.origin.x = CGFloat(x1)
					if(vue.frame.width > 150){
						Tvue.frame.origin.x = CGFloat(x1+80)
					}
					else {
						Tvue.frame.origin.x = CGFloat(x1+50)
					}
					b = true
					
				}
				if (vue.frame.origin.x - CGFloat(x1) > -32 && vue.frame.origin.x - CGFloat(x1) < 0 && !b){
					vue.frame.origin.x = CGFloat(x1)
					if(vue.frame.width > 150){
						Tvue.frame.origin.x = CGFloat(x1+80)
					}
					else {
						Tvue.frame.origin.x = CGFloat(x1+50)
					}
					b = true
				}
			// let x1 = (27 + (1 + 2*controleur.plateau.cars[i].y)*interstice + controleur.plateau.cars[i].y*carreau)
			//let y1 = (margebas + (6-controleur.plateau.cars[i].x)*interstice + (6-controleur.plateau.cars[i].x-1)*57 )
				
			}
            vue = NSView()
            Tvue = NSView()
		}
		else {
			for index in 0..<10{
				let y1 = (45 + (1+2*index)*4 + (index*54))
				if (vue.frame.origin.y - CGFloat(y1) < CGFloat(32) && vue.frame.origin.y - CGFloat(y1) > CGFloat(0) && !b){
					vue.frame.origin.y = CGFloat(y1)
					if(vue.frame.height > 150){
						Tvue.frame.origin.y = CGFloat(y1+70)
					}
					else {
						Tvue.frame.origin.y = CGFloat(y1+40)
					}
					b = true
					
				}
				if (vue.frame.origin.y - CGFloat(y1) > -32 && vue.frame.origin.y - CGFloat(y1) < 0 && !b){
					vue.frame.origin.y = CGFloat(y1)
					if(vue.frame.height > 150){
						Tvue.frame.origin.y = CGFloat(y1+70)
					}
					else {
						Tvue.frame.origin.y = CGFloat(y1+40)
					}
					b = true

				}
            }

		}
		
	}
	}
    
    

	
	override func mouseDragged(theEvent: NSEvent) {
        if(detected){
		pointend.x = (theEvent.locationInWindow.x - self.frame.origin.x)
		pointend.y = (theEvent.locationInWindow.y - self.frame.origin.y)
		diffX = pointend.x - pointstart.x
		diffY = pointend.y - pointstart.y
		if(!(testpresence(pointend))){
			for v in self.subviews{
				if (v .isKindOfClass(NSImageView)){
					if (v == vue){
						if(v.frame.width>v.frame.height){
							v.frame.origin.x += pointend.x - pointstart.x
							Tvue.frame.origin.x += pointend.x - pointstart.x
							pointstart.x = pointend.x
							pointstart.y = pointend.y
							
						}
						else{
							v.frame.origin.y += pointend.y - pointstart.y
							Tvue.frame.origin.y += pointend.y - pointstart.y
							pointstart.x = pointend.x
							pointstart.y = pointend.y
							
						}
					}
				}
			}
		}
        }
	}
	
	
	func testpresence(point:CGPoint)->Bool{
		var here = false
		for v in self.subviews{
			if(v != self.vue){
				if (v .isKindOfClass(NSImageView)){
					if(vue.frame.width>vue.frame.height){
						if(diffX>0){
							for i in 0...Int(diffX){
								for j in 0...Int(vue.frame.height){
									let ptplus = CGPoint(x:vue.frame.origin.x + vue.frame.width + CGFloat(i) ,y:vue.frame.origin.y+CGFloat(j))
									if (v.frame.contains(ptplus) && !here){
										here = true
										break
									}
								}
							}
							if(vue.frame.origin.x + diffX + vue.frame.width>self.frame.width-27 && !here){
								here = true
								break
							}
						}
						else {
							for i in Int(diffX)...0{
								for j in 0...Int(vue.frame.height){
									let ptmoins = CGPoint(x:vue.frame.origin.x + CGFloat(i),y:vue.frame.origin.y+CGFloat(j))
									if v.frame.contains(ptmoins){
										here = true
										break
									}
								}
								if(vue.frame.origin.x<27){
									here = true
									break
								}
							}
						}
						
					}
					else {
						if(diffY>0){
							for i in 0...Int(diffY){
								for j in 0...Int(vue.frame.width){
									let ptplus = CGPoint(x:vue.frame.origin.x+CGFloat(j),y:vue.frame.origin.y + vue.frame.height + CGFloat(i))
									if (v.frame.contains(ptplus) && !here){
										here = true
                                        break
									}
									if(vue.frame.origin.y + diffY + vue.frame.height>418 && !here){
										here = true
										break
									}
								}
								
							}
						}
						else {
							for i in Int(diffY)...0{
								for j in 0...Int(vue.frame.width){
									let ptmoins = CGPoint(x:vue.frame.origin.x+CGFloat(j), y:vue.frame.origin.y + CGFloat(i))
									if (v.frame.contains(ptmoins)){
										here = true
										break
									}
									
								}
								if(vue.frame.origin.y + diffY<47){
									here = true
									break
								}
							}
						}
						
					}
				}
			}
		}
		return here
	}
}

