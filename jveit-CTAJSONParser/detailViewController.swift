//
//  detailViewController.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/19/21.
//

import UIKit

class detailViewController: UIViewController {

    
    @IBOutlet weak var dest1: UILabel!
    @IBOutlet weak var eta1: UILabel!
    @IBOutlet weak var dest2: UILabel!
    @IBOutlet weak var eta2: UILabel!
    @IBOutlet weak var stationName: UILabel!
    
    var mapId: stops?
    var mapNum: String = ""
    
    let baseURL = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=e1ebd51036274ccf98a782175d2fd89e&max=2&"
    
    //let feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=e1ebd51036274ccf98a782175d2fd89e&max=2&mapid=40820&outputType=JSON"
    
    var feed = ""
    
    class trainRoute
    {
        var station: String = ""
        var destination: String = ""
        var timeOrigin: String = ""
        var timeArrival: String = ""
    }
    
    struct route: Decodable {
        enum Category: String, Decodable
        {
            case swift, combine, debugging, xcode
        }

        let staNm: String
        
    }
    
    enum SerializationError: Error
    {
        case missing(String)
        case invalid(String, Any)
    }
    
    var dataAvailable = false
    var records: [trainRoute] = []
    var timer = Timer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mapNum = mapId!.mapId
        feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=e1ebd51036274ccf98a782175d2fd89e&max=2&mapid=" + mapNum + "&outputType=JSON"
        loadData()
        scheduledTimerWithTimeInterval()
        print("from controller " + mapId!.mapId)
    }
    
    func scheduledTimerWithTimeInterval()
    {
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.loadData), userInfo: nil, repeats: true)
    }
    
    @objc func loadData()
    {
        guard let feedURL = URL(string: feed) else
        {
            return
        }
        
        
        let request = URLRequest(url: feedURL)
        let session = URLSession.shared
        
        session.dataTask(with: request)
        { data, response, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
           
            print(data)
         
            
            do {
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                   // print(json)
                    
                    print(json)
                    
                    
                    guard let feed = json["ctatt"] as? [String:Any] else
                    {
                        throw SerializationError.missing("ctatt")
                    }
                    
                    guard let originTime = feed["tmst"]  else
                    {
                        throw SerializationError.missing("tmst")
                    }
                    
                    
                    
                    guard let entries = feed["eta"] as? [Any] else
                    {
                        throw SerializationError.missing("eta")
                    }
                    
                   
                    
                    
                    //print(entries)
                    for e in entries {
                        do {
                            if let entry = e as? [String:Any] {
                                
                                //print(entry)
                                //print(entry["heading"]!)
                                //print(entry["staNm"]!)
                                //let name = entry["staNm"]!
                               // print(name)
                                
                                
                                guard let sName = entry["staNm"]  else
                                {
                                    throw SerializationError.missing("staNm")
                                }
                                
                                guard let arrT = entry["arrT"]  else
                                {
                                    throw SerializationError.missing("arrT")
                                }
                                
                                guard let destName = entry["stpDe"] else
                                {
                                    throw SerializationError.missing("stpDe")
                                }
                                
                                
                                
                                let train = trainRoute()
                                train.destination = destName as! String
                                train.timeArrival = arrT as! String
                                train.timeOrigin = originTime as! String
                                self.records.append(train)
                                
                                DispatchQueue.main.async
                                {
                                    var index: Int = 0
                                    for r in self.records
                                    {
                                        
                                        let eta: Int = self.getMinutes(start: r.timeOrigin, end: r.timeArrival)
                                        print("try: " + String(eta))
                                        print("try wtf: " + String(index))
                                       
                                        if index == 0
                                        {
                                            self.dest1.text = r.destination
                                            self.eta1.text = String(eta) + " min"
                                            self.stationName.text = sName as! String
                                            print("try index: " + String(index))
                                        }
                                        
                                        else if index == 1
                                        {
                                            self.dest2.text = r.destination
                                            self.eta2.text = String(eta) + " min"
                                            index = -1
                                        }
                                        
                                        index += 1
                                    }
                                    
                                }
                                
                                
                                
                            }
                        } catch SerializationError.missing(let msg) {
                            print("Missing \(msg)")
                        } catch SerializationError.invalid(let msg, let data) {
                            print("Invalid \(msg): \(data)")
                        } catch let error as NSError {
                            print(error.localizedDescription)
                        }
                    }
                    
                    self.dataAvailable = true
                    //DispatchQueue.main.async
                    //{
                        //usleep(30)
                        //self.loadData()
                   // }
                    
                }
            } catch SerializationError.missing(let msg) {
                print("Missing \(msg)")
            } catch SerializationError.invalid(let msg, let data) {
                print("Invalid \(msg): \(data)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // Helper function to determine arrival time in minutes between date objects from JSON
    func getMinutes(start: String, end: String) -> Int
       {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let startD = dateFormatter.date(from:start)!
            let endD = dateFormatter.date(from:end)!

            let diff = Int(endD.timeIntervalSince1970 - startD.timeIntervalSince1970)

            let hours = diff / 3600
            let minutes = (diff - hours * 3600) / 60
            return minutes
       }
            
            
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


