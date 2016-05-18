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

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var afficheMove: NSTextField!
    @IBOutlet weak var ImgArea: NSImageView!
    @IBOutlet weak var label: NSTextField!
	@IBOutlet weak var presentation: NSTextField!
    @IBOutlet weak var container: NSTextField!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
       // window.acceptsMouseMovedEvents = true
		ImgArea.editable = true
		
		let grid = NSImage(named: "grid")
        ImgArea.image = grid
        vue.controleur.plateau.lecture()
        vue.draw(self.ImgArea)
		for i in 1..<vue.controleur.plateau.cars.count{
			supprimer.addItemWithObjectValue("\(i)")
		}
		supprimer.placeholderString = "n°"
        
        vue.controleur.plateau.detectnblvl()
        container.placeholderString = "  1 - \(vue.controleur.plateau.nbrlvl)"
        
    }
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
	@IBOutlet weak var supprimer: NSComboBox!
    
    
	var vue = Vue()
    var aaa = ""
    var movecontains = ""
    let textFieldX = NSTextView()
    let textFieldY = NSTextView()
    let textFieldOri = NSTextView()
    var cbox = NSComboBox()
    var cboxval = NSComboBox()
    var cboxX = NSComboBox()
    var cboxY = NSComboBox()
    var memoMove = [String]()
    var addcar = false
	

    @IBAction func changeImage(sender: NSButton) {
        let openDlg = NSOpenPanel()
        openDlg.allowsMultipleSelection = false
        openDlg.canChooseFiles = true
        openDlg.canChooseDirectories = false
        if openDlg.runModal() == NSOKButton{
            vue.pat = String(openDlg.URL!)
        
        for _ in 0..<7{
            vue.pat = String(vue.pat.characters.dropFirst())
        }
        vue.carnumber=0
        vue.draw(self.ImgArea)
        }
    }
    
	@IBAction func carDelete(sender: NSButton) {
        if(supprimer.intValue>0 && Int(supprimer.intValue) < vue.controleur.plateau.cars.count){
        vue.controleur.plateau.cars.removeAtIndex(Int(supprimer.intValue))
		vue.controleur.plateau.update()
		addcar = true
		vue.draw(ImgArea)
            supprimer.stringValue = ""
        }
	}
    
    @IBAction func setlvl(sender: NSTextField) {
        vue.carnumber = 1500
        vue.controleur.inilvl(Int(sender.intValue))
        vue.draw(self.ImgArea)
		container.stringValue = ""
		presentation.stringValue = "Vous êtes au niveau \(vue.controleur.plateau.lvl1) "
		afficheMove.stringValue = ""
		supprimer.removeAllItems();
		if(vue.controleur.plateau.cars.count != 0){
            for i in 1..<vue.controleur.plateau.cars.count{
                supprimer.addItemWithObjectValue("\(i)")
            }
		}
    }

    @IBAction func createlvl(sender: NSButton) {
        vue.carnumber = 1500
        vue.controleur.create()
        vue.draw(self.ImgArea)
		afficheMove.stringValue = ""
		presentation.stringValue = "Nouveau niveau"
		supprimer.removeAllItems()
    }


	@IBAction func nextLvl(sender: NSButton) {
        vue.carnumber = 1500
		vue.controleur.nextlvl()
        vue.draw(self.ImgArea)
		afficheMove.stringValue = ""
		presentation.stringValue = "Vous êtes au niveau \(vue.controleur.plateau.lvl1) "
		supprimer.removeAllItems();
		for i in 1..<vue.controleur.plateau.cars.count{
			supprimer.addItemWithObjectValue("\(i)")
		}
	}
    @IBAction func previousLvl(sender: NSButton) {
        vue.carnumber = 1500
        vue.controleur.previouslvl()
        vue.draw(self.ImgArea)
        
        afficheMove.stringValue = ""
        presentation.stringValue = "Vous êtes au niveau \(vue.controleur.plateau.lvl1) "
        supprimer.removeAllItems();
        for i in 1..<vue.controleur.plateau.cars.count{
            supprimer.addItemWithObjectValue("\(i)")
        }
    }
	
	@IBAction func searchsolution(sender: NSButton) {
            vue.controleur.mooving()
            vue.controleur.createPath()
            vue.fin = vue.controleur.path.count
            vue.current = vue.fin - 1
        addcar = false
	}
	
	
	
	
	
    @IBAction func newWind(sender: NSButton) {
        //Declare new subwindow
        let win = NSWindow(contentRect: NSMakeRect(100, 100, 800, 200),
                           styleMask: 1 | 2 | 4 | 8,
                           backing: NSBackingStoreType.Buffered, defer: true);
        
        win.title = "Add a Vehicule";
        win.center();
        
        let butcar = NSButton(frame: NSMakeRect(150,50,90,30))
        butcar.title = "adding a car"
        butcar.target = self
        butcar.action = #selector(AppDelegate.myAction(_:))
        win.contentView!.addSubview(butcar)
        
        let buttruck = NSButton(frame: NSMakeRect(300,50,90,30))
        buttruck.title = "adding a Truck"
        buttruck.target = self
        buttruck.action = #selector(AppDelegate.myAction2(_:))
        win.contentView!.addSubview(buttruck)
        
        cbox = NSComboBox(frame: NSMakeRect(400,100,150,30))
        cbox.addItemWithObjectValue("CarH-blue")
        cbox.addItemWithObjectValue("CarH-cream")
        cbox.addItemWithObjectValue("CarH-darkblue")
        cbox.addItemWithObjectValue("CarH-green")
        cbox.addItemWithObjectValue("CarH-lightgreen")
        cbox.addItemWithObjectValue("CarH-marron")
        cbox.addItemWithObjectValue("CarH-orange")
        cbox.addItemWithObjectValue("CarH-rose")
        cbox.addItemWithObjectValue("CarH-violet")
        cbox.addItemWithObjectValue("CarH-X")
        cbox.addItemWithObjectValue("CarH-yellow")
        cbox.addItemWithObjectValue("CarV-blue")
        cbox.addItemWithObjectValue("CarV-green")
        cbox.addItemWithObjectValue("CarV-X")
        cbox.addItemWithObjectValue("DS21")
        cbox.addItemWithObjectValue("TruckH-blue")
        cbox.addItemWithObjectValue("TruckH-volet")
        cbox.addItemWithObjectValue("TruckH-lightgreen")
        cbox.addItemWithObjectValue("TruckH-yellow")
        cbox.addItemWithObjectValue("TruckV-blue")
        win.contentView!.addSubview(cbox)
        
        cboxX = NSComboBox(frame: NSMakeRect(0,100,150,30))
        cbox.placeholderString = "Image"
        cboxX.placeholderString = " Position x"
        cboxY = NSComboBox(frame: NSMakeRect(200,100,150,30))
        cboxY.placeholderString = "position Y"
        for j in 0..<vue.controleur.plateau.lignes{
            cboxX.addItemWithObjectValue(j)
        }
        for j in 0..<vue.controleur.plateau.colonnes{
            cboxY.addItemWithObjectValue(j)
        }
         cboxval = NSComboBox(frame: NSMakeRect(600,100,150,30))
        cboxval.placeholderString = "Orientation"
            cboxval.addItemWithObjectValue("v")
            cboxval.addItemWithObjectValue("h")
        
         win.contentView!.addSubview(cboxX)
         win.contentView!.addSubview(cboxY)
         win.contentView!.addSubview(cboxval)
        
        //Add the window to the main viewer
        window.addChildWindow(win, ordered:NSWindowOrderingMode.Above);
        
        let controller = NSWindowController(window: win);
        controller.showWindow(self);
        print("wind added")
        
    }
    
    func myAction(obj:AnyObject?){
        vue.controleur.addManualy(Int(cboxX.stringValue)!, y:Int(cboxY.stringValue)!, Vertical:vue.controleur.plateau.datbool((cboxval.stringValue)), image:cbox.stringValue,length:2)
         vue.draw(self.ImgArea)
        addcar = true
		supprimer.removeAllItems();
		for i in 1..<vue.controleur.plateau.cars.count{
			supprimer.addItemWithObjectValue("\(i)")
		}
        cbox.stringValue = ""
        cboxX.stringValue = ""
        cboxY.stringValue = ""
        cboxval.stringValue = ""
    }
    
    func myAction2(obj:AnyObject?){
        vue.controleur.addManualy(Int(cboxX.stringValue)!, y:Int(cboxY.stringValue)!, Vertical:vue.controleur.plateau.datbool((cboxval.stringValue)), image:cbox.stringValue,length:3)
        vue.draw(self.ImgArea)
        addcar = true
		supprimer.removeAllItems();
		for i in 1..<vue.controleur.plateau.cars.count{
			supprimer.addItemWithObjectValue("\(i)")
		}
        cbox.stringValue = ""
        cboxX.stringValue = ""
        cboxY.stringValue = ""
        cboxval.stringValue = ""
    }
    
    
  
    @IBAction func savelvl(sender: NSButton) {
       var strBuffer : String = ""
        
        if let aStreamReader = StreamReader(path:vue.controleur.plateau.path) {
            defer {
                aStreamReader.close()
            }
            while let line = aStreamReader.nextLine() {
                 strBuffer += line + "\r"
            }
        }
           strBuffer += "\r #Level \(vue.controleur.plateau.nbrlvl+1)\r"
        for i in 0..<vue.controleur.plateau.cars.count{
            strBuffer += "\(vue.controleur.plateau.cars[i].x) \(vue.controleur.plateau.cars[i].y) \(vue.controleur.plateau.cars[i].length) \(vue.controleur.plateau.first(vue.controleur.plateau.cars[i].isVertical)) \(vue.controleur.plateau.cars[i].orientation) \(vue.controleur.plateau.convertName(vue.controleur.plateau.cars[i].img)) \r"
        }
        strBuffer += "\r\r"
        
        if let sw = StreamWriter(path:"/Users/projet2a/Documents/test"){
            sw.println(strBuffer)
            sw.close()
        }
    }
	


	@IBAction func previousMove(sender: NSButton) {
        let nb = vue.controleur.plateau.nbrlvl
        if(!addcar){
            if(vue.current != vue.fin-1 && vue.controleur.calculed){
                vue.controleur.plateau = vue.controleur.tablist[vue.controleur.path[vue.current + 1]]
                vue.draw(self.ImgArea)
                vue.current = vue.current + 1
                memoMove.removeLast()
                plotmove()
            }
        }
        vue.controleur.plateau.nbrlvl = nb
	}

	@IBAction func nextMove(sender: NSButton) {
       let nb = vue.controleur.plateau.nbrlvl
        if(!addcar){
		if(vue.current != 0 && vue.controleur.calculed){
			vue.controleur.plateau = vue.controleur.tablist[vue.controleur.path[vue.current - 1]]
			vue.draw(self.ImgArea)
			vue.current = vue.current - 1
            memoMove.append(vue.controleur.tablist[vue.controleur.path[vue.current]].move)
            plotmove()
		}
        }
        vue.controleur.plateau.nbrlvl = nb
	}
    
    @IBAction func test(sender: NSButton) { // change cardeset
        let openDlg = NSOpenPanel()
        openDlg.allowsMultipleSelection = false
        openDlg.canChooseFiles = true
        openDlg.canChooseDirectories = false
        if openDlg.runModal() == NSOKButton{
            aaa = String(openDlg.URL!)
            
            for _ in 0..<7{
                aaa = String(aaa.characters.dropFirst())
            }
            vue.controleur.inipath(1,path:aaa)

        vue.draw(self.ImgArea)
        }
    }
    
    func plotmove(){
        afficheMove.stringValue = ""
        for i in 0..<memoMove.count{
            afficheMove.stringValue += " \(memoMove[i]) \n "
        }
    }
    
    

}