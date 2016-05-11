//
//  Car.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

protocol Copying {
    init(original: Self)
}

extension Copying {
    func copy() -> Self {
        return Self.init(original: self)
    }
}

class Car{
    var Id = 0
    var length = 0
    var x = 0
    var y = 0
    var isVertical = true
    var p = Plateau()
    var orientation = ""
    var img = ""
    
    
    
    init (Id:Int,length:Int,X:Int,Y:Int,isVertical:Bool,p:Plateau,ori:String,img:String) {
        self.Id=Id
        self.length=length
        self.x=X
        self.y=Y
        self.isVertical=isVertical
        self.p=p
        self.img=img
        self.orientation = ori
    }
    
    func movePlus(val:Int){
       // var ok = true
        if(!(self.isVertical)){
            self.y = self.y+val
        }
        else {
            self.x = self.x+val
        }
        p.update()
    }
    
    
    func moveMinus(val:Int){
        if(!(self.isVertical)){
            self.y = self.y-val
        }
        else {
            self.x = self.x-val
        }
        p.update()

    }
    
    func affiche()->String{
    
        return "car \(Id), x\(x) , y\(y) "
    }
    
    func isAllowed(s:String, val:Int)->Bool{
        var result : Bool = false
        var ok = true
        if(s == "plus"){
            if(!(self.isVertical)){
                if(self.y + val + self.length<=p.colonnes){
                    for k in 1..<val + 1 + self.length {
                        if (((p.table[self.x][self.y + k - 1]) != -1) && ((p.table[self.x][self.y + k - 1]) != self.Id)) {
                            ok=false
                        }
                    }
                    if(ok) {
                        return true
                    }
                }
                ok = true
            }
            else {
                if(self.x+val+self.length<=p.lignes){
                    for k in 1..<val+1 + self.length {
                        if (((p.table[self.x + k - 1][self.y]) != -1) && ((p.table[self.x + k-1][self.y]) != self.Id)) {
                            ok=false
                        }
                    }
                    if(ok) {
                        return true
                    }
                }
            }
            return false
        }
        else if (s == "minus"){
            if(!(self.isVertical)){
                if(self.y-val>=0){
                    for k in 1..<val+1{
                        if (((p.table[self.x][self.y-k]) != -1) && ((p.table[self.x][self.y-k]) != self.Id)) {
                            ok=false
                        }
                    }
                    if(ok) {
                        return true
                    }
                }
                ok = true
            }
            else {
                if(self.x-val>=0){
                    for k in 1..<val+1{
                        if (((p.table[self.x-k][self.y]) != -1) && ((p.table[self.x-k][self.y]) != self.Id)) {
                            ok=false
                        }
                    }
                    if(ok) {
                        return true
                    }
                }
            }
            return false

        }
        return false
    }
}

