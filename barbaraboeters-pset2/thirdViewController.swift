//
//  thirdViewController.swift
//  barbaraboeters-pset2
//
//  Created by Barbara Boeters on 10-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    
    var storyUser: String?
    var story: Story!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var storyWindow: UITextView!
    @IBAction func clearStory(_ sender: Any) {
        if resetButton.isSelected == true {
            story.clear()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storyWindow.text = storyUser
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
