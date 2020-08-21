//
//  BFTableViewController.swift
//  Butterfly-CoreData
//
//  Created by Chris on 2020/8/21.
//  Copyright © 2020 Butterfly. All rights reserved.
//

import UIKit
import Alamofire

class BFTableViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let API = BFApiManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        API.fetchData()
    }


    @IBAction func addNewPO(_ sender: Any) {
        
    }
}
