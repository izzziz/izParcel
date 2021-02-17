//
//  packageTableViewCell.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 19/1/21.
//

import UIKit

//protocol ParcelInformationDelegate {
//    func setParcel(name: String, address: String, trackingNumber: String)
//}
//    
class packageTableViewCell: UITableViewCell {
    func setParcel(name: String, address: String, trackingNumber: String) {

    }
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var trackingNumLabel: UILabel!
    
//    var parcelDelegate : ParcelInformationDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   //     parcelDelegate?.setParcel(name: "", address: "", trackingNumber: "")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
       
       

    
}
