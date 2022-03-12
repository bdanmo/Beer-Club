//
//  DetailedBreweryViewController.swift
//  Beer Club
//
//  Created by Brendan Moran on 10/16/17.
//  Copyright © 2017 Brendan Moran. All rights reserved.
//

import UIKit

class DetailedBreweryViewController: UIViewController {

    @IBOutlet weak var breweryNameLabel: UILabel!
    @IBOutlet weak var tourInfoLabel: UILabel!
    @IBOutlet weak var breweryDescriptionLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    var breweryIndex: Int = 0
    let breweryList = BreweryList()
    var brewery: Brewery = Brewery(id: 1, name: "Birdsong", nickname: "Birdsong", logo: "birdsong.png", description: "Birdsong Brewing was founded in 2011 by a group of friends who share a love for both great beer and great people. We started with a five-gallon soup kettle and a vision inspired by some of our favorite craft breweries. The idea was simple: brew flavorful, unfiltered quality craft beer and bring that to Charlotte, NC.", tourTime: "Thursdays at 6:30pm", addressLink: "http://maps.apple.com/?address=1016,North+Davidson+Street,Charlotte,North+Carolina")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brewery = breweryList.breweries[breweryIndex]
        self.title = brewery.nickname
        breweryNameLabel.text = brewery.name
        tourInfoLabel.text = brewery.tourTime
        breweryDescriptionLabel.text = brewery.description
        logoImage.image = UIImage.init(named: brewery.logo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func mapsButton(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    @IBAction func addressButtonTappex(_ sender: Any) {
        if let url = URL(string: brewery.addressLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
