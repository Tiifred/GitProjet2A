//
//  DnD.swift
//  start
//
//  Created by Projet 2A on 12/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation
import Cocoa

class DnD : NSImageView{
    var mouseDWN : NSEvent?
    
    
    override init(frame frameRect: NSRect){
        //self.acceptsFirstResponder
        super.init(frame: frameRect)
        self.registerForDraggedTypes([NSFilenamesPboardType,NSURLPboardType,NSPasteboardTypeTIFF])
    }
    required init?(coder:NSCoder){
        super.init(coder: coder)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        mouseDWN = theEvent
        self.print(theEvent)
        Swift.print(theEvent)
    }
    
}
