//
//  ViewController.swift
//  FileManegerApp
//
//  Created by Aydın KAYA on 16.11.2024.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true 
        
        let fm = FileManager.default  // Default fm object
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path) // Constant value Arrays(Collections)
        
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
                
    }
    
    // table view that triggers the request
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = pictures[indexPath.row]
        cell.contentConfiguration = content
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

