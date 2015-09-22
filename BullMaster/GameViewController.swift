//
//  GameViewController.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/21.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//一些控件
	@IBOutlet weak var marksLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	
	//一些控件方法
	@IBAction func dBullPressed(sender: UIButton) {
	}
	
	@IBAction func sBullPressed(sender: UIButton) {
	}
	
	@IBAction func missPressed(sender: UIButton) {
	}
	
	@IBAction func undoPressed(sender: UIButton) {
	}
	
	@IBAction func restartPressed(sender: UIButton) {
	}
	
	@IBAction func menuPressed(sender: UIButton) {
	}
	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
