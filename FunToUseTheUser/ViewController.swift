//
//  ViewController.swift
//  FunToUseTheUser
//
//  Created by Harold Davis on 1/27/17.
//  Copyright © 2017 Harold Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let urlStringWithUserData = "http://jsonplaceholder.typicode.com/users"
    
 
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var nameArray = [String]()
    var addressArray = [String]()//dictionaryWithValues(forKeys: ["street", "suite", "city", "zipcode"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJsonWithURL() {
        let url = NSURL(string: urlStringWithUserData)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, responds, error) -> Void in
            
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                //print(jsonObject!.value(forKey: "id"))
                if let userArray = jsonObject!.value(forKey: "username") as? NSArray {
                    for user in userArray {
                        if let userDict = user as? NSDictionary {
                            if let name = userDict.value(forKey:"username") {
                                self.nameArray.append(name as! String)
                                print(name)
                            }
                            if let address = userDict.value(forKey:"address") {
                                
                                
                                print(address)
                            }
                            
                            OperationQueue.main.addOperation({
                                    self.tableView.reloadData()
                            })
                            
                        }
                        
                    }
                    
                    
                }
                
            }
        }).resume()
        
    }
    
    
    func downloadJsonWithTask(){
        let url = NSURL(string: urlStringWithUserData)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, responds, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(jsonData)
            
        }).resume()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.username.text = nameArray[indexPath.row]
        cell.address.text = addressArray[indexPath.row]
        
        return cell
    }
    
    
    
    /*   } override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
