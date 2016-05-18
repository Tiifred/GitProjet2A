//
//  WriteIn.swift
//  start
//
//  Created by Projet on 18/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation
import Cocoa

class WriteIn : NSObject {
	
	
	var textEditingImage:NSImage = NSImage(named: "NSFontPanel")!
	
	var preferencesOptionTableImageList : [[String:NSImage]]
	
	override init() {
		preferencesOptionTableImageList = [["image":textEditingImage]]
		super.init()
 }
}