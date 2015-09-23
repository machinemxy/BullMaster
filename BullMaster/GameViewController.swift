//
//  GameViewController.swift
//  BullMaster
//
//  Created by 马学渊 on 15/9/21.
//  Copyright © 2015年 马学渊. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	var gameBrain = GameBrain()
	let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] + "gameBrain.dat"
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//读取进展到途中的游戏
		if let tempGameBrain : GameBrain = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? GameBrain{
			gameBrain = tempGameBrain
		}
		
        // 更新Labels
		refreshLabels()
    }
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		NSKeyedArchiver.archiveRootObject(gameBrain, toFile: filePath)
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
		gameBrain.addScore(50)
		refreshLabels()
		checkWetherTheGameIsEnded()
	}
	
	@IBAction func sBullPressed(sender: UIButton) {
		gameBrain.addScore(25)
		refreshLabels()
		checkWetherTheGameIsEnded()
	}
	
	@IBAction func missPressed(sender: UIButton) {
		gameBrain.addScore(0)
		refreshLabels()
		checkWetherTheGameIsEnded()
	}
	
	@IBAction func undoPressed(sender: UIButton) {
		gameBrain.undo()
		refreshLabels()
	}
	
	@IBAction func restartPressed(sender: UIButton) {
		gameBrain.restart()
		refreshLabels()
	}
	
	//一些私人方法
	private func refreshLabels(){
		scoreLabel.text = "\(gameBrain.score)"
		marksLabel.text = gameBrain.generateMarksString()
	}
	
	private func checkWetherTheGameIsEnded(){
		if gameBrain.round > 23 {
			let alertController = UIAlertController(title: "Game Set", message: "You got \(gameBrain.score)", preferredStyle: .Alert)
			alertController.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: nil))
			self.presentViewController(alertController, animated: true, completion: nil)
		}
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
