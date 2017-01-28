//
//  ViewController.swift
//  FunToUseTheUser
//
//  Created by Harold Davis on 1/27/17.
//  Copyright © 2017 Harold Davis. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource {
    
    let urlWithUserData = "http://jsonplaceholder.typicode.com/users"
    
    class addressInfo {
        var street: String = ""
        var suite: String = ""
        var city: String = ""
        var zipcode: String = ""
        
        init(street: String, suite: String, city: String, zipcode: String) {
            self.street = street
            self.suite = suite
            self.city = city
            self.zipcode = zipcode
        }
        
       /* var geo = {
            var lng: String
            var lat: String
        }*/
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var nameArray = [String]()
    var collectionOfAddresses = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJsonWithURL() {
        let url = NSURL(string: urlWithUserData)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, responds, error) -> Void in
            
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                
                if let userNames = jsonObject!.value(forKey: "username") as? NSArray {
                    for userItem in userNames {
                        self.nameArray.append(userItem as! String)
                        print(userItem)
                    }
                }
                
                if let userAddresss = jsonObject!.value(forKey: "address") as? NSArray {
                    for usersAddress in userAddresss {
                        let street = (usersAddress as AnyObject).value(forKey: ("street" as? String)!)
                        let suite = (usersAddress as AnyObject).value(forKey: ("suite" as? String)!)
                        let city = (usersAddress as AnyObject).value(forKey: ("city" as? String)!)
                        let zipcode = (usersAddress as AnyObject).value(forKey: ("zipcode" as? String)!)

                        let newAddress = addressInfo(street: street as! String, suite: suite as! String, city: city as! String, zipcode: zipcode as! String)
                        self.collectionOfAddresses.append(self.stringConverter(address: newAddress))
                    }
                    
                }
                
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
        
    }
    
    
    func downloadJsonWithTask(){
        let url = NSURL(string: urlWithUserData)
        
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
       cell.address.text = collectionOfAddresses[indexPath.row]
        
        return cell
    }
    
    func stringConverter(address: addressInfo) -> (String) {
        return "\(address.street) \(address.suite) \(address.city) \(address.zipcode)"
    }
    
    
}
