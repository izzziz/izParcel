//
//  InputViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 5/1/21.
//

import UIKit

class InputViewController: UITableViewController {
    
    var izParcel: IzParcel?
    var IzParcelz = [IzParcel]()
    var parcelEditIndex: Int?
    
    @IBOutlet weak var statusTextLabel: UITextField!
    
    @IBOutlet weak var nameTextLabel: UITextField!
    @IBOutlet weak var addressTextLabel: UITextField!
    @IBOutlet weak var trackingNumTextLabel: UITextField!
    
    @IBOutlet weak var notesTextLabel: UITextField!
    
    @IBOutlet weak var statusUpdateTextLabel: UIDatePicker!
    @IBOutlet weak var dateAndTimeTextLabel: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let izParcels = izParcel {
            nameTextLabel.text = izParcels.name
            addressTextLabel.text = izParcels.address
            trackingNumTextLabel.text = izParcels.trackingNumber
            notesTextLabel.text = izParcels.notes
            dateAndTimeTextLabel.date = izParcels.dateAndTime
            statusUpdateTextLabel.date = izParcels.statusUpdated
            
            
        }
        
        if let index = parcelEditIndex {
            let parcel = IzParcelz[index]
            nameTextLabel.text = parcel.name
            addressTextLabel.text = parcel.address
            trackingNumTextLabel.text = parcel.trackingNumber
            notesTextLabel.text = parcel.notes
            dateAndTimeTextLabel.date = parcel.dateAndTime
            statusUpdateTextLabel.date = parcel.statusUpdated
        }
    }
    
    @IBAction func cancleButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        print("SaveButton Tapped")
        
        performSegue(withIdentifier: "saveUnwind", sender: self)
}
    
    func updateSaveButtonState() {
        let name = nameTextLabel.text ?? ""
        let address = addressTextLabel.text ?? ""
        let trackingNumber = trackingNumTextLabel.text ?? ""
        let notes = notesTextLabel.text ?? ""
       
        saveButton.isEnabled = !name.isEmpty
        saveButton.isEnabled = !address.isEmpty
        saveButton.isEnabled = !trackingNumber.isEmpty
        saveButton.isEnabled = !notes.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
        let name = nameTextLabel.text!
        let address = addressTextLabel.text!
        let trackingNumber = trackingNumTextLabel.text!
        let notes = notesTextLabel.text!
        let dates = dateAndTimeTextLabel.date
        
        izParcel = IzParcel(name: name, address: address, trackingNumber: trackingNumber, notes: notes, dateAndTime: dates, statusUpdated: dates)
    }
}
