//
//  GameBrain.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/22.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import Foundation

class GameBrain : NSObject, NSCoding {
	var score = 0
	var round = 0
	var marksArray : [String]
	
	override init(){
		marksArray=[String]()
		for _ in 0 ... 23 {
			marksArray.append("⚫️")
		}
	}
	
	func generateMarksString() -> String {
		var marksString=""
		for i in 0 ... 23 {
			marksString += marksArray[i]
			if i==5 || i==11 || i==17 {
				marksString += "\n"
			}
		}
		return marksString
	}
	
	func addScore(scoreToAdd : Int){
		if round > 23 {
			return
		}
		
		score += scoreToAdd
		switch scoreToAdd {
		case 50 :
			marksArray[round] = "🔴"
		case 25 :
			marksArray[round] = "🔵"
		default :
			marksArray[round] = "⚪️"
		}
		round += 1
	}
	
	func undo(){
		if round <= 0 {
			return
		}
		
		round -= 1
		let currentMark = marksArray[round]
		switch currentMark {
		case "🔴" :
			score -= 50
		case "🔵" :
			score -= 25
		default :
			break
		}
		marksArray[round] = "⚫️"
	}
	
	func restart(){
		if round <= 0 {
			return
		}
		
		round = 0
		score = 0
		for i in 0 ... 23 {
			marksArray[i] = "⚫️"
		}
	}
	
	func save(){
		//保存一条RecordRow
		let newRecordRow = RecordRow()
		for i in 0 ... 23 {
			switch marksArray[i] {
			case "🔴" :
				newRecordRow.dBull += 1
			case "🔵" :
				newRecordRow.sBull += 1
			default :
				break
			}
		}
		newRecordRow.score = self.score
		
		//保存RecordTable
		RecordTable.staticRecordTabel.dBullCount += newRecordRow.dBull
		RecordTable.staticRecordTabel.sBullCount += newRecordRow.sBull
		RecordTable.staticRecordTabel.gamePlayed += 1
		RecordTable.staticRecordTabel.recordList.append(newRecordRow)
	}
	
	//数据存储
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(score, forKey: "score")
		aCoder.encodeObject(round, forKey: "round")
		aCoder.encodeObject(marksArray, forKey: "marksArray")
	}
	
	required init?(coder aDecoder: NSCoder) {
		score = aDecoder.decodeObjectForKey("score") as! Int
		round = aDecoder.decodeObjectForKey("round") as! Int
		marksArray = aDecoder.decodeObjectForKey("marksArray") as! [String]
	}
}