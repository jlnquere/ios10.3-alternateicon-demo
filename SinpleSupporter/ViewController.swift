//
//  ViewController.swift
//  SinpleSupporter
//
//  Created by Julien on 26/01/2017.
//  Copyright © 2017 Sinplicity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        
        guard UIApplication.shared.supportsAlternateIcons else {
            let alert = UIAlertController(title: "Error", message: "Sorry but your device do not support alternate icons :(", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.show(alert, sender: nil)
            return
        }
        
        var iconName:String? = nil
        switch segmentedControl.selectedSegmentIndex {
            case 1:
                iconName = "fr"
            case 2:
                iconName = "de"
            case 3:
                iconName = "it"
            default:
                break
        }
        
        UIApplication.shared.setAlternateIconName(iconName) { (error) in
            if let error = error {
                print("err: \(error)")
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var selectedIndex = 0
        
        if UIApplication.shared.alternateIconName == "it" {
            print("Viva italia")
        } else if UIApplication.shared.alternateIconName == "fr" {
            print("Allez les bleus!")
        }
        
        let currentIcon = UIApplication.shared.alternateIconName ?? ""
        
        switch currentIcon {
        case "fr":
            selectedIndex = 1
        case "de":
            selectedIndex = 2
        case "it":
            selectedIndex = 3
        default:
            break
        }
        
        segmentedControl.selectedSegmentIndex = selectedIndex
    }
}

