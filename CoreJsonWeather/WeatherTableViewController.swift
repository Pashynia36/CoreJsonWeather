//
//  WeatherTableViewController.swift
//  CoreJsonWeather
//
//  Created by Pavlo Novak on 3/22/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit
import Alamofire

class WeatherTableViewController: UITableViewController {
    
    let url: String = "http://samples.openweathermap.org/data/2.5/forecast?q=London,us&appid=b6907d289e10d714a6e88b30761fae22"
    var weather: MessageModel?
    var fixThis: Int = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshEm), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let i = weather?.list.count {
            return i
        } else if fixThis == 0 {
            let alert = UIAlertView()
            alert.title = "Greetings"
            alert.message = "Please, pull down the page."
            alert.addButton(withTitle: "Okay")
            alert.show()
            fixThis += 1
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        cell.prepareWeather(message: weather!, indexPath: indexPath.row)
        
        return cell
    }
    
    func decoder() {
        
        if let decodeURL = URL(string: url) {
            Alamofire.request(decodeURL).responseJSON { (response) in
                do {
                    self.weather = try JSONDecoder().decode(MessageModel.self, from: response.data!)
                    self.refreshControl?.endRefreshing()
                    DispatchQueue.main.async {
                        // FIXME:- CoreData save here.
                        self.addContext()
                        self.navigationItem.title = "\((self.weather?.city.name)!)"
                        self.tableView.reloadData()
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
    
    func addContext() {
        
        if let k = weather?.list.count {
            for i in 0..<k {
                let context = AppDelegate.viewContext
                let message = MessageEntity(context: context)
                message.name = weather?.city.name
                message.icon = weather?.list[i].weather[0].icon
                message.temp = (weather?.list[i].main.temp)!
                message.pressure = (weather?.list[i].main.pressure)!
                message.humidity = Int32((weather?.list[i].main.humidity)!)
                // Save the data to coredata
                //(UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
    }
    
    @objc func refreshEm(refreshControl: UIRefreshControl) {
        
        decoder()
    }

}
