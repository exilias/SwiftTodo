//
//  ViewController.swift
//  SwiftTodo
//
//  Created by 石井晃 on 2014/06/03.
//  Copyright (c) 2014年 exilias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var todoObjects: [Todo] = [];
    @IBOutlet private var tableView : UITableView!
    
    
    // MARK: - View cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reloadData()
    }
    
    
    // MARK: - User interaction

    @IBAction private func didTouchAddButton(sender : AnyObject) {
        var sampleTodo: Todo = Todo.MR_createEntity() as Todo   // エンティティーを作成する Create an entity
        sampleTodo.title = "title: \(NSDate())"            // 日付をタイトルにセット Set the title to date string
        sampleTodo.timeStamp = NSDate()                   // 現在時刻をセット Set the timeStamp to current time
        
        // CoreDataに保存する（永続化）
        // Save sampleTodo to persistent store
        sampleTodo.managedObjectContext?.MR_saveToPersistentStoreAndWait()
        
        self.reloadData()
    }
    
    
    // MARK: - Databasing
    
    private func reloadData() {
        todoObjects = Todo.MR_findAll() as [Todo]
        tableView.reloadData()
    }
    
    
    // MARK: - TableView data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoObjects.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TodoCell") as UITableViewCell
        
        cell.textLabel?.text = todoObjects[indexPath.row].title
        cell.detailTextLabel?.text = "\(todoObjects[indexPath.row].timeStamp)"
        
        return cell
    }
    
    
    // MARK: - TableView delegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Entityの削除 delete entity
            let todoObject = todoObjects[indexPath.row]
            todoObject.MR_deleteEntity()
            
            todoObject.managedObjectContext?.MR_saveToPersistentStoreAndWait()
            
            todoObjects = Todo.MR_findAll() as [Todo]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }

    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete;
    }
}

