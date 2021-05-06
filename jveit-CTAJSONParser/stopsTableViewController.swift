//
//  stopsTableViewController.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/18/21.
//

import UIKit

// Table view controller to display the train stops based on line selected
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
            case "Orange":
                return orange.count
            case "Yellow":
                return yellow.count
            case "Purple":
                return purple.count
            case "Pink":
                return pink.count
            case "Brown":
                return brown.count
            case "Green":
                return green.count
            default:
                return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let color = itemLine?.name
        
        
        switch color
        {
            case "Blue":
                let item = blue[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Red":
                let item = red[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Orange":
                let item = orange[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Yellow":
                let item = yellow[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Purple":
                let item = purple[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Pink":
                let item = pink[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Brown":
                let item = brown[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            case "Green":
                let item = green[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                cell.textLabel?.text = item.name
                return cell
                
            default:
                let item = blue[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
                return cell
        }
        
    }
    
    // Method to send train stop selected to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let color = itemLine?.name
        
        if let detailViewController = segue.destination as? detailViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow
           {
            switch color
            {
                case "Blue":
                    detailViewController.mapId = blue[indexPath.row]
                    
                case "Red":
                    detailViewController.mapId = red[indexPath.row]
                    
                case "Orange":
                    detailViewController.mapId = orange[indexPath.row]
                    
                case "Yellow":
                    detailViewController.mapId = yellow[indexPath.row]
                    
                case "Purple":
                    detailViewController.mapId = purple[indexPath.row]
                    
                case "Pink":
                    detailViewController.mapId = pink[indexPath.row]
                    
                case "Brown":
                    detailViewController.mapId = brown[indexPath.row]
                    
                case "Green":
                    detailViewController.mapId = green[indexPath.row]
                
                default:
                    detailViewController.mapId = blue[indexPath.row]
            }
            
           }
        }
    }

}
