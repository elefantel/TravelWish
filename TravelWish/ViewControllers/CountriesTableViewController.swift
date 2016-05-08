//
//  CountriesTableViewController.swift
//  TravelWish
//
//  Created by Mpendulo Ndlovu on 2016/04/07.
//  Copyright © 2016 Elefantel. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    var _countriesProfilesArray = NSArray()
    var region: String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadCountries()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func loadCountries()
    {
        let dataFetcher = DataFetcher()
        _countriesProfilesArray = dataFetcher.countriesForRegion(region!)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return _countriesProfilesArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("countriesCellIdentifier", forIndexPath: indexPath)

        guard let countryProfile = _countriesProfilesArray.objectAtIndex(indexPath.row) as? [String: AnyObject],
        let country = countryProfile["name"] as? String
        else
        {
        return cell
        }
        
        cell.textLabel?.text =  country

        return cell
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let indexPath = self.tableView.indexPathForSelectedRow;
        guard let countryProfile = _countriesProfilesArray.objectAtIndex(indexPath!.row) as? [String: AnyObject]
        else
        {
        return
        }
        
        let countriesTableViewController = segue.destinationViewController as? CountryProfileViewController;
        countriesTableViewController!.countryInfo = countryProfile
    }

}
