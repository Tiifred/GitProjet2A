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

    
}