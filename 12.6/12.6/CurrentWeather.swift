
import Foundation

class CurrentWeather{
    
    let tempepature: Double
    let windSpeed: Double
    let cityName: String
    
    init?(data: NSDictionary) {
        guard  let cityName = data["name"] as? String,
               let main = data["main"] as? NSDictionary,
               let tempepature = main["temp"] as? Double,
               let wind = data["wind"] as? NSDictionary,
               let windSpeed = wind["speed"] as? Double
            else{ return nil}
        self.tempepature = tempepature
        self.windSpeed = windSpeed
        self.cityName = cityName
    }
    
    
}
