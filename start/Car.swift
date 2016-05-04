//
//  Car.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

class Car{
    var Id = 0
    var length = 0
    var x = 0
    var y = 0
    var isVertical = true
    
    
    
    init (Id:Int,length:Int,X:Int,Y:Int,isVertical:Bool) {
        self.Id=Id
        self.length=length
        self.x=X
        self.y=Y
        self.isVertical=isVertical
    }
    
    func movePlus(val:Int){
        if(self.isVertical){
            self.y = self.y+val
        }
        else {
            self.x = self.x+val
        }
    }
    
    
    func moveMinus(val:Int){
        if(self.isVertical){
            self.y = self.y-val
        }
        else {
            self.x = self.x-val
        }
    }
    
    func affiche()->String{
    
        return "car \(Id), x\(x) , y\(y) "
    }
}

