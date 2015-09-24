//
//  SummaryViewController.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/24.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
	//一些控件
	@IBOutlet weak var bullCountLabel: UILabel!
	@IBOutlet weak var bullRateLabel: UILabel!
	@IBOutlet weak var dBullCountLabel: UILabel!
	@IBOutlet weak var dBullRateLabel: UILabel!
	@IBOutlet weak var sBullCountLabel: UILabel!
	@IBOutlet weak var sBullRateLabel: UILabel!
	@IBOutlet weak var gamePlayedLabel: UILabel!
	@IBOutlet weak var dartsThrownLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//设置控件显示
		bullCountLabel.text = String(RecordTable.staticRecordTabel.bullCount)
		bullRateLabel.text  = RecordTable.staticRecordTabel.bullRate + "%"
		dBullCountLabel.text = String(RecordTable.staticRecordTabel.dBullCount)
		dBullRateLabel.text = RecordTable.staticRecordTabel.dBullRate + "%"
		sBullCountLabel.text = String(RecordTable.staticRecordTabel.sBullCount)
		sBullRateLabel.text = RecordTable.staticRecordTabel.sBullRate + "%"
		gamePlayedLabel.text = String(RecordTable.staticRecordTabel.gamePlayed)
		dartsThrownLabel.text = String(RecordTable.staticRecordTabel.dartsThrown)
	}
}
