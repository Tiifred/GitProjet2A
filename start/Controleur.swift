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
	var tablist = [Plateau]()
	var plateau = Plateau()
	var b = true
	var path = [Int]()
	
	
	init(){
		tablist.append(self.plateau)
	}
	
	func createPath(){
		if(!b){
			
		print("******* Reconstitution  *********")
		var varpapa :Int
		var varid = tablist[tablist.count-1].ID
		print(tablist[varid].move)
		print("\(tablist[varid].afficheTab())")
		print (varid)
		path.append(varid)
			while(varid != 0){
				varpapa = tablist[varid].papa
				varid = tablist[varpapa].ID
				path.append(varid)
				print(tablist[varid].move)
				print("\(tablist[varid].afficheTab())")
				print (varid)
			}
		print("il y a finalement \(path.count) deplacement necessaire")
		}
	}
	
	func mooving(){
		
		//Users/projet2A/Documents/GitProjet2A/start/Controleur.swift
		//tmp = self.plateau
		print("starting ")
		var count1 = 0
		var counter = 0
		var mem = [Int]()
		
		mem.append(0)
		mem.append(counter)
		var exist = false
		//print(plateau.afficheTab())
		
		
		
		while(b){
			
			counter = tablist.count
			print("\(counter)")
			if(counter != mem[mem.count-1]){
			mem.append(counter)
			}
			if(count1<counter && b ){
				for z in mem[(mem.count) - 2]..<mem[(mem.count) - 1]{//numero du plateau dans la liste
					if (b){
						for i in 0..<plateau.cars.count{ // pour chaque vehicule
							if (plateau.cars[i].isVertical && b){
								for j in 1..<plateau.colonnes { // j : toutes la valeurs possible de deplacement
									//if(tablist[z].cars[i].x + tablist[z].cars[i].length + j <= tablist[z].colonnes && b){
										if (tablist[z].cars[i].isAllowed("plus", val: j) && b ){
											var tmp : Plateau
											tmp = tablist[z].tryy(tablist[z])
											tmp.cars[i].movePlus(j)
											tmp.ID = tablist.count
											tmp.papa = z
											tmp.move = "car :\(i+1) mouvement vertical plus de \(j) avec papa \(tablist[tmp.papa].afficheTab())"
											tmp.update()
											for ind in 0..<tablist.count{
												if ( tmp.isEqual(tablist[ind]) && !exist){
												
													/*print(tmp.afficheTab())
													print(tablist[ind].afficheTab())
													print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")*/
													exist = true
													break
												}
											}
											if(!exist){
												tablist.append(tmp)
												
												if(tmp.isSol()){
													print ("solution trouvé")
													print(tmp.ID)
													b = false
													print(tmp.afficheTab())
												}
												//				print(tmp.afficheTab())
												//				print("plateau \(tmp.ID) added : car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									//}
									if(tablist[z].cars[i].x - j >= 0 && b ){
										if (tablist[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = tablist[z].tryy(tablist[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = z
											tmp.move = "car :\(i+1) mouvement vertical moins de \(j) avec papa \(tmp.papa)"
											tmp.update()
											for ind in 0..<tablist.count{
												if ( tmp.isEqual(tablist[ind]) && !exist){
													exist = true
													
													break
													
													/*print(tmp.afficheTab())
													print(tablist[ind].afficheTab())
													print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")*/
												}
											}
											if(!exist){
												tablist.append(tmp)
												if(tmp.isSol()){
													print ("solution trouvé")
													print(tmp.ID)
													b = false
													print(tmp.afficheTab())
												}
												//			print(tmp.afficheTab())
												//			print("plateau \(tmp.ID) added : car :\(i+1) mouvement vertical moins de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									}
								}
							}
							if (!(tablist[z].cars[i].isVertical) && b){
								for j in 1..<tablist[z].lignes{
								//	if(tablist[z].cars[i].x+tablist[z].cars[i].length+j <= tablist[z].lignes && b){
										if (tablist[z].cars[i].isAllowed("plus", val: j) && b){
											var tmp : Plateau
											tmp = tablist[z].tryy(tablist[z])
											tmp.cars[i].movePlus(j)
											tmp.ID = tablist.count
											tmp.papa = z
											tmp.update()
											tmp.move = "car :\(i+1) mouvement horizontal plus de \(j) avec papa \(tmp.papa)"
											tmp.papa = z
											for ind in 0..<tablist.count{
												if ( tmp.isEqual(tablist[ind]) && !exist){
													exist = true
												
													break
													//							print("exist")
													//							print(tmp.afficheTab())
													//							print(tablist[ind].afficheTab())
													//							print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
												}
											}
											if(!exist){
												tablist.append(tmp)
												
												if(tmp.isSol()){
													print ("solution trouvé")
													print(tmp.ID)
													b = false
													print(tmp.afficheTab())
												}
												//						print(tmp.afficheTab())
												//						print("plateau \(tmp.ID) added : car :\(i+1) mouvement horizontal plus de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
									//}
									if(tablist[z].cars[i].y - j >= 0 && b){
									
										if (tablist[z].cars[i].isAllowed("minus", val: j) && b){
											var tmp : Plateau
											tmp = tablist[z].tryy(tablist[z])
											tmp.cars[i].moveMinus(j)
											tmp.ID = tablist.count
											tmp.papa = z
											tmp.update()
											tmp.move = "car :\(i+1) mouvement horizontal moins de \(j) avec papa \(tmp.papa)"
											tmp.papa = z
											for ind in 0..<tablist.count{
												if ( tmp.isEqual(tablist[ind]) && !exist){
													exist = true
													
													break
													//							print("exist")
													//							print(tmp.afficheTab())
													//							print(tablist[ind].afficheTab())
													//							print("plateau \(tmp.ID) exist  car :\(i+1) mouvement vertical plus de \(j) avec papa \(tmp.papa)")
												}
											}
											if(!exist){
												tablist.append(tmp)
												
												if(tmp.isSol()){
													print ("solution trouvé")
													print(tmp.ID)
													b = false
													print(tmp.afficheTab())
												}
												//						print(tmp.afficheTab())
												//						print("plateau \(tmp.ID) added : car :\(i+1) mouvement horizontal moins de \(j) avec papa \(tmp.papa)")
											}
											exist = false
										}
										
										
									}
								}
								
							}
						}
						
					}
				}// END for z
				
				for ka in 0..<tablist.count{
					print( "  \(tablist[ka].afficheTab())   \(tablist[ka].key) ")
				}
				
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