//
//  LinesTableViewController.swift
//  jveit-CTAJSONParser
//
//  Created by Jeffrey Veit on 4/18/21.
//

import UIKit

class LinesTableViewController: UITableViewController {

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
        return trainLines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let item = trainLines[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = item.name
        return cell
    }
    
    // Method to send data to the detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let stopsTableViewController = segue.destination as? stopsTableViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow {
               stopsTableViewController.itemLine = trainLines[indexPath.row]
           }
        }
    }

}
