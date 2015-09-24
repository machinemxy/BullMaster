//
//  RecordRow.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/24.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import Foundation

class RecordRow : NSObject, NSCoding {
	
	override init() {
		super.init()
	}
	
	var date = NSDate()
	var score = 0
	var dBull = 0
	var sBull = 0
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(date, forKey: "date")
		aCoder.encodeObject(score, forKey: "score")
		aCoder.encodeObject(dBull, forKey: "dBull")
		aCoder.encodeObject(sBull, forKey: "sBull")
	}
	
	required init?(coder aDecoder: NSCoder) {
		date = aDecoder.decodeObjectForKey("date") as! NSDate
		score = aDecoder.decodeObjectForKey("score") as! Int
		dBull = aDecoder.decodeObjectForKey("dBull") as! Int
		sBull = aDecoder.decodeObjectForKey("sBull") as! Int
	}
}
