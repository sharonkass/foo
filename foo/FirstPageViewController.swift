//
//  FirstPageViewController.swift
//  foo
//
//  Created by Sharon Kass on 1/24/17.
//  Copyright © 2017 RoboTigers. All rights reserved.
//

import UIKit
import CoreData

class FirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("in viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationVc = segue.destination
        if let echoVc = destinationVc as? EchoViewController {
            echoVc.navigationItem.title = "Echo Scene"
            //echoVc.dataForLabel = "Set by first page"
            
            // Read the echo text from the data store and start the page with the last value entered
            var echoArray: [NSManagedObject] = []
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Echo")
            do {
                echoArray = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            print("echo array size \(echoArray.count)")
            for anEcho in echoArray as! [Echo] {
                print("\(anEcho.text)")
            }
            let lastEcho = echoArray[echoArray.count-1] as? Echo
            echoVc.dataForLabel = (lastEcho?.text)!
            
        }
    }
    

}
