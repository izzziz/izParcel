//
//  ViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 5/1/21.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var IzParcelz = [IzParcel]()
    var parcelEditIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationItem.leftBarButtonItem = editButtonItem
        
        let nib = UINib(nibName: "IzparcelCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "IzparcelCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        if let saveIzParcel = IzParcel.loadIzParcel() {
            IzParcelz = saveIzParcel
            
        }
    }
    // MARK: - TableView data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IzParcelz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IzparcelCell", for: indexPath) as! IzparcelCell
        
        let izPackage = IzParcelz[indexPath.row]
        cell.nameLabel.text = izPackage.name
        cell.addressLabel.text = izPackage.address
        cell.trackingNumLabel.text = izPackage.trackingNumber
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "         Name | Address | Status"
       }
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            IzParcelz.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            IzParcel.saveIzParcel(IzParcelz)
            
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, UIView, actionPerformed: (Bool) -> Void) in
            //self.parcelEditIndex = indexPath.row
            self.performSegue(withIdentifier: "showDetails", sender: nil)
            actionPerformed(true)
        }
        edit.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let sourceViewController = segue.source as! InputViewController
        
        if let P = sourceViewController.izParcel {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                IzParcelz[selectedIndexPath.row] = P
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: IzParcelz.count, section: 0)
                IzParcelz.append(P)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
        IzParcel.saveIzParcel(IzParcelz)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showDetails" else {return}
        
        let izViewController = segue.destination as! InputViewController
        
         izViewController.parcelEditIndex = parcelEditIndex
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedParcel = IzParcelz[indexPath.row]
            
            izViewController.izParcel = selectedParcel
            
        }
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "showDetails" {
    //            let izViewController = segue.destination as! InputViewController
    //            izViewController.parcelEditIndex = parcelEditIndex
    //            let indexPath = tableView.indexPathForSelectedRow!
    //            let selectedParcel = IzParcelz[indexPath.row]
    //
    //            izViewController.izParcel = selectedParcel
    //
    //
    //            }
    //        }
}


