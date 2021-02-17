//
//  MainTableViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 26/1/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var izParcel = [IzParcel]()
    

        override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            izParcel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            IzParcel.saveIzParcel(izParcel)
        }
    }
    
    @IBAction func unwindToMainView(segue: UIStoryboardSegue) {
        
    }
    
    //    // MARK: - ToDo Cell Delegate
    //
    //    func setParcel(_ sender: packageTableViewCell) {
    //        if let indexPath = tableView.indexPath(for: sender) {
    //            var izParcels = izParcel[indexPath.row]
    //
    //            izParcel[indexPath.row] = izParcels
    //            tableView.reloadRows(at: [indexPath], with: .automatic)
    //            IzParcel.saveIzParcel(izParcel)
    //        }
    //    }
}

