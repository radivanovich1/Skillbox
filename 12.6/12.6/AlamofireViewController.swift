//
//  AlamofireViewController.swift
//  12.6
//
//  Created by user on 19.05.21.
//

import UIKit

class AlamofireViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var windLable: UILabel!
    var weather: CurrentWeather?
    var weather7: [Weather7] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherLoader().loadCurrentWeather2 { weather in
            self.weather = weather
            self.tempLable.text = String( weather?.tempepature ?? 0)
            self.windLable.text = String( weather?.windSpeed ?? 0)
            self.nameLable.text = weather?.cityName
        }
        WeatherLoader().load7_2{ weatherArr in
            self.weather7 = weatherArr ?? self.weather7
            self.tableView.reloadData()
        }
    }
 
}
extension AlamofireViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather7.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Alamo") as! WeatherCell
        let weather = weather7[indexPath.row]
        cell.dateLabel.text = weather.date
        cell.tempLabel.text = String(weather.tempepature)
        cell.windLabel.text = String(weather.windSpeed)
        return cell
        
    }

}
