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
	var j: Int = 0
	var nS: Int = 0
	var jS: Int = 0
	var min: Int = 0
	var flag: Bool = true
	var checker: Int = 6
	var swapChekcer : Int = 0
	var selectionChecker: Bool = false
	var timer: Timer!
	
	
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
		scramble()
		min = nS
		
	
	}
	
	
	
	
	@IBAction func buttondown(_ sender: UIButton) {
		
		if sender.tag == 10{
			bubbleStep()
			timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(bubbleStep), userInfo: nil, repeats: true)
		}
		else if sender.tag == 20 {
			selectionStep()
			timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(selectionStep), userInfo: nil, repeats: true)
		}
		
	}
	
	
	@IBAction func buttonup(_ sender: UIButton) {
		timer.invalidate()
		scramble()
		j = 0
		nS = 0
		jS = 0
		min = nS
		color()
		flag = true
		selectionChecker = false
	}
	func color() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

		for c in 0 ... 6 {
			self.array[c].backgroundColor = UIColor.white
		}
		}
	}
	func recolor(_ r1: Int, _ r2: Int) {
	DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
	self.array[r1].backgroundColor = UIColor.blue
	self.array[r2].backgroundColor = UIColor.blue
	}
	}
	
	@IBAction func Button(_ sender: UIButton) {
		j = 0
		color()
		flag = true
		selectionChecker = false
		if sender.tag == 30 {
			scramble()
		}
		else if sender.tag == 40 {
			reverse()
		}

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
	func swap(s1:Int, s2:Int) {
		var temp: UIImageView
		temp = array[s1]
		array[s1]=array[s2]
		array[s2] = temp
		loc = array[s2].center
		array[s2].center = array[s1].center
		array[s2].setNeedsDisplay()
		array[s1].center = loc
	}
	
	@objc func bubbleStep(){
		color()
		if flag == true {
			checker = checker + 1
		if j <= n {

			print(array[j].tag, array[j+1].tag, separator: "...")
			if (array[j].tag > array[j+1].tag){
				swap(s1: j, s2: j+1)
				swapChekcer = swapChekcer + 1
				recolor(j,j+1)
			}
			recolor(j,j+1)
			j = j + 1
		}
			if (j == n){
			j = 0
			}
			if checker % 6 == 0{
				checker = 0
				if swapChekcer == 0{
					flag = false
				}
				swapChekcer = 0
				
			}
			
		}
		else {
			print("Done")
		}
	}
	
	@objc func selectionStep() {
		color()
		if selectionChecker != true {
			print(jS,nS,min, separator: "...")
			if (array[jS+1].tag < array[min].tag) {
				//swap(s1: min, s2: jS+1)
				min = jS + 1
			}
			recolor(min,jS+1)
			jS = jS + 1
			if (jS == 6) {
				swap(s1:min, s2: nS)
				nS = nS + 1
				min = nS
				jS = nS
				if nS == 6 {
					selectionChecker = true
					
				}
				
				
			}
		
		}
		
	}
	
	func reverse() {
		for k in (1 ... 6).reversed() {
			for z in 0 ... k-1 {
				if array[z].tag < array[z+1].tag {
					swap(s1: z, s2: z+1)
				}
			}
		}
	}
		
	}
	
	
	
	



	


