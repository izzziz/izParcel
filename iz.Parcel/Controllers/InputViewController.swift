//
//  InputViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 5/1/21.
//

import UIKit

class InputViewController: UITableViewController {
    
    var izParcel = [IzParcel]()
    
    @IBOutlet weak var statusTextLabel: UITextField!
    
    @IBOutlet weak var nameTextLabel: UITextField!
    @IBOutlet weak var addressTextLabel: UITextField!
    @IBOutlet weak var trackingNumTextLabel: UITextField!
    
    @IBOutlet weak var notesTextLabel: UITextField!
    
    @IBOutlet weak var statusUpdateTextLabel: UIDatePicker!
    @IBOutlet weak var dateAndTimeTextLabel: UIDatePicker!
    
    
    let dateAndTimePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let defaults = UserDefaults.standard
    var izParcelz : IzParcel? {
        
        let name = nameTextLabel.text ?? ""
        let address = addressTextLabel.text ?? ""
        let trackingNumber = trackingNumTextLabel.text ?? ""
        let notes =  notesTextLabel.text ?? ""
        let dateAndTime = dateAndTimeTextLabel.date
        let statusOfParcel = statusUpdateTextLabel.date
        
        
        return IzParcel(name: name, address: address,
                        trackingNumber: trackingNumber,
                        notes: notes,
                        dateAndTime: dateAndTime,
                        statusUpdated: statusOfParcel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        dateAndTimeTextLabel.minimumDate = midnightToday
        dateAndTimeTextLabel.date = midnightToday
        
        //updateDateViews()
        
        
        //        nameTextLabel.delegate = self
        //        statusTextLabel.delegate = self
        
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
//                performSegue(withIdentifier: "cell", sender: self)
//                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                    let vc = segue.destination as! MainTableViewController
//
//                    if segue.identifier == "cell" {
//
//                        let mainVC = segue.destination as! MainTableViewController
//                        performSegue(withIdentifier: "saveUnwind", sender: self)
//                    }
//
//
        print("Save Button Tapped")
        
        //                 let mainVC = segue.destination as! MainTableViewController
        //      mainVC.data = nameTextLabel.text!
        //
        //
        //
        //        }
        //                    vc.finalStatusText = self.statusText
        //
        //                    let mainVC = ViewController()
        //                    self.present(mainVC, animated: true, completion: nil)
        //
        
    }
    func updateDateViews() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                   let vc = segue.destination as! MainTableViewController
        
        if segue.identifier == "saveUnwind" {
            func unwindInputScreen(unwindSegue: UIStoryboardSegue) {
                guard let InputViewController = unwindSegue.source as? InputViewController,
                      let izParcels = InputViewController.izParcelz else { return }
                
                
                print("added")
                izParcel.append(izParcels)
                tableView.reloadData()
            }
        }
    }
}


//            extension InputViewController: UITextFieldDelegate {
//
//                func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//                    textField.resignFirstResponder()
//                    return true
//                }
//            }
//

