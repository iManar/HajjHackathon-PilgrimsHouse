//
//  ConversaationTableViewController.swift
//  سلتي
//
//  Created by Zeinab Reda on 10/24/17.
//  Copyright © 2017 Orange. All rights reserved.
//

import UIKit

class ConversationTableViewController: UIViewController {
    
    @IBOutlet weak var messagesTB: UITableView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageTF: UITextField!
    
    var allMessagesArr:[String] = []
    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: .UIKeyboardWillHide, object: nil)
        
        messagesTB.tableFooterView = UIView(frame: CGRect.zero)
        
//        messagesTB.register(UINib(nibName: "MessageViewCell", bundle: nil), forCellReuseIdentifier: "messageCell")
//        
//        messagesTB.rowHeight = UITableViewAutomaticDimension
//        messagesTB.estimatedRowHeight = 80

        
    }
    
    @IBAction func writeMessage(_ sender: Any) {
        self.view.endEditing(true)
        
        if messageTF.text?.characters.count == 0
        {
            
            
            
            Helper.showFloatAlert(title: "من فضلك،اكتب الرساله", subTitle: "", type: Constants.AlertType.AlertError)

            
        }
        else
        {
         
            self.allMessagesArr.append(messageTF.text!)
            self.messagesTB.reloadData()
            self.messageTF.text = ""

        }
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification){
        self.removeLabelNoData()
        
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        bottomConstraint.constant = keyboardHeight
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification){
       
        bottomConstraint.constant = 0
    }
    
}
extension ConversationTableViewController:UITableViewDelegate , UITableViewDataSource
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMessagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageViewCell
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"

        cell.messages.text = allMessagesArr[indexPath.row]
        cell.messageTime.text = "منذ  " + formatter.string(from: date)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
   
}
