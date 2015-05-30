//
//  InputDetailViewController.swift
//  SwiftTodo
//
//  Created by 石井晃 on 2014/06/03.
//  Copyright (c) 2014年 exilias. All rights reserved.
//

import UIKit

class InputDetailViewController: UIViewController {

    @IBOutlet private var titleTextField : UITextField!


    // MARK: - User interaction
    
    @IBAction func didTouchDoneButton(sender : AnyObject) {
        
        if titleTextField.text.isEmpty {
            var alertView: UIAlertView = UIAlertView()
            alertView.title = "エラー"
            alertView.message = "タイトルが入力されていません"
            alertView.addButtonWithTitle("閉じる")
            alertView.show();
            
            return
        }
        
        // Entityを追加
        var sampleTodo = Todo.MR_createEntity() as! Todo
        sampleTodo.title = titleTextField.text
        sampleTodo.timeStamp = NSDate()
        
        // CoreDataに保存する（永続化）
        sampleTodo.managedObjectContext?.MR_saveToPersistentStoreAndWait()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
