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

	var vue = Vue()

    
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        ImgArea.image = vue.grid
		vue.controleur.plateau.lecture()
		 vue.draw(self.ImgArea)
      
    }
    
  


    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
    @IBOutlet weak var ImgArea: NSImageView!
  //  self.ImgArea.acceptsFirstResponder = true
    
	@IBAction func nextLvl(sender: NSButton) {
		vue.controleur.nextlvl()
        vue.draw(self.ImgArea)
	}
	
	@IBAction func searchsolution(sender: NSButton) {
		vue.controleur.mooving()
		vue.controleur.createPath()
		vue.fin = vue.controleur.path.count
		vue.current = vue.fin - 1
	}
	
	
	@IBAction func chooselvl(sender: NSButton) {
        //vue.controleur.inilvl(Int(chooser.intValue))
       // vue.draw(self.ImgArea)
	}
	
	
	
	@IBAction func previousLvl(sender: NSButton) {
		vue.controleur.previouslvl()
        vue.draw(self.ImgArea)
	}

	@IBAction func previousMove(sender: NSButton) {
		if(vue.current != vue.fin-1 && vue.controleur.calculed){
			vue.controleur.plateau = vue.controleur.tablist[vue.controleur.path[vue.current + 1]]
			vue.draw(self.ImgArea)
			vue.current = vue.current + 1
		}
	}

	@IBAction func nextMove(sender: NSButton) {
		if(vue.current != 0 && vue.controleur.calculed){
			vue.controleur.plateau = vue.controleur.tablist[vue.controleur.path[vue.current - 1]]
			vue.draw(self.ImgArea)
			vue.current = vue.current - 1
		}
	}


}