//
//  MainTableViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 19/2/21.
//

//import UIKit
//
//class MainTableViewController: UITableViewController {
//
//
//    var IzParcelz = [IzParcel]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let nib = UINib(nibName: "IzparcelCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "IzparcelCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return IzParcelz.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "IzparcelCell", for: indexPath) as! IzparcelCell
//
//        let izPackage = IzParcelz[indexPath.row]
//        cell.nameLabel.text = izPackage.name
//        cell.addressLabel.text = izPackage.address
//        cell.trackingNumLabel.text = izPackage.trackingNumber
//
//        return cell
//    }
//
//    // MARK: - TableView Delegate
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            IzParcelz.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            IzParcel.saveIzParcel(IzParcelz)
//
//        }
//    }
//
//    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
//
//        guard segue.identifier == "saveUnwind" else { return }
//
//        let sourceViewController = segue.source as! InputViewController
//
//        if let P = sourceViewController.izParcel {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                IzParcelz[selectedIndexPath.row] = P
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            } else {
//                let newIndexPath = IndexPath(row: IzParcelz.count, section: 0)
//                IzParcelz.append(P)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//        }
//
//        IzParcel.saveIzParcel(IzParcelz)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetails" {
//            let izViewController = segue.destination as! InputViewController
//            let indexPath = tableView.indexPathForSelectedRow!
//            let selectedTodo = IzParcelz[indexPath.row]
//
//            izViewController.izParcel = selectedTodo
//        }
//    }
//}
//
