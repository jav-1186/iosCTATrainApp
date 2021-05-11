//
//  mapViewController.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 5/1/21.
//

import UIKit
import CoreLocation
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationL: UILabel!
    @IBOutlet weak var enterR: UILabel!
    @IBOutlet weak var roseT: UILabel!
    @IBOutlet weak var timeAr: UILabel!
    @IBOutlet weak var stationN: UILabel!
    
    let locationManager = CLLocationManager()
    var RosemontTrain = ("","")
    var CumberlandTrain = ("","")
    var HarlemTrain = ("","")
    var timer = Timer()
    let baseURL = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=e1ebd51036274ccf98a782175d2fd89e&max=1&mapid="

    // Class to hold JSON data for trains
    class trainLocation
    {
        var lat: String = ""
        var long: String = ""
    }

    // Error catching
    enum SerializationError: Error
    {
        case missing(String)
        case invalid(String, Any)
    }

    var dataAvailable = false
    var records: [trainLocation] = []
    var lat: String = ""
    var long: String = ""
    var timeArrival: String = ""
    var timeOrigin: String = ""
    
    var roseTime: String = ""
    var cumbTime: String = ""
    var harTime: String = ""

    
    let points =
    [
        (lat: 41.983455, lon: -87.859888, name: "Rosemont Blue Line Station"),
        (lat: 41.984383, lon: -87.837722, name: "Cumberland Blue Line Station"),
        (lat: 41.982322, lon: -87.807626, name: "Harlem Blue Line Station")
    ]
    
    var regions = [CLCircularRegion]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let status = locationManager.authorizationStatus
        if status == .denied || status == .restricted
        {
            locationL.text = "Location service not authorized"
        }
        
        else
        {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 1 // meter
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            
            mapView.mapType = .standard
            mapView.showsUserLocation = true
            mapView.showsBuildings = true
            
            if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self)
            {
                for p in points
                {
                    let center = CLLocationCoordinate2D(latitude: p.lat, longitude: p.lon)
                    let region = CLCircularRegion(center: center, radius: 10, identifier: p.name)
                    region.notifyOnEntry = true
                    region.notifyOnExit = true
                    regions.append(region)
                }
            }
            
            else
            {
                showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
            }
            
            whereTrain("40820", "Rosemont")
            whereTrain("40230", "Cumberland")
            whereTrain("40750", "Harlem")
           
            print("Rosemont coordinates" + RosemontTrain.0 + RosemontTrain.1)
            print("Rosemont coordinates" + CumberlandTrain.0 + CumberlandTrain.1)
            print("Rosemont coordinates" + HarlemTrain.0 + HarlemTrain.1)
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.startUpdatingLocation()
        }
        
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) &&
            !regions.isEmpty
        {
            for region in regions
            {
                locationManager.startMonitoring(for: region)
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
        for region in regions
        {
            locationManager.stopMonitoring(for: region)
        }
    }
    
    // delegate methods
    
    var annotation: MKAnnotation?
    var rosemont = MKPointAnnotation()
    var cumberland = MKPointAnnotation()
    var harlem = MKPointAnnotation()
    
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
        NSLog("(\(location.coordinate.latitude), \(location.coordinate.longitude))")
        whereTrain("40820", "Rosemont")
        whereTrain("40230", "Cumberland")
        whereTrain("40750", "Harlem")
        
        
        locationL.text =
            "Latitude: " + String(format: "%.4f", location.coordinate.latitude) +
            "\nLongitude: " +  String(format: "%.4f", location.coordinate.longitude) 
        
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
        
        
        if mapView.isPitchEnabled
        {
            mapView.setCamera(MKMapCamera(lookingAtCenter: location.coordinate, fromDistance: 1000, pitch: 60, heading: 0), animated: true)
        }
        
        if annotation != nil
        {
            mapView.removeAnnotation(annotation!)
        }
        
        rosemont.title = "Rosemont Blue Line Train"
        rosemont.coordinate = CLLocationCoordinate2D(latitude: Double(RosemontTrain.0) ?? 47.1, longitude: Double(RosemontTrain.1) ?? 87.1)
        let placeR = Place(rosemont.coordinate, "Rosemont Train")
        
        cumberland.title = "Cumberland Blue Line Train"
        cumberland.coordinate = CLLocationCoordinate2D(latitude: Double(CumberlandTrain.0) ?? 47.1, longitude: Double(CumberlandTrain.1) ?? 87.1)
        let placeC = Place(cumberland.coordinate, "Cumberland Train")
        
        harlem.title = "Harlem Blue Line Train"
        harlem.coordinate = CLLocationCoordinate2D(latitude: Double(HarlemTrain.0) ?? 47.1, longitude: Double(HarlemTrain.1) ?? 87.1)
        let placeH = Place(harlem.coordinate, "Harlem Train")
        
        let place = Place(location.coordinate, "Me")
        mapView.addAnnotation(place)
        mapView.addAnnotation(placeR)
        mapView.addAnnotation(placeC)
        mapView.addAnnotation(placeH)
        annotation = place
        
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion)
    {
        NSLog("Enter region \(region)")
        enterR.text = "Enter \(region.identifier)"
        print(region.identifier + "hereeee")
        if region.identifier == "Rosemont Blue Line Station"
        {
            timeAr.text = roseTime + " min"
            stationN.text = "Rosemont Train Arrival Time"
            roseT.text = "Rosemont Train: " + RosemontTrain.0 + " " + RosemontTrain.1
        }
        
        else if region.identifier == "Cumberland Blue Line Station"
        {
            timeAr.text = cumbTime + " min"
            stationN.text = "Cumberland Train Arrival Time"
            roseT.text = "Cumberland Train: " + CumberlandTrain.0 + " " + CumberlandTrain.1
        }
        
        else if region.identifier == "Harlem Blue Line Station"
        {
            timeAr.text = harTime + " min"
            stationN.text = "Harlem Train Arrival Time"
            roseT.text = "HarlemTrain: " + HarlemTrain.0 + " " + HarlemTrain.1
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion)
    {
        NSLog("Exit region \(region)")
        enterR.text = "Exit \(region.identifier)"
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error)
    {
        NSLog("Error \(error)")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(withTitle title: String?, message: String?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Function that starts URL session and makes API call. Parses JSON
    func whereTrain(_ mapId: String, _ name: String)
    {
        
        var feed = baseURL + mapId + "&outputType=JSON"
        
        guard let feedURL = URL(string: feed) else
        {
            return
        }
        
        let request = URLRequest(url: feedURL)
        let session = URLSession.shared
        
        session.dataTask(with: request)
        { [self] data, response, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                   
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
                    
                    for e in entries {
                        do {
                            if let entry = e as? [String:Any] {
                                
                                guard let latT = entry["lat"]  else
                                {
                                    throw SerializationError.missing("lat")
                                }
                                
                                guard let longT = entry["lon"]  else
                                {
                                    throw SerializationError.missing("long")
                                }
                                
                                guard let arrT = entry["arrT"]  else
                                {
                                    throw SerializationError.missing("arrT")
                                }
                                
                                guard let destName = entry["stpDe"] else
                                {
                                    throw SerializationError.missing("stpDe")
                                }
                                
                                lat = latT as? String ?? "At"
                                long = longT as? String ?? "Station"
                                
                                timeArrival = arrT as! String
                                timeOrigin = originTime as! String
                                
                                DispatchQueue.main.async
                                {
                                    let eta: Int = self.getMinutes(start: timeOrigin, end: timeArrival)
                                    
                                    if name == "Rosemont"
                                    {
                                        RosemontTrain = (lat, long)
                                        roseTime = String(eta)
                                    }
                                    
                                    else if name == "Cumberland"
                                    {
                                        CumberlandTrain = (lat, long)
                                        cumbTime = String(eta)
                                    }
                                    
                                    else if name == "Harlem"
                                    {
                                        HarlemTrain = (lat, long)
                                        harTime = String(eta)
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
                    
                    
                    
                }
            } catch SerializationError.missing(let msg) {
                print("Missing \(msg)")
            } catch SerializationError.invalid(let msg, let data) {
                print("Invalid \(msg): \(data)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }.resume()
        
        print("hereeeeee")
        print("long: " + long)
        print("lat: " + lat)
        
    }
    
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }
    
}

class Place : NSObject, MKAnnotation
{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(_ coordinate: CLLocationCoordinate2D,
         _ title: String? = nil,
         _ subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}




    


