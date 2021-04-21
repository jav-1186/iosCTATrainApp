//
//  stopsTableViewController.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/18/21.
//

import UIKit

class stopsTableViewController: UITableViewController {

    var itemLine: train?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let color = itemLine?.name
        
        
        switch color
        {
            case "Blue":
                return blue.count
            case "Red":
                return red.count
            default:
                return 1
        }
        
        //return trainStops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let color = itemLine?.name
        
        
        switch color
        {
            case "Blue":
                let item = blue[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                print(item.name)
                cell.textLabel?.text = item.name
                return cell
                
            case "Red":
                let item = red[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                print(item.name)
                cell.textLabel?.text = item.name
                return cell
                
            default:
                let item = blue[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? detailViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow {
            detailViewController.mapId = blue[indexPath.row]
           }
        }
    }

}
