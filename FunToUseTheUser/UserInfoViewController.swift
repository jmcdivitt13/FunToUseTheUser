//
//  UserInfoViewController.swift
//  FunToUseTheUser
//
//  Created by Harold Davis on 1/28/17.
//  Copyright © 2017 Harold Davis. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBOutlet weak var usersFullName: UITextField!
    @IBOutlet weak var infoArea: UITextView!
    var selectedUser: String = "1"
    
    let postInfo = "http://jsonplaceholder.typicode.com/posts?userId="
    
    var postTitle = [String]()
    var postBody = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()

        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJsonWithURL() {
        let selectedUserPosts = "\(postInfo)\(selectedUser)"
        let url = NSURL(string: selectedUserPosts)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, responds, error) -> Void in
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
            
                if let postedTitle = jsonObject!.value(forKey: "title") as? NSArray {
                    for post in postedTitle {
                        self.postTitle.append(post as! String)
                        //print(post)
                    }
                }
                
                if let postedBody = jsonObject!.value(forKey: "body") as? NSArray {
                    for post in postedBody {
                        self.postTitle.append(post as! String)
                        //print(post)
                    }
                }
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()})
            }
            }).resume()
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = tableView.dequeueReusableCell(withIdentifier: "post") as! UserPostTableViewCell
        post.postTitle.text = postTitle[indexPath.row]
        post.postBody.text = postBody[indexPath.row]
        
        
        return post
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
