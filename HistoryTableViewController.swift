//
//  HistoryTableViewController.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/25.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RecordTable.staticRecordTabel.recordList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath)

        // Configure the cell...
		//定义变量
		let scoreLabel = cell.viewWithTag(1) as! UILabel
		let dateLabel = cell.viewWithTag(2) as! UILabel
		let dBullLabel = cell.viewWithTag(3) as! UILabel
		let sBullLabel = cell.viewWithTag(4) as! UILabel
		let recordRow = RecordTable.staticRecordTabel.recordList[indexPath.row]
		
		//分数
		scoreLabel.text = String(recordRow.score)
		
		//日期
		let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd HH:mm", options: 0, locale: NSLocale.currentLocale())
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = dateFormat
		dateLabel.text = dateFormatter.stringFromDate(recordRow.date)
		
		//大小红心
		dBullLabel.text = "🔴" + String(recordRow.dBull)
		sBullLabel.text = "🔵" + String(recordRow.sBull)
		
		return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
			RecordTable.staticRecordTabel.recordList.removeAtIndex(indexPath.row)
			RecordTable.saveSelf()
			
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
