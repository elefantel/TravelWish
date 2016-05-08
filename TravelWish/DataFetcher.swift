//
//  DataFetcher.swift
//  TravelWish
//
//  Created by Mpendulo Ndlovu on 2016/04/07.
//  Copyright © 2016 Elefantel. All rights reserved.
//

import Foundation

/*
Refer to http://roadfiresoftware.com/2015/10/how-to-parse-json-with-swift-2/
Also note https://github.com/explore for parsing large JSON files
*/

class DataFetcher
{
    func countriesForRegion(region: String?)->NSArray
    {
        let countriesUrl = NSBundle.mainBundle().URLForResource(region, withExtension: "json")
        let countriesData = NSData(contentsOfURL: countriesUrl!)
        
        do
        {
            let decodedJson = try NSJSONSerialization.JSONObjectWithData(countriesData!, options: [.AllowFragments]) as! NSArray
            return decodedJson
        }
        catch
        {
            print("Error serializing JSON: \(error)")
        }
        
    let emptyDictionary = NSArray()
    return emptyDictionary
    }
    
    func languagesWithLanguageCodes(languageCodes: [String])->NSMutableArray
    {
        let countriesUrl = NSBundle.mainBundle().URLForResource("lang-codes", withExtension: "json")
        let countriesData = NSData(contentsOfURL: countriesUrl!)
        let languages : NSMutableArray = []
        
        do
        {
            let decodedJson = try NSJSONSerialization.JSONObjectWithData(countriesData!, options: [.AllowFragments]) as! NSArray
            
            for languageCode in languageCodes {
                for languageDictionary in decodedJson {
                    if languageDictionary["alpha2"] as! String == languageCode {
                        languages.addObject((languageDictionary as! Dictionary)["English"]!)
                        break;
                    }
                }
            }
            
            return languages
        }
        catch
        {
            print("Error serializing JSON: \(error)")
        }
        
    return languages
    }
    
    func countriesWithCountryCodesForRegion(region: String?, countryCodes: [String])->NSMutableArray
    {
        let countriesUrl = NSBundle.mainBundle().URLForResource(region, withExtension: "json")
        let countriesData = NSData(contentsOfURL: countriesUrl!)
        let countries : NSMutableArray = []
        
        do
        {
            let decodedJson = try NSJSONSerialization.JSONObjectWithData(countriesData!, options: [.AllowFragments]) as! NSArray
            
            for countryCode in countryCodes {
                for countryProfile in decodedJson {
                    if countryProfile["alpha3Code"] as! String == countryCode {
                        countries.addObject((countryProfile as! Dictionary)["name"]!)
                        break;
                    }
                }
            }
            
            return countries
        }
        catch
        {
            print("Error serializing JSON: \(error)")
        }
        
    return countries
    }
}