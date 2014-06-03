//
//  InputDetailViewController.swift
//  SwiftTodo
//
//  Created by 石井晃 on 2014/06/03.
//  Copyright (c) 2014年 exilias. All rights reserved.
//

import UIKit

class InputDetailViewController: UIViewController {

    @IBOutlet var titleTextField : UITextField


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTouchDoneButton(sender : AnyObject) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
