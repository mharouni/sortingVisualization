//
//  ViewController.swift
//  Visuals
//
//  Created by Mohamed Harouni on 4/5/19.
//  Copyright © 2019 Mohamed Harouni. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	@IBOutlet weak var imageOne: UIImageView!
	@IBOutlet weak var imageTwo: UIImageView!
	@IBOutlet weak var imageThree: UIImageView!
	@IBOutlet weak var imageFour: UIImageView!
	@IBOutlet weak var imageFive: UIImageView!
	@IBOutlet weak var imageSix: UIImageView!
	@IBOutlet weak var imageSeven: UIImageView!
	var loc :CGPoint = CGPoint(x: 0.0, y: 0.0)
	var array: [UIImageView] = []
	var n: Int = 6
	var j :Int = 0
	override func viewDidLoad() {
		super.viewDidLoad()
		array.append(imageOne)
		array.append(imageTwo)
		array.append(imageThree)
		array.append(imageFour)
		array.append(imageFive)
		array.append(imageSix)
		array.append(imageSeven)
		scramble()
	
	}
	
	@IBAction func Button(_ sender: UIButton) {
		
		if sender.tag == 10{
				if j <= n {
					print(array[j].tag, array[j+1].tag, separator: "...")
					if (array[j].tag > array[j+1].tag){
						swapBubble()
						}
					j = j + 1
					}
			if (j == n){
				j = 0
			}
				}
		else if sender.tag == 30 {
			scramble()

		}

			}
	
	
	
	
	func swapBubble(){
		var temp: UIImageView
		temp = array[j]
		array[j]=array[j+1]
		array[j+1] = temp
		loc = array[j+1].center
		array[j+1].center = array[j].center
		array[j+1].setNeedsDisplay()
		array[j].center = loc
		
		
		
	}
	
	
	func scramble(){
		var s1:Int
		var s2:Int
		for _ in 1 ... 30 {
			s1 = Int.random(in: 0 ... 6)
			s2 = Int.random(in: 0 ... 6)
			swap(s1: s1, s2: s2)
		}
		
		
	}
	func swap(s1:Int,s2:Int) {
		var temp: UIImageView
		temp = array[s1]
		array[s1]=array[s2]
		array[s2] = temp
		loc = array[s2].center
		array[s2].center = array[s1].center
		array[s2].setNeedsDisplay()
		array[s1].center = loc
	}
	
	
	
	
	
	
		
	}
	
	
	
	



	


