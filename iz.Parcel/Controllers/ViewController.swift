//
//  ViewController.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 5/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let names = ["Izzat Jabali", "Omar Jabali", "Imad Jabali"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

// Delegate is used to hadle interation for the cell
extension ViewController: UITableViewDelegate {
    
    //DidSelectRow is captured everytime a person touches a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped")
    }
}

//
extension ViewController: UITableViewDataSource {
    
    //Number of rows we want to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    //Dequeueing a cell is the same as using the templet cell over and over. So we use the same temple instead of creating multiple versions of that cell.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row] // indexPath.row is position in the table
        
        return cell
    }
}


