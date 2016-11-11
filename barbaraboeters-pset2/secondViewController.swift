//
//  secondViewController.swift
//  barbaraboeters-pset2
//
//  Created by Barbara Boeters on 10-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var story: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadStory()
    }
    
    // Loading the texfile
    func loadStory() {
        if let dir = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt") {
            print(dir)
            do {
                let text = try String(contentsOf: URL(string: "file://\(dir)")!, encoding: String.Encoding.utf8)
                story = Story(stream: text)
            } catch {
                print(error)
            }
        }
    }
    
    @IBOutlet weak var dataInputField: UITextField!
    @IBOutlet weak var wordsLeft: UILabel!

    
    @IBAction func ok(_ sender: Any) {
        // loop waarin je woorden blijft vragen zolang die nog nodig zijn
        if story.isFilledIn() == false {
            // als de user niks heeft ingevuld dan return
            if dataInputField.text != "" {
                // add word into placeholders array
                story.fillInPlaceholder(word: dataInputField.text!)
                dataInputField.text = ""
                dataInputField.placeholder = story.getNextPlaceholder()
                print(story.getPlaceholderRemainingCount())
                // pas counter aan en daarbij het label wordsLeft
                wordsLeft.text = String(story.getPlaceholderRemainingCount()) + " word(s) left"
            }
            else {
                return
            }
        }
        print(story.toString())
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? thirdViewController {
            thirdVC.storyUser = story.toString()
        }
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
