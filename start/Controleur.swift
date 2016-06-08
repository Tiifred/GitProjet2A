//
//  Controleur.swift
//  start
//
//  Created by Projet 2A on 06/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

import Foundation

protocol Copyable {
	init(instance: Self)
}

extension Copyable {
	func copy() -> Self {
		return Self.init(instance: self)
	}
}

class Controleur{
	var tablist : Array<Plateau> = Array()
    var current : Array<Plateau> = Array()
    var next : Array<Plateau> = Array()
	var plateau = Plateau(lvl:1)
	var b = true
	var path = [Int]()
	var sol = Plateau(lvl:1)
    var stop = 0
	var calculed = false
    var found = false
	var add = false
	
	init(){
		tablist.append(self.plateau)
	}
	
	func createPath(){
		if(found){
			for k in 0..<tablist.count{
				tablist[k].ID = k
			}
			
			var varpapa :Int   // key papa
			var varid = sol.ID // varid = position
			var dadID = 0                           // position papa
			path.append(varid)
			while(tablist[varid].key != stop){
				varpapa = tablist[varid].papa
				for k in 0..<tablist.count{
					if(tablist[k].key == varpapa){
						dadID = tablist[k].ID
					}
				}
				varid = tablist[dadID].ID
				path.append(varid)
			}
		}
	}
	
	func mooving(){
		
        var count1 = 0
        var counter = 0
		
        var exist = false
        
        let nee = tablist[0].tryy(tablist[0])
        current.append(nee)
        stop = nee.key
        
		while(b){
            var pos = 0
            counter = tablist.count
			
            if(counter != 1){
                current.removeAll()
                for c in 0..<next.count{
                    let ne = next[c].tryy(next[c])
                    current.append(ne)
                }
                next.removeAll()
            }
  
            if(count1<counter && b ){
                for z in 0..<current.count{
                    if (b){
						for i in 0..<plateau.cars.count{
							if (plateau.cars[i].isVertical){
								for j in 1..<plateau.colonnes {
										if (current[z].cars[i].isAllowed("plus", val: j)){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].movePlus(j)
											tmp.papa = current[z].key
											tmp.move = "car \(i+1) : plus (\(j)) "
											tmp.update()
                                            exist = false
											pos = 0
											//on détermine la position à laquelle sera le plateau
											for ind2 in 0..<tablist.count{
												if(tablist[ind2].key < tmp.key){
													pos += 1
												}
												else {
													break
												}
											}
											
											//On test si le tableau exist
											if(pos<tablist.count){
												if ((tmp.key == tablist[pos].key)){
													exist = true
												}
											}
											
											
											if(!exist){
												if(pos<tablist.count){
													tablist.insert(tmp, atIndex: pos)
												}
												else{
													tablist.append(tmp)
												}
												next.append(tmp)
												
												if(tmp.isSol()){
													print ("solution trouvé")
													sol = tmp
													b = false
													print(tmp.afficheTab())
												}
											}
											exist = false
										}
											
											// si on ne peux pas deplacer x , on ne peux pas de x+1 donc break
										else {
											break
									}
								}
								
								
								for j in 1..<plateau.colonnes {
										if (current[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.move = "car \(i+1) :  moins (\(j)) "
											tmp.update()
                                            exist = false
											pos = 0
											for ind2 in 0..<tablist.count{
												if(tablist[ind2].key < tmp.key){
													pos += 1
												}
												else {
													break
												}
											}
											if(pos<tablist.count){
												if ((tmp.key == tablist[pos].key)){
													exist = true
												}
											}
											if(!exist){
												if(pos<tablist.count){
													
													tablist.insert(tmp, atIndex: pos)
												}
												else{
													tablist.append(tmp)
													
												}
												next.append(tmp)
												if(tmp.isSol()){
													print ("solution trouvé")
													sol = tmp
													b = false
													print(tmp.afficheTab())
												}
											}
											exist = false
										}
											
										else {
											break
									}
								}
							}
							else{
								for j in 1..<current[z].lignes{
										if (current[z].cars[i].isAllowed("plus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].movePlus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.update()
											tmp.move = "car \(i+1) : plus (\(j))"
                                            exist = false
											pos = 0
											for ind in 0..<tablist.count{
                                                if(tmp.key <= tablist[ind].key){
												if ( (tmp.key == tablist[ind].key) && !exist){
													exist = true
													break
												}
                                               }
											}
											if(!exist){
                                                
                                                pos=0
                                                for ind2 in 0..<tablist.count{
                                                    if(tablist[ind2].key < tmp.key){
                                                        pos += 1
                                                    }
                                                }
                                                if(pos<tablist.count){
                                                    
                                                    tablist.insert(tmp, atIndex: pos)
                                                }
                                                else{
                                                    tablist.append(tmp)
                                                    
                                                }
                                                next.append(tmp)
												if(tmp.isSol()){
                                                    found = true
													b = false
                                                    sol = tmp
												}
											}
											exist = false
										}
									
										if (current[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.update()
											tmp.move = "car \(i+1) : moins (\(j))"
                                            exist = false
											for ind in 0..<tablist.count{
                                                if(tmp.key <= tablist[ind].key){
												if ( (tmp.key == tablist[ind].key) && !exist){
													exist = true
													
													break

												}
                                                }
											}
											if(!exist){
                                                
                                               pos = 0
                                                for ind2 in 0..<tablist.count{
                                                    if(tablist[ind2].key < tmp.key){
                                                        pos += 1
                                                    }
                                                }
                                                if(pos<tablist.count){
                                                   
                                                    tablist.insert(tmp, atIndex: pos)
                                                }
                                                else{
                                                    tablist.append(tmp)
                                                    
                                                }
                                                 next.append(tmp)
												if(tmp.isSol()){
                                                    found = true
													sol = tmp
													b = false
												}
											}
											exist = false
										}
								}
							}
						}
					}
				}// END for z
				count1 += 1
			}
			else {
				b = false
			}
		} // END WHILe
		calculed = true
	}


    func addManualy(x:Int, y:Int, Vertical:Bool, image:String, length:Int){
        var i = 0
		var okk = true
        i = plateau.cars.count + 1
        let c = Car(Id: i, length: length, X: x, Y: y, isVertical: Vertical, p: plateau, ori: "r", img: image)
        plateau.update()
        for k in 0..<length{
            if (!c.isVertical && plateau.table[c.x][c.y+k] != -1){
               okk = false
            }
             if (c.isVertical && plateau.table[c.x+k][c.y] != -1) {
                okk = false
            }
        }
        if(okk){
            plateau.cars.append(c)
            plateau.update()
            tablist = [Plateau]()
            current = [Plateau]()
            next = [Plateau]()
            b = true
            path = [Int]()
            sol = Plateau(lvl:1)
            stop = 0
            calculed = false
            tablist.append(self.plateau)
			add = true
            
        }
		else{
			add = false
		}
    }

	
	func nextlvl(){
		if(plateau.lvl1<plateau.nbrlvl){
           let nb = plateau.nbrlvl
			tablist = [Plateau]()
			current = [Plateau]()
			next = [Plateau]()
			plateau = Plateau(lvl:plateau.lvl1+1)
			b = true
			path = [Int]()
			sol = Plateau(lvl:plateau.lvl1+1)
			stop = 0
			tablist.append(plateau)
			plateau.lecture()
			calculed = false
            plateau.nbrlvl = nb
		}
	}
	
	func previouslvl(){
		if(plateau.lvl1>1){
            let nb = plateau.nbrlvl
			tablist = [Plateau]()
			current = [Plateau]()
			next = [Plateau]()
			plateau = Plateau(lvl:plateau.lvl1-1)
			b = true
			self.path = [Int]()
			sol = Plateau(lvl:plateau.lvl1-1)
			stop = 0
			tablist.append(plateau)
			plateau.lecture()
			calculed = false
            plateau.nbrlvl = nb
		}
	}
	
	
	
	func inilvl(val:Int){
		if((val)<plateau.nbrlvl+1 && (val)>0 ){
            let nb = plateau.nbrlvl
			tablist = [Plateau]()
			current = [Plateau]()
			next = [Plateau]()
			plateau = Plateau(lvl:val)
			b = true
			path = [Int]()
			sol = Plateau(lvl:val)
			stop = 0
			tablist.append(plateau)
			plateau.lecture()
			calculed = false
            plateau.nbrlvl = nb
			
		}
	}
	func inipath(val:Int, path:String){
		if((val)<plateau.nbrlvl+1 && (val)>0 ){
            let nb = plateau.nbrlvl
			tablist = [Plateau]()
			current = [Plateau]()
			next = [Plateau]()
			plateau = Plateau(lvl:val,path : path)
			b = true
			self.path = [Int]()
			sol = Plateau(lvl:val, path:path)
			stop = 0
			tablist.append(plateau)
			plateau.lecture()
			calculed = false
            plateau.nbrlvl = nb
			
		}
	}
	
	func create(){
		tablist = [Plateau]()
		next = [Plateau]()
		b = true
		path = [Int]()
		stop = 0
        for _ in 0..<plateau.cars.count-1{
		plateau.cars.removeLast();
        }
		plateau.cars[0].y=0
		tablist.append(self.plateau)
		plateau.update()

		calculed = false
	}

	
}
 