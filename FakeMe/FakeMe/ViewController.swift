//
//  ViewController.swift
//  FakeMe
//
//  Created by Maksim Akifev on 9/16/17.
//  Copyright © 2017 Maksim Akifev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personPicture: UIImageView!
    @IBOutlet weak var personInfo: UILabel!
    @IBAction func refresh(_ sender: UIButton) {
        
        let model = Model()
        personInfo.text = model.loadInfo()
        let pictureUrl = model.loadPicture()
        let url = URL(string: pictureUrl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        personPicture.image = UIImage(data: data!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
