//
//  ViewController.swift
//  SwiftTodo
//
//  Created by 石井晃 on 2014/06/03.
//  Copyright (c) 2014年 exilias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoObjects = [];
    @IBOutlet var tableView : UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
    }
    
    
    func reloadData() {
        todoObjects = Todo.MR_findAll()
        tableView.reloadData()
    }
    

    @IBAction func didTouchAddButton(sender : AnyObject) {
        let sampleTodo: Todo = Todo.MR_createEntity() as Todo   // エンティティーを作成する
        sampleTodo.title = "title: \(NSDate.date())"            // 日付をタイトルにセット
        sampleTodo.timeStamp = NSDate.date()                    // 現在時刻をセット
        
        // CoreDataに保存する（永続化）
        sampleTodo.managedObjectContext.MR_saveToPersistentStoreAndWait()
        
        reloadData()
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return todoObjects.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TodoCell")
        
        cell.text = todoObjects[indexPath.row].title
        cell.detailTextLabel.text = "\(todoObjects[indexPath.row].timeStamp)"
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

