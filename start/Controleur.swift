//
//  Controleur.swift
//  start
//
//  Created by Projet 2A on 06/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

class Controleur{
    var tablist = [Plateau]()
    var plateau = Plateau(dad:0)
    var va = [1,2]
    
    init(){
        tablist.append(self.plateau)
    }
    
    func mooving(){
        var tmp = Plateau(dad:0)
        tmp.cop(self.plateau)
        print("starting ")
        for i in 0..<plateau.cars.count{
            if (plateau.cars[i].isVertical){
                for j in 1..<plateau.lignes - 2{
                    if(plateau.cars[i].x + j <= plateau.lignes){
                        print("\(j)")
                        if (plateau.cars[i].isAllowed("plus", val: j)){
                            tmp.cars[i].movePlus(j+1)
                            tmp.ID = tablist.count
                            tablist.append(tmp)
                            print("plateau \(tmp.ID) added mouvement de \(j)")
                        }
                    }
                }
            }
        }
        print("end process")
    }
}