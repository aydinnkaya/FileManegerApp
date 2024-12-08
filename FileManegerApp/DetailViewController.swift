//
//  DetailViewController.swift
//  FileManegerApp
//
//  Created by Aydın KAYA on 8.12.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }


    }
    


    
}
