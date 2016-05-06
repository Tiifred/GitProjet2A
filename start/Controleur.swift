//
//  Controleur.swift
//  start
//
//  Created by Projet 2A on 06/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

class Controleur {
    var plateau = Plateau()

    
    
    
    func update(){
        
        plateau.table  = [[Int]](count:plateau.lignes, repeatedValue:[Int](count: plateau.colonnes, repeatedValue:-1))
        
        for i in 0..<plateau.cars.count
        {
            if(plateau.cars[i].isVertical)
            {
                for j in 0..<plateau.cars[i].length
                {
                    plateau.table[plateau.cars[i].x+j][plateau.cars[i].y] = plateau.cars[i].Id
                }
            }
            else
            {
                for k in 0..<plateau.cars[i].length
                {
                    plateau.table[plateau.cars[i].x][plateau.cars[i].y+k] = plateau.cars[i].Id
                }
            }
        }
    }
    
    func afficheTab()->String{
        update()
        abc=""
        for i in 0..<plateau.lignes {
            for j in 0..<plateau.colonnes {
                abc += " '\(plateau.table[i][j]) '"
            }
            abc += "\n"
        }
        return abc
        
    }
    
    func datbool(s:String)->Bool{           // (WARNING: A DEPLACER DANS CATCHLVL) Sert a verifier si la voiture est horizontal ou vertical, on s'en sert pour l'instant que dans la focntion lecture.
        if(s == "h"){
            return false
        }
        return true
    }

  

    func lecture(lvl:Int){
        
        let deflvl = catchlvl(lvl)
        var tablvl = deflvl.lines
        for i in 1..<tablvl.count{
            plateau.cars.append(Car(Id:i,length: Int(tablvl[i].words()[2])!,X:Int(tablvl[i].words()[0])!,Y:Int(tablvl[i].words()[1])!, isVertical: (datbool(tablvl[i].words()[3])), p: plateau))
        }
        
    }
    
    func catchlvl(lvl:Int)->String{
        var strBuffer : String = ""
        var copy = false
        
        
        if let aStreamReader = StreamReader(path:"/Users/projet2a/Documents/CardSet-1") {
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
                
                strBuffer += line + "\r"
                
            }
        }
        return strBuffer + "\n"
    }

}

    
