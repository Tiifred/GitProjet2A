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


class Controleur {
	var tablist = [Plateau]()
    var current = [Plateau]()
    var next = [Plateau]()
	var plateau = Plateau()
	var b = true
	var path = [Int]()
    var sol = Plateau()
    var stop = 0
	
    
    
	init(){
		tablist.append(self.plateau)
	}
	
	func createPath(){
		print("******* Reconstitution  *********")
        for k in 0..<tablist.count{
            tablist[k].ID = k
        }
        
		var varpapa :Int   // key papa
		var varid = sol.ID // varid = position
        var dadID = 0                           // position papa
		print(tablist[varid].move)
		print("\(tablist[varid].afficheTab())")
		while(tablist[varid].key != stop){
			varpapa = tablist[varid].papa
            for k in 0..<tablist.count{
                if(tablist[k].key == varpapa){
                    dadID = tablist[k].ID
                }
            }
			varid = tablist[dadID].ID
			path.append(varid)
			print(tablist[varid].move)
			print("\(tablist[varid].afficheTab())")
		}
		print("il y a finalement \(path.count)  deplacements necessaires")
        
	}
	
	func mooving(){
        
		
		//tmp = self.plateau
		print("starting ")
        var count1 = 0
        var counter = 0
        var mem = [Int]()
        
        mem.append(0)
        mem.append(counter)
        var exist = false
        
        var nee = tablist[0].tryy(tablist[0])
        current.append(nee)
        stop = nee.key
        print(nee.key)
        
		while(b){
            var pos = 0
            counter = tablist.count
            print("\(counter)")
            if(counter != mem[mem.count-1]){
                mem.append(counter)
            }
            
            if(counter != 1){
                current.removeAll()
                for c in 0..<next.count{
                    var ne = next[c].tryy(next[c])
                    current.append(ne)
                }
                next.removeAll()
            }
            
            
            
            
            if(count1<counter && b ){
                for z in 0..<current.count{//numero du plateau dans la liste
                    if (b){
						for i in 0..<plateau.cars.count{ // pour chaque vehicule
							if (plateau.cars[i].isVertical && b){
								for j in 1..<plateau.colonnes { // j : toutes la valeurs possible de deplacement
									//if(tablist[z].cars[i].x + tablist[z].cars[i].length + j <= tablist[z].colonnes && b){
										if (current[z].cars[i].isAllowed("plus", val: j) && b ){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].movePlus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.move = "car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)"
											tmp.update()
                                            exist = false
											for ind in 0..<tablist.count{
                                                
                                                if(tmp.key <= tablist[ind].key){
                                                    if ( (tmp.key == tablist[ind].key) && !exist){
													/*print(tmp.afficheTab())
													print(tablist[ind].afficheTab())
													print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")*/
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
													print ("solution trouvé")
													sol = tmp
                                                    b = false
													print(tmp.afficheTab())
												}
												//				print(tmp.afficheTab())
												//				print("plateau \(tmp.ID) added : car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									//}
									//if(current[z].cars[i].x - j >= 0 && b ){
										if (current[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.move = "car :\(i+1) mouvement vertical moins de \(j) avec papa \(tmp.papa)"
											tmp.update()
                                          //  pos = 0
                                            exist = false
											for ind in 0..<tablist.count{
                                                if(tmp.key <= tablist[ind].key){
                                                    if ( (tmp.key == tablist[ind].key) && !exist){
                                                     //   pos += 1
                                                        exist = true
                                                
                                                        break
													
													/*print(tmp.afficheTab())
													print(tablist[ind].afficheTab())
													print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")*/
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
													print ("solution trouvé")
													sol = tmp
													b = false
													print(tmp.afficheTab())
												}
												//			print(tmp.afficheTab())
												//			print("plateau \(tmp.ID) added : car :\(i+1) mouvement vertical moins de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									//}
								}
							}
							if (!(current[z].cars[i].isVertical) && b){
								for j in 1..<current[z].lignes{
								//	if(tablist[z].cars[i].x+tablist[z].cars[i].length+j <= tablist[z].lignes && b){
										if (current[z].cars[i].isAllowed("plus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].movePlus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.update()
											tmp.move = "car :\(i+1) mouvement horizontal plus de \(j) avec papa \(tmp.papa)"
                                          //  pos = 0
                                            exist = false
											for ind in 0..<tablist.count{
                                                if(tmp.key <= tablist[ind].key){
												if ( (tmp.key == tablist[ind].key) && !exist){
                                           //         pos += 1
													exist = true
												
													break
													//							print("exist")
													//							print(tmp.afficheTab())
													//							print(tablist[ind].afficheTab())
													//							print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
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
													print ("solution trouvé")
													b = false
													print(tmp.afficheTab())
                                                    sol = tmp
												}
												//						print(tmp.afficheTab())
												//						print("plateau \(tmp.ID) added : car :\(i+1) mouvement horizontal plus de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									//}
									//if(current[z].cars[i].y - j >= 0 && b){
									
										if (current[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = current[z].tryy(current[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = current[z].key
											tmp.update()
											tmp.move = "car :\(i+1) mouvement horizontal moins de \(j) avec papa \(tmp.papa)"
                                          //  pos = 0
                                            exist = false
											for ind in 0..<tablist.count{
                                                if(tmp.key <= tablist[ind].key){
												if ( (tmp.key == tablist[ind].key) && !exist){
                                          //          pos += 1
                                                    
													exist = true
													
													break
													//							print("exist")
													//							print(tmp.afficheTab())
													//							print(tablist[ind].afficheTab())
													//							print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
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
													print ("solution trouvé")
													sol = tmp
													b = false
													print(tmp.afficheTab())
												}
												//						print(tmp.afficheTab())
												//						print("plateau \(tmp.ID) added : car :\(i+1) mouvement horizontal moins de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
										
										
									//}
								}
								
							}
						}
						
					}
				}// END for z

                
				count1 += 1
				print("count incr \(count1)")
			}
			else {
				b = false
				print("pas de solution")
            
			}
		} // END WHILe
	}
}