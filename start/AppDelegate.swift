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
    @IBOutlet weak var label: NSTextField!
	
	@IBAction func nextLvl(sender: NSButton) {
		vue.nextlvl()
        vue.draw(self.ImgArea)
	}
	
	@IBAction func searchsolution(sender: NSButton) {
		vue.controleur.mooving()
		vue.controleur.createPath()
		vue.fin = vue.controleur.path.count
		vue.current = vue.fin - 1
	}
	
	@IBOutlet weak var chooser: NSTextField!
	@IBAction func chooselvl(sender: NSButton) {
        vue.inilvl(Int(chooser.intValue))
        vue.draw(self.ImgArea)
	}
	
	
	
	@IBAction func previousLvl(sender: NSButton) {
		vue.previouslvl()
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
    
    @IBOutlet weak var AddCarX: NSTextField!
    @IBOutlet weak var AddCarY: NSTextField!
    
    @IBAction func AddCar(sender: NSButton) {
        vue.controleur.addCarManualy(AddCarX.integerValue, y: AddCarY.integerValue)
        vue.draw(self.ImgArea)
    }
    


}