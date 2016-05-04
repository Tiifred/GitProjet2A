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
    var p = Plateau()
    
    
    
    init (Id:Int,length:Int,X:Int,Y:Int,isVertical:Bool,p:Plateau) {
        self.Id=Id
        self.length=length
        self.x=X
        self.y=Y
        self.isVertical=isVertical
        self.p=p
    }
    
    func movePlus(val:Int){
        var ok = true
        if(!(self.isVertical)){
            if(self.y+val<=p.colonnes-1){
                for k in 0..<self.length+val{
                    if (((p.table[self.x][self.y+k]) != -1) && ((p.table[self.x][self.y+k]) != self.Id)) {
                        ok=false
                        print("i can't")
                    }
                }
                if(ok) {
                    self.y = self.y+val
                    print("it's okkkkkkkk")
                }
            }
            ok = true
        }
        else {
            if(self.y+val<=p.lignes-1){
                for k in 0..<self.length+val{
                    if (((p.table[self.x+k][self.y]) != -1) && ((p.table[self.x+k][self.y]) != self.Id)) {
                        ok=false
                        print("i can't")
                    }
                }
                if(ok) {
                    self.x = self.x+val
                    print("it's okkkkkkkk")
                }
            }
        }
        ok = true
    }
    
    
    func moveMinus(val:Int){
        var ok = true
        if(!(self.isVertical)){
            if(self.y+val<=p.colonnes-1){
                for k in 1..<val+1{
                    if (((p.table[self.x][self.y-k]) != -1) && ((p.table[self.x][self.y+k]) != self.Id)) {
                        ok=false
                        print("i can't")
                    }
                }
                if(ok) {
                    self.y = self.y-val
                }
            }
        }
        else {
            if(self.y+val<=p.lignes-1){
                for k in 1..<val+1{
                    if (((p.table[self.x-k][self.y]) != -1) && ((p.table[self.x+k][self.y]) != self.Id)) {
                        ok=false
                        print("i can't")
                    }
                }
                if(ok) {
                    self.x = self.x-val
                }
            }
        }
        ok = true
    }
    
    func affiche()->String{
    
        return "car \(Id), x\(x) , y\(y) "
    }
}

