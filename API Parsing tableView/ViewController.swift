//
//  ViewController.swift
//  API Parsing tableView
//
//  Created by Somnath on 12/07/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var album = [Album]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: Convert url into String
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        // Creates a URL instance from the provided string >> and its an optional(?)
        if let url = URL(string: urlString)
        {
            // 1.
            //MARK: URLSessionConfiguration (.default)
            let session = URLSession(configuration: .default)
            
            // 2.
            //MARK: URLSessionTask (.dataTask)
            // dataTask used for GET request to retrive data from server to memory
            // (data) -> http code #200 or (error) -> http code #404 or (response) -> reason of error
            // you can give any custom names to data, response and error
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                // to convert data? to data we used unwrappedData
                if let unwrappedData = data{
                    //do {
                    if let album = try? JSONDecoder().decode([Album].self, from: unwrappedData) {
                        self.album = album
                    }
//                    } catch {
//                        print("Error: \(error.localizedDescription)")
//                    }
                    
                    
                    // 3 ways to show an error 1. Throw, 2. try? or try! & 3. try-catch block
                  //  if let jsonArray = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String: Any]]//typeCast -> convert jsonArray = string? to string|| Any is ised bcoz we dont know which type of data present
//                    {
//
//                    //MARK: Parsing
//                    var albumArray = [Album]()
//                        for dict in jsonArray{
//
//                            let postId = dict["postId"] as? Int
//                            let id = dict["id"] as? Int
//                            let name = dict["name"] as? String
//                            let email = dict["email"] as? String
//                            let body = dict["body"] as? String
//
//                            albumArray.append(Album(postId: postId ?? 0, id: id ?? 0, name: name ?? "", email: email ?? "", body: body ?? ""))
//
//                        } // scope of for dict in jsonArray
//
//                        self.album = albumArray
//
                        DispatchQueue.main.async //
                        {
                            self.tableView.reloadData()
                        }
//                    }//scope of if let jsonArray
                    
                }// scope of let unwrappedData
                
                else {
                    print("unable to unwrap data")
                }
                
            } //scope of let dataTask -> response will come in this completion box
            
            dataTask.resume()
            
        } //scope of let url
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
    } //scope of viewDidLoad

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as? myTableViewCell else{
            return UITableViewCell()
        }
        
        let albums = album[indexPath.row]
        cell.postId.text = String(albums.postId)
        cell.Id.text = String(albums.id)
        cell.name.text = albums.name
        cell.email.text = albums.email
        cell.body.text = albums.body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }

} //scope of class ViewController

