//
//  ViewController.swift
//  Beer Club
//
//  Created by Brendan Moran on 10/16/17.
//  Copyright © 2017 Brendan Moran. All rights reserved.
//

import UIKit

class MasterBreweryViewController: UIViewController {
    
    //properties
   
  
    @IBOutlet weak var masterBrewView1: UIView!
    @IBOutlet weak var masterBrewView2: UIView!
    @IBOutlet weak var masterBrewView3: UIView!
    @IBOutlet weak var masterBrewView4: UIView!
    let breweries = BreweryList().breweries
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let breweryViews = [masterBrewView1, masterBrewView2, masterBrewView3, masterBrewView4]
        
        for index in 0..<breweryViews.count {
            let brewery = breweries[index]
            for subview in (breweryViews[index]?.subviews)! {  //you can programatically acess subviews (think of like child elements)
                if let label = subview as? UILabel {
                    
                    label.text = brewery.name
                }
                if let logo = subview as? UIImageView {
                    
                    logo.image = UIImage(named: brewery.logo)
                }
            }
        
            breweryViews[index]?.tag = index
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //functions and actions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "showBreweryDetail" {
            let detailedBreweryViewController = segue.destination as! DetailedBreweryViewController
            let breweryButton = (sender! as AnyObject).view as UIView
            detailedBreweryViewController.breweryIndex = breweryButton.tag
        }
    }
    
    @IBAction func breweryTapped(_ sender: Any) {
        performSegue(withIdentifier: "showDetailView", sender: sender)
    }
    
}

