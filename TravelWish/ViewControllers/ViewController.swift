//
//  ViewController.swift
//  TravelWish
//
//  Created by Mpendulo Ndlovu on 2016/04/07.
//  Copyright © 2016 ComScie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        var countriesProfilesArray = NSArray()
        let dataFetcher = DataFetcher()
        countriesProfilesArray = dataFetcher.countriesForRegion("countries-all")
        
        guard let countryProfile = countriesProfilesArray[20] as? [String: AnyObject]
        else
        {
        return
        }
        
        print("Country Info: \(countryProfile)")

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

