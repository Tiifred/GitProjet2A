//
//  Plateau.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

var abc=""



class Plateau : Copyable{
    var ID = 0
    let lignes = 6
    let colonnes = 6
   var cars = [Car]()
    var table = [[Int]]()
    var papa = -1
	var move = ""
    var key = -1
    var corresp=[String]()
	var lvl = 1
    
    
    
    
	init(lvl:Int){
        self.table = [[Int]](count:lignes, repeatedValue:[Int](count: colonnes, repeatedValue:-1))
		self.lvl = lvl
    }
	
    required init(instance: Plateau) {
        self.table = instance.table
        self.cars = instance.cars
    }
    
    func update(){
        key = 0
            table  = [[Int]](count:lignes, repeatedValue:[Int](count: colonnes, repeatedValue:-1))
            for i in 0..<cars.count{
                if(cars[i].isVertical){
                   key = key * self.lignes+1-cars[i].length + cars[i].x
                    for j in 0..<cars[i].length{
                        table[cars[i].x+j][cars[i].y] = cars[i].Id
                    }
                }else{
                   for k in 0..<cars[i].length{
                        table[cars[i].x][cars[i].y+k] = cars[i].Id
                    }
                    key = key * self.colonnes+1-cars[i].length + cars[i].y
                }
            }
    
    }
    
    
    func afficheTab()->String{
        update()
        abc=""
        for i in 0..<lignes {
            for j in 0..<colonnes {
                abc += " '\(table[i][j]) '"
            }
            abc += "\n"
        }
        return abc
    }
    
    func isEqual(p:Plateau)->Bool{
        var result = true
        for i in 0..<lignes{
            for j in 0..<colonnes{
                if((table[i][j]) != p.table[i][j]){
                result = false
                }
            }
        }
        
        
        return result
    }
    
	func lecture(){
		
        let deflvl = catchlvl(self.lvl)
        var tablvl = deflvl.lines
        for i in 1..<tablvl.count{
			cars.append(Car(Id:i,length: Int(tablvl[i].words()[2])!,X:Int(tablvl[i].words()[0])!,Y:Int(tablvl[i].words()[1])!, isVertical: (datbool(tablvl[i].words()[3])), p: self, ori:(tablvl[i].words()[4]) ,img:foundimg(Int(tablvl[i].words()[5])!)))
        }
        
    }
    
    func catchlvl(lvl:Int)->String{
        var strBuffer : String = ""
        var copy = false
        var ini = true
        var tmp=""
        var count = 0
        
        
        if let aStreamReader = StreamReader(path:"/Users/projet2a/Documents/CardSet-1") {
            ///Users/projet2a/Documents/projet/start/CardSet-1
            defer {
                aStreamReader.close()
            }
            while let line = aStreamReader.nextLine() {
                if(line.matchPattern("level \(lvl)")) {
                    strBuffer = ""
                    copy = true
                }
                
                if(line == "" && copy) {
                    copy = false
                    return strBuffer
                }
                if(ini){
                    if(count != 0){
                        tmp += line + "\r"
                    }
                    count += 1
                }
                if(line == "" && ini) {
                    ini = false
                    corresp = tmp.lines
                }
                
                strBuffer += line + "\r"
                
            }
        }
        return strBuffer + "jbh \n"
    }

    func datbool(s:String)->Bool{
        if(s == "h"){
            return false
        }
        return true
    }
    
    
    func tryy(p:Plateau)->Plateau{
		let newPlat = Plateau(lvl:p.lvl)
        for o in 0..<p.cars.count{
			newPlat.cars.append(Car(Id: p.cars[o].Id, length: p.cars[o].length, X: p.cars[o].x, Y: p.cars[o].y, isVertical: p.cars[o].isVertical, p: newPlat,ori:p.cars[o].orientation, img:p.cars[o].img))
        }
		newPlat.update()
        return newPlat
    }
    
    func isSol()->Bool{
        /*var seeking = true
        for i in 1..<self.colonnes - self.cars[0].y {
            if (((self.table[self.cars[0].x ][self.cars[0].y + i]) != -1) && ((self.table[self.cars[0].x][self.cars[0].y + i]) != 1)) {
                seeking = false
            }
        }*/
        var seeking = false
        if(self.cars[0].y == 4) {
            seeking = true
        }
        return seeking
    }
    
    func foundimg(val:Int)->String{
        var original = ""
        for i in 0..<corresp.count{
            if (Int(corresp[i].words()[0]) == val) {
                let length = corresp[i].words()[0].length
             original = corresp[i]
                for _ in 0...length{
                    original = String(original.characters.dropFirst()) // ello
                }
                print("founded \(val)")
                return original
            }
            
        }
        print("not founded")
        return ""
    }
    
}