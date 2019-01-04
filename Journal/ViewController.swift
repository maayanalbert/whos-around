//
//  ViewController.swift
//  whos-around
//
//  Created by Maayan Albert on 1/3/19.
//  Copyright © 2019 Maayan Albert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationStatusLabel: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    //        appDelegate.handleExitEvent(forRegion:appDelegate.geofenceRegion)
  }
  
  func changeLocationStatusLabel(to contents: String){
    locationStatusLabel.text = contents
  }
  
  
}
