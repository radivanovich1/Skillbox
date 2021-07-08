//
//  Weather16.swift
//  12.6
//
//  Created by user on 19.05.21.
//

import Foundation


class Weather7{
    
    let tempepature: Double
    let windSpeed: Double
    let date: String
    
    init?(data: NSDictionary) {
        guard  let date = data["dt"] as? Int,
               let temp = data["temp"] as? NSDictionary,
               let dayTemp = temp["day"] as? Double,
               let windSpeed = data["wind_speed"] as? Double
            else{ return nil}
        self.tempepature = dayTemp
        self.windSpeed = windSpeed
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd"
        self.date  = dayTimePeriodFormatter.string(from: NSDate(timeIntervalSince1970: Double(date)) as Date)
    }
  
        
    
}
