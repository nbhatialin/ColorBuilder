//
//  ViewController.swift
//  testRGB
//
//  Created by Nikhil Bhatia-lin on 5/18/17.
//  Copyright © 2017 Nikhil Bhatia-lin. All rights reserved.
//

import UIKit
import os.log

class RGBClass
{
    init(colorName: String, color: UIColor){
        self.colorName = colorName
        self.color = color
    }
    
    let colorName: String
    let color: UIColor
}

class ColorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let red: RGBClass = RGBClass.init(colorName: "Red", color: UIColor.red)
        let blue: RGBClass = RGBClass.init(colorName: "Blue", color: UIColor.blue)
        let green: RGBClass = RGBClass.init(colorName: "Green", color: UIColor.green)
        
        items = [red, green, blue]
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        let red: RGBClass = RGBClass.init(colorName: "Red", color: UIColor.red)
        let blue: RGBClass = RGBClass.init(colorName: "Blue", color: UIColor.blue)
        let green: RGBClass = RGBClass.init(colorName: "Green", color: UIColor.green)
        
        items = [red, green, blue]
        
        super.init(coder: aDecoder)
       
    }
    let cellIdentifier = "colorTableViewCell"
    @IBOutlet weak var tableView: UITableView!
   
    var items: [RGBClass]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func unwindToColorList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CreateViewController,
            let newColor = sourceViewController.newColor {
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(newColor)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let currentColor = items[indexPath.row]
        
        cell.textLabel?.text = currentColor.colorName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColor: RGBClass = items[indexPath.row]
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        viewController.colorToPreview = selectedColor
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}


