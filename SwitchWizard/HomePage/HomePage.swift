//
//  HomePage.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 12/2/23.
//
import UIKit

class HomePage: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
   
    var dataSource = [TimeData]()
    
    
    override func viewDidLoad() {
        self.navigationController?.delegate = self
        setupBackroundImageToVievController(imageNamed: "backround 1" , backroundView: backroundView)
        image1.layer.cornerRadius = image1.bounds.height / 10
        image2.layer.cornerRadius = image2.bounds.height / 10
        image3.layer.cornerRadius = image3.bounds.height / 10
        image4.layer.cornerRadius = image4.bounds.height / 10
        super.viewDidLoad()
        calculateTimeZone()
        setupTableView()
        
    }
    


    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
          return .portrait
      }

      func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
          return .portrait
      }
    
    
    
    func setupTableView(){
        tableView.register(UINib(nibName: "TimeZoneTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeZoneTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
     
    }
    
    
    
    @IBAction func goToTemprature(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Temprature = storyBoard.instantiateViewController(withIdentifier: "Temperature") as! Temperature
        self.navigationController?.pushViewController(Temprature, animated: true)
    }
    
    
    @IBAction func goToVolume(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VolumeVC = storyBoard.instantiateViewController(withIdentifier: "VolumeViewController") as! VolumeViewController
        self.navigationController?.pushViewController(VolumeVC, animated: true)
    }
    
    
    @IBAction func goToHeight(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let HeightVC = storyBoard.instantiateViewController(withIdentifier: "HeightViewController") as! HeightViewController
        self.navigationController?.pushViewController(HeightVC, animated: true)
    }
    
    
    @IBAction func goToWeight(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let WeightVC = storyBoard.instantiateViewController(withIdentifier: "WeightViewController") as! WeightViewController
        self.navigationController?.pushViewController(WeightVC, animated: true)
    }
    
    
    
    func calculateTimeZone() {
        let citiesAndTimezones = [
            "Washington D.C.": "America/New_York",
               "London": "Europe/London",
               "Paris": "Europe/Paris",
               "Astana": "Asia/Almaty",
               "Hong Kong": "Asia/Hong_Kong",
               "Moscow": "Europe/Moscow",
               "Sydney": "Australia/Sydney",
               "Pretoria": "Africa/Johannesburg",
               "Ankara": "Europe/Istanbul",
               "Tokyo": "Asia/Tokyo",
               "Beijing": "Asia/Shanghai",
               "Berlin": "Europe/Berlin",
               "Ottawa": "America/Toronto",
               "Brasília": "America/Sao_Paulo"
        ]
        
        let currentDate = Date()
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "hh:mm a"
           dateFormatter.timeStyle = .short
           dateFormatter.dateStyle = .none
           
           let localTimeZone = TimeZone.current
           
           var localTimezoneIdentifier = ""
           for (city, timezone) in citiesAndTimezones {
               if city == "Washington D.C." {
                   localTimezoneIdentifier = timezone
                   break
               }
           }
           
           var sortedTimeZones = citiesAndTimezones.sorted { (city1, city2) -> Bool in
               let timeZone1 = TimeZone(identifier: city1.value)!
               let timeZone2 = TimeZone(identifier: city2.value)!
               let city1Difference = timeZone1.secondsFromGMT(for: currentDate) - localTimeZone.secondsFromGMT(for: currentDate)
               let city2Difference = timeZone2.secondsFromGMT(for: currentDate) - localTimeZone.secondsFromGMT(for: currentDate)
               return city1Difference < city2Difference
           }
           
           if let index = sortedTimeZones.firstIndex(where: { $0.value == localTimezoneIdentifier }) {
               let localCity = sortedTimeZones.remove(at: index)
               sortedTimeZones.insert(localCity, at: 0)
           }
           
           for (city, timezone) in sortedTimeZones {
               if let cityTimeZone = TimeZone(identifier: timezone) {
                   dateFormatter.timeZone = cityTimeZone
                   let cityTime = dateFormatter.string(from: currentDate)
                   let timeZone = calculateTimeDifference(localTimeZone: localTimeZone, targetTimeZone: cityTimeZone)
                   let formattedTimeDifference = timeZone.replacingOccurrences(of: " hr.", with: "")
                   let timeZoneString = String(formattedTimeDifference)
                   
                   let timeZoneData = TimeData(city: city, hour: "\(cityTime)", timeDifference: timeZoneString)
                   dataSource.append(timeZoneData)
               } else {
                   print("Wrong Time: \(city)")
               }
           }
       }
    
    
    func calculateTimeDifference(localTimeZone: TimeZone, targetTimeZone: TimeZone) -> String {
        let timeDifference = targetTimeZone.secondsFromGMT(for: Date()) - localTimeZone.secondsFromGMT(for: Date())
        
        if timeDifference > 0 {
            return "+\(timeDifference / 3600) hr."
        } else if timeDifference < 0 {
            return "\(timeDifference / 3600) hr."
        } else {
            return "Same time zone"
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let firstCell = UITableViewCell(style: .default, reuseIdentifier: "FirstCellIdentifier")
            firstCell.textLabel?.text = "Capitals Time"
            firstCell.backgroundColor = .clear
            firstCell.textLabel?.textColor = UIColor(red: 11.0/255.0, green: 37.0/255.0, blue: 35.0/255.0, alpha: 1.0)
            firstCell.textLabel?.font = UIFont(name: "Hiragino Mincho ProN W6", size: 28.0)

            return firstCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZoneTableViewCell", for: indexPath) as? TimeZoneTableViewCell else {
                fatalError("TimeZone Table View Cell is not defined")
            }
            cell.configureCell(dataSource[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
