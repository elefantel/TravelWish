//
//  CountryProfileViewController.swift
//  TravelWish
//
//  Created by Mpendulo Ndlovu on 2016/04/08.
//  Copyright © 2016 Elefantel. All rights reserved.
//

//Taken from REST Countries API http://restcountries.eu/
//https://github.com/fayder/restcountries/wiki/API-1.x.x

import UIKit

class CountryProfileViewController: UIViewController {
    @IBOutlet weak var _countryProfileData: UITextView!
    var countryInfo = NSDictionary()
    var _countryInfoText : String?
    @IBOutlet weak var _countryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountryProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadCountryProfile() {
        let dataFetcher = DataFetcher()
        
        var countryProfile : String = ""
        
        if let country = countryInfo["name"] as? String {
            _countryName.text = country;
        }
        
        if let region = countryInfo["region"] as? String {
            countryProfile += ("Region: " + region + "\n\n")
        }
        
        if let subRegion = countryInfo["subregion"] as? String {
            countryProfile += ("Subregion: " + subRegion + "\n\n")
        }
        
        if let capital = countryInfo["capital"] as? String {
            countryProfile += ("Capital: " + capital + "\n\n")
        }
        
        if let nativeName = countryInfo["nativeName"] as? String {
            countryProfile += ("Native name: " + nativeName + "\n\n")
        }

        if let nationality = countryInfo["demonym"] as? String {
            countryProfile += ("Nationality: " + nationality + "\n\n")
        }
        
        if let altSPellings = countryInfo["altSpellings"] as? [String] {
            countryProfile += ("Alternative names: ")
            
            for altSPelling in altSPellings {
                countryProfile += ("<" + altSPelling + "> ")
            }
            countryProfile += ("\n\n");
        }
        
        if let translations = countryInfo["translations"] as? NSDictionary {
            countryProfile += ("Translations: ")
            
            for (language, translation) in translations {
                var languageArray : [String] = []
                languageArray.append(language as! String)
                let translatedLanguages = dataFetcher.languagesWithLanguageCodes(languageArray)
                countryProfile += ("<" + (translatedLanguages[0] as! String) + " : " + (translation as? String)! + "> ")
            }
            countryProfile += ("\n\n")
        }
        
        if let population = countryInfo["population"] as? Int {
            countryProfile += ("Population: " + (String)(population) + "\n\n")
        }
        
        if let latlng = countryInfo["latlng"] as? [Double] where (latlng.count == 2) {
            countryProfile += ("LatLong: " + (String)(latlng[0]) + ", " + (String)(latlng[1]) + "\n\n")
        }
        
        if let area = countryInfo["area"] as? Double {
            countryProfile += ("Area: " + (String)(area) + "\n\n")
        }
        
        if let gini = countryInfo["gini"] as? Double {
            countryProfile += ("Gini: " + (String)(gini) + "\n\n")
        }
        
        if let timezones = countryInfo["timezones"] as? [String] where (timezones.count > 0){
            countryProfile += ("Timezones: ")
        
            for timezone in timezones {
                countryProfile += ("<" + timezone + "> ")
            }
            countryProfile += ("\n\n");
        }
        
        if let borders = countryInfo["borders"] as? [String] where (borders.count > 0) {
            countryProfile += ("Borders: ")
            
            let borderCountries = dataFetcher.countriesWithCountryCodesForRegion(countryInfo["region"] as? String, countryCodes: borders)
            for border in borderCountries {
                countryProfile += ("<" + (border as! String) + "> ")
            }
            
            countryProfile += ("\n\n");
        }
        
        
        if let callingCodes = countryInfo["callingCodes"] as? [String] where (callingCodes.count > 0) {
            countryProfile += ("Calling code: +" + (String)(callingCodes[0]) + "\n\n")
        }
        
        if let topLevelDomain = countryInfo["topLevelDomain"] as? [String] where (topLevelDomain.count > 0) {
            countryProfile += ("Top level domain: " + (String)(topLevelDomain[0]) + "\n\n")
        }
        
        if let currencies = countryInfo["currencies"] as? [String] where (currencies.count > 0) {
            countryProfile += ("Currencies: ")
            
            for currency in currencies {
                countryProfile += ("<" + currency + "> ")
            }
            countryProfile += ("\n\n");
        }
        
        if let languagesCodes = countryInfo["languages"] as? [String] where (languagesCodes.count > 0) {
            countryProfile += ("Languages: ")
            
            let languages = dataFetcher.languagesWithLanguageCodes(languagesCodes)
            
            for language in languages {
                
                countryProfile += ("<" + (language as! String) + "> ")
            }
            countryProfile += ("\n\n");
        }
        
        _countryProfileData!.text = countryProfile
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
