//
//  ViewController.swift
//  CustomTableView
//
//  Created by Mobark Alseif on 26/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTable: UITableView!
    @IBOutlet weak var secondTable: UITableView!
    
    let citiesVisited = ["Abha","Riyadh","Makkah"]
    let citiesIwanttoVisit = ["Tabuk","Jeddah","Khobar"]
    let twoSection = ["First","Second"]
    let imageCitiesVisited = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    let imageCitiesIwanttoVisit = [UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTable.delegate = self
        firstTable.dataSource = self
        secondTable.delegate = self
        secondTable.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == firstTable {
            if section == 0 {
                return 1
            } else {
                return citiesVisited.count
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return citiesIwanttoVisit.count
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == firstTable {
            
            if indexPath.section == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
                cell.textLabel?.text = twoSection[0]
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = citiesVisited[indexPath.row]
                cell.imageView?.image = imageCitiesVisited[indexPath.row]
                return cell
                
            }
        } else {
            
            if indexPath.section == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
                cell.textLabel?.text = twoSection[1]
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = citiesIwanttoVisit[indexPath.row]
                cell.imageView?.image = imageCitiesIwanttoVisit[indexPath.row]
                return cell
                
            }
        }
    }
}
