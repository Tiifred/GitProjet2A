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
    var isallow = true
    var ind = 0
    
    var diffX :CGFloat = 0.0
    var diffY :CGFloat = 0.0
    var detected = false
    
    var Vue = NSView()
    var inipoint = CGPoint(x:0,y:0)
    var pointstart = CGPoint(x:0,y:0)
    var pointend = CGPoint(x:0,y:0)
    let winPoint = CGPoint(x:370,y:260)
	
    override func mouseDown(theEvent: NSEvent) {
		
        var ca = 0
        if(isallow){
            Vue = NSImageView()
            pointstart.x = (theEvent.locationInWindow.x - self.frame.origin.x)
            pointstart.y = (theEvent.locationInWindow.y - self.frame.origin.y)
            inipoint.x = (theEvent.locationInWindow.x - self.frame.origin.x)
            inipoint.y = (theEvent.locationInWindow.y - self.frame.origin.y)
            
            for v in self.subviews{
                
                if (v .isKindOfClass(NSImageView) && v != self){
                    
                    if (v.frame.contains(pointstart)){
                        Vue = v
                        detected = true
                        ind = ca

                    }
                }
               ca += 1
            }
            
        }
    }
    override var acceptsFirstResponder: Bool{
        return true
    }
	
	override func rightMouseUp(theEvent: NSEvent) {
		pointstart.x = (theEvent.locationInWindow.x - self.frame.origin.x)
		pointstart.y = (theEvent.locationInWindow.y - self.frame.origin.y)
		inipoint.x = (theEvent.locationInWindow.x - self.frame.origin.x)
		inipoint.y = (theEvent.locationInWindow.y - self.frame.origin.y)
		var ca = 0
		for v in self.subviews{
			if (v .isKindOfClass(NSImageView) && v != self){
				if (v.frame.contains(pointstart)){
					ind = ca
					self.popUpMenu(theEvent)
				}
			}
			ca += 1
		}

	}
	
	
    override func mouseUp(theEvent: NSEvent) {
        let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		var sign = ""
		
        if(isallow){
            if(detected){
                if (Vue.frame.width>Vue.frame.height){
					if (diffX<0) { sign = "minus"}
					else {sign = "plus"}
					
					let xx = -inipoint.x + pointend.x
					Swift.print("\(abs(Int(round(xx/58))))")
					if(d.vue.controleur.plateau.cars[ind].isAllowed(sign,val: abs(Int(round(xx/58)))+1)){
						d.vue.controleur.plateau.cars[ind].y += Int(round(xx/58))
						d.vue.draw(d.ImgArea)
					}
                    if(subviews[0].frame.contains(winPoint)){
                        Swift.print("you win  !")
                        isallow = false
                    }
                    
                }
                else {
					 let yy = -inipoint.y + pointend.y
					if (diffY<0) {
						sign = "plus"
						if(d.vue.controleur.plateau.cars[ind].isAllowed(sign,val: abs(Int(round(yy/58)))+1)){
							d.vue.controleur.plateau.cars[ind].x += -Int(round(yy/58))
							d.vue.draw(d.ImgArea)
						}
					}
					else {
						sign = "minus"
						if(d.vue.controleur.plateau.cars[ind].isAllowed(sign,val: abs(Int(round(yy/58)))+1)){
							d.vue.controleur.plateau.cars[ind].x += -Int(round(yy/58))
							d.vue.draw(d.ImgArea)
						}
					}
                }
                
            }
            Vue = NSView()
        }
        ind = 0
    }
    
    
    
    
    override func mouseDragged(theEvent: NSEvent) {
        if(isallow){
            if(detected){
                pointend.x = (theEvent.locationInWindow.x - self.frame.origin.x)
                pointend.y = (theEvent.locationInWindow.y - self.frame.origin.y)
                diffX = pointend.x - pointstart.x
                diffY = pointend.y - pointstart.y
                if(!(testpresence(pointend))){
                    for v in self.subviews{
                        if (v .isKindOfClass(NSImageView)){
                            if (v == Vue){
                                if(v.frame.width>v.frame.height){
                                    v.frame.origin.x += pointend.x - pointstart.x
                                    pointstart.x = pointend.x
                                    pointstart.y = pointend.y
                                    
                                }
                                else{
                                    v.frame.origin.y += pointend.y - pointstart.y
                                    pointstart.x = pointend.x
                                    pointstart.y = pointend.y
                                    
                                }
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
            if(v != self.Vue){
                if (v .isKindOfClass(NSImageView)){
                    if(Vue.frame.width>Vue.frame.height){
                        if(diffX>0){
                            for i in 0...Int(diffX){
                                for j in 0...Int(Vue.frame.height){
                                    let ptplus = CGPoint(x:Vue.frame.origin.x + Vue.frame.width + CGFloat(i) ,y:Vue.frame.origin.y+CGFloat(j))
                                    if (v.frame.contains(ptplus) && !here){
                                        here = true
                                        break
                                    }
                                }
                            }
                            if(Vue.frame.origin.x + diffX + Vue.frame.width>self.frame.width-27 && !here){
                                here = true
                                break
                            }
                        }
                        else {
                            for i in Int(diffX)...0{
                                for j in 0...Int(Vue.frame.height){
                                    let ptmoins = CGPoint(x:Vue.frame.origin.x + CGFloat(i),y:Vue.frame.origin.y+CGFloat(j))
                                    if v.frame.contains(ptmoins){
                                        here = true
                                        break
                                    }
                                }
                                if(Vue.frame.origin.x<27){
                                    here = true
                                    break
                                }
                            }
                        }
                        
                    }
                    else {
                        if(diffY>0){
                            for i in 0...Int(diffY){
                                for j in 0...Int(Vue.frame.width){
                                    let ptplus = CGPoint(x:Vue.frame.origin.x+CGFloat(j),y:Vue.frame.origin.y + Vue.frame.height + CGFloat(i))
                                    if (v.frame.contains(ptplus) && !here){
                                        here = true
                                        break
                                    }
                                    if(Vue.frame.origin.y + diffY + Vue.frame.height>418 && !here){
                                        here = true
                                        break
                                    }
                                }
                                
                            }
                        }
                        else {
                            for i in Int(diffY)...0{
                                for j in 0...Int(Vue.frame.width){
                                    let ptmoins = CGPoint(x:Vue.frame.origin.x+CGFloat(j), y:Vue.frame.origin.y + CGFloat(i))
                                    if (v.frame.contains(ptmoins)){
                                        here = true
                                        break
                                    }
                                    
                                }
                                if(Vue.frame.origin.y + diffY<47){
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
	func popUpMenu(event: NSEvent) {
		let theMenu = NSMenu(title: "Contextual menu")
		theMenu.addItemWithTitle("change image", action: #selector(self.action1(_:)), keyEquivalent: "")
		theMenu.addItemWithTitle("Action 2", action: #selector(self.action2(_:)), keyEquivalent: "")
		//theMenu.autoenablesItems = false
		NSMenu.popUpContextMenu(theMenu, withEvent:event, forView:self)
	}
	func action1(sender: AnyObject) {
		var path = ""
		Swift.print("Urk, action 2")
		let openDlg = NSOpenPanel()
		openDlg.allowsMultipleSelection = false
		openDlg.canChooseFiles = true
		openDlg.canChooseDirectories = false
		if openDlg.runModal() == NSOKButton{
			path = String(openDlg.URL!)
			
			for _ in 0..<7{
				path = String(path.characters.dropFirst())
			}
			 let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
			d.vue.controleur.plateau.cars[ind].img = path
			d.vue.draw(d.ImgArea)
		}

	}
	
	func action2(sender: AnyObject) {
		Swift.print("Urk, action 2")
	}

	
	
}

