//
//  ViewController.swift
//  foo
//
//  Created by Sharon Kass on 1/21/17.
//  Copyright © 2017 RoboTigers. All rights reserved.
//

import UIKit
import CoreData

class EchoViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var dataForLabel : String = ""

    @IBAction func echo(_ sender: UIButton) {
        print("Button pressed")
        dataForLabel = text.text!
        label.text = dataForLabel
        
        // write the value to the data store
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let echo = Echo(context: managedContext)
        echo.text = dataForLabel
        echo.created = NSDate()
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save the echo. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("in viewDidLoad")
        label.text = dataForLabel;
    }


}

