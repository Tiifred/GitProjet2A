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
	var ind = 0
	
	var diffX :CGFloat = 0.0
	var diffY :CGFloat = 0.0
	var detected = false
	
	var Vue = NSView()
	var pointstart = CGPoint(x:0,y:0)
	var pointend = CGPoint(x:0,y:0)
	let winPoint = CGPoint(x:370,y:260)
	
	override func mouseDown(theEvent: NSEvent) {
					Swift.print("mouse down start")
		Vue = NSImageView()

		var ca = 0
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate

		if(d.isallow){
			pointstart.x = (theEvent.locationInWindow.x - self.frame.origin.x)
			pointstart.y = (theEvent.locationInWindow.y - self.frame.origin.y)
			Swift.print("\(pointstart.x)   \(pointstart.y)")
			Swift.print("\(theEvent.locationInWindow.x)   \(theEvent.locationInWindow.y)")
			for v in self.subviews{
				if (v .isKindOfClass(NSImageView) && v != self){
					if (v.frame.contains(pointstart)){
						Vue = v
						detected = true
						ind = ca
						Swift.print("vue numéro \(ind)")
					}
				}
				ca += 1
			}
			
		}
		Swift.print("mouse down end\n")
	}
	override var acceptsFirstResponder: Bool{
		return true
	}
	
	override func rightMouseUp(theEvent: NSEvent) {
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		if(!d.isallow){
		pointstart.x = (theEvent.locationInWindow.x - self.frame.origin.x)
		pointstart.y = (theEvent.locationInWindow.y - self.frame.origin.y)
		var ca = 0
		for v in self.subviews{
			if (v .isKindOfClass(NSImageView) && v != self){
				if (v.frame.contains(pointstart)){
					ind = ca
					Vue = v
					self.popUpMenu(theEvent)
				}
			}
			ca += 1
		}
		}
	}
	
	
	override func mouseUp(theEvent: NSEvent) {
					Swift.print("mouse up start")
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		var b = false
		if(d.isallow){
			if(detected){
				if (Vue.frame.width>Vue.frame.height){
					for index in 0..<10{
						let x1 = (24 + (1 + 2*index)*4 + index*54)
						
						if (Vue.frame.origin.x - CGFloat(x1) < CGFloat(32) && Vue.frame.origin.x - CGFloat(x1) > CGFloat(0) && !b){
							Swift.print("mouse up hori : vue numéro \(ind) ")
							d.vue.controleur.plateau.cars[ind].y = (abs(Int(round((CGFloat(x1)-24)/60))))
							d.vue.draw(d.ImgArea)
							
							b = true
							
						}
						if (Vue.frame.origin.x - CGFloat(x1) > -32 && Vue.frame.origin.x - CGFloat(x1) < 0 && !b){
							d.vue.controleur.plateau.cars[ind].y = (abs(Int(round((CGFloat(x1)-24)/60))))
							Swift.print("mouse up hori vue numéro \(ind)")
							d.vue.draw(d.ImgArea)
							
							b = true
						}
					}
					
					if(subviews[0].frame.contains(winPoint)){
                        d.finish()
						d.isallow = false
					}
					
				}
				else {
					for index in 0..<10{
						let y1 = (45 + (1+2*index)*4 + (index*54))
						if (Vue.frame.origin.y - CGFloat(y1) < CGFloat(32) && Vue.frame.origin.y - CGFloat(y1) > CGFloat(0) && !b){
							Swift.print("mouse up veri : vue numéro \(ind)")
							d.vue.controleur.plateau.cars[ind].x = 6-(abs(Int(round((CGFloat(y1)-40)/60))))-d.vue.controleur.plateau.cars[ind].length
							d.vue.draw(d.ImgArea)
							b = true
							
						}
						if (Vue.frame.origin.y - CGFloat(y1) > -32 && Vue.frame.origin.y - CGFloat(y1) < 0 && !b){
							Swift.print("mouse up verti vue numéro \(ind)\n\n")
							d.vue.controleur.plateau.cars[ind].x = 6-(abs(Int(round((CGFloat(y1)-40)/60))))-d.vue.controleur.plateau.cars[ind].length
							d.vue.draw(d.ImgArea)
							b = true
						}
					}
				}
			}
		}
		Vue = NSView()
		ind = 0
		pointstart = NSPoint(x: 0, y: 0)
		pointend = NSPoint(x: 0, y: 0)
		diffX = 0
		diffY = 0
					Swift.print("mouse up end\n")
	}
	
	
	
	
	override func mouseDragged(theEvent: NSEvent) {
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		if(d.isallow){
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
        if(self.subviews.count == 1){
            
    
            
            if(self.subviews[0].frame.origin.x+diffX<27){here = true}
           if(self.subviews[0].frame.origin.x+self.subviews[0].frame.width+diffX>self.frame.width-27){here = true}
        }
		return here
	}
	func popUpMenu(event: NSEvent) {
		let theMenu = NSMenu(title: "Contextual menu")
		theMenu.addItemWithTitle("change image", action: #selector(self.action1(_:)), keyEquivalent: "")
		theMenu.addItemWithTitle("Rotation 90", action: #selector(self.action2(_:)), keyEquivalent: "")
		theMenu.addItemWithTitle("Rotation 180", action: #selector(self.action3(_:)), keyEquivalent: "")
		//theMenu.autoenablesItems = false
		NSMenu.popUpContextMenu(theMenu, withEvent:event, forView:self)
	}
	func action1(sender: AnyObject) {
		var path = ""
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
		var boolean = true
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		if(ind != 0){
			if (!d.vue.controleur.plateau.cars[ind].isVertical){
				
				for i in 0..<d.vue.controleur.plateau.cars[ind].length{
					
					if(d.vue.controleur.plateau.cars[ind].x+i<6){
						if((d.vue.controleur.plateau.table[d.vue.controleur.plateau.cars[ind].x+i][d.vue.controleur.plateau.cars[ind].y] != -1) && (d.vue.controleur.plateau.table[d.vue.controleur.plateau.cars[ind].x+i][d.vue.controleur.plateau.cars[ind].y] != ind+1)) {
							boolean = false
						}
					}
					else {
						boolean = false
					}
				}
				
				if(boolean){
					d.vue.controleur.plateau.cars[ind].isVertical = !d.vue.controleur.plateau.cars[ind].isVertical
					d.vue.draw(d.ImgArea)
				}
			}
			else {
				
				for i in 0..<d.vue.controleur.plateau.cars[ind].length{
					if(d.vue.controleur.plateau.cars[ind].y+i<6){
						if((d.vue.controleur.plateau.table[d.vue.controleur.plateau.cars[ind].x][d.vue.controleur.plateau.cars[ind].y+i] != -1) && (d.vue.controleur.plateau.table[d.vue.controleur.plateau.cars[ind].x][d.vue.controleur.plateau.cars[ind].y+i] != ind+1)) {
							boolean = false
						}
					}
					else {
						boolean = false
					}
				}
				
				if(boolean){
					d.vue.controleur.plateau.cars[self.ind].isVertical = !d.vue.controleur.plateau.cars[self.ind].isVertical
					d.vue.draw(d.ImgArea)
				}
			}
		}
	}
	
	func action3(sender: AnyObject) {
		let d : AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
		
		if (d.vue.controleur.plateau.cars[ind].orientation == "r"){
			d.vue.controleur.plateau.cars[ind].orientation = "f"
		}
		else {
			d.vue.controleur.plateau.cars[ind].orientation = "r"
		}
		
		d.vue.draw(d.ImgArea)
	}
	

	
	
}

