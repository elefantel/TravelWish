//
//  RegionsTableViewController.swift
//  TravelWish
//
//  Created by Mpendulo Ndlovu on 2016/04/07.
//  Copyright © 2016 Elefantel. All rights reserved.
//

import UIKit

class RegionsTableViewController: UITableViewController {

    var _regions = NSMutableArray()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadRegions()
    }
    
    private func loadRegions()
    {
        _regions.insertObject("Africa", atIndex: 0)
        _regions.insertObject("Americas", atIndex: 1)
        _regions.insertObject("Asia", atIndex: 2)
        _regions.insertObject("Europe", atIndex: 3)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch (section)
        {
            case 0:
                return _regions.count;
            default:
                return 0;
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("regionsCellIdentifier", forIndexPath: indexPath)

        cell.textLabel!.text = _regions.objectAtIndex(indexPath.row) as? String
        
        return cell
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let indexPath = self.tableView.indexPathForSelectedRow;
        let region = _regions.objectAtIndex(indexPath!.row) as? String;
        
        let countriesTableViewController = segue.destinationViewController as? CountriesTableViewController;
        countriesTableViewController!.region = region!;
    }

}
