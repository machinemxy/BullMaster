//
//  RecordTable.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/23.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import Foundation

class RecordTable : NSObject, NSCoding{
	
	override init(){
		super.init()
	}
	
	static var staticRecordTabel = RecordTable()
	
	var dBullCount = 0
	var sBullCount = 0
	var gamePlayed = 0
	var recordList = [RecordRow]()
	
	var bullCount : Int {
		get {
			return dBullCount + sBullCount
		}
	}
	
	var dartsThrown : Int {
		get {
			return gamePlayed * 24
		}
	}
	
	var dBullRate : String {
		get {
			if dartsThrown == 0 {
				return "0"
			}else{
				let doubleRate = Double(dBullCount) * 100.0 / Double(dartsThrown)
				return String(format: "%.2f", doubleRate)
			}
		}
	}
	
	var sBullRate : String {
		get {
			if dartsThrown == 0 {
				return "0"
			}else{
				let doubleRate = Double(sBullCount) * 100.0 / Double(dartsThrown)
				return String(format: "%.2f", doubleRate)
			}
		}
	}
	
	var bullRate : String {
		get {
			if dartsThrown == 0 {
				return "0"
			}else{
				let doubleRate = Double(bullCount) * 100.0 / Double(dartsThrown)
				return String(format: "%.2f", doubleRate)
			}
		}
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(dBullCount, forKey: "dBullCount")
		aCoder.encodeObject(sBullCount, forKey: "sBullCount")
		aCoder.encodeObject(gamePlayed, forKey: "gamePlayed")
		aCoder.encodeObject(recordList, forKey: "recordList")
	}
	
	required init?(coder aDecoder: NSCoder) {
		dBullCount = aDecoder.decodeObjectForKey("dBullCount") as! Int
		sBullCount = aDecoder.decodeObjectForKey("sBullCount") as! Int
		gamePlayed = aDecoder.decodeObjectForKey("gamePlayed") as! Int
		recordList = aDecoder.decodeObjectForKey("recordList") as! [RecordRow]
	}
}