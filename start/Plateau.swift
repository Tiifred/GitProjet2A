//
//  Plateau.swift
//  start
//
//  Created by Projet 2A on 03/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

var abc=""



class Plateau{
    let lignes = 6
    let colonnes = 6
   var cars = [Car]()
    var table = [[Int]]()
    
    init(){
        self.table = [[Int]](count:lignes, repeatedValue:[Int](count: colonnes, repeatedValue:-1))
        
    }


    func update(){
        //if(cars[i].canMove){
            table  = [[Int]](count:lignes, repeatedValue:[Int](count: colonnes, repeatedValue:-1))
            for i in 0..<cars.count{
                if(cars[i].isVertical){
                    for j in 0..<cars[i].length{
                        table[cars[i].x+j][cars[i].y] = cars[i].Id
                    }
                }else{
                    for k in 0..<cars[i].length{
                        table[cars[i].x][cars[i].y+k] = cars[i].Id
                    }
                }
            }
       // }
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
}