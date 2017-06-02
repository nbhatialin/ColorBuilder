//
//  DetailViewController.swift
//  testRGB
//
//  Created by Nikhil Bhatia-lin on 5/30/17.
//  Copyright © 2017 Nikhil Bhatia-lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
        
        init (colorToPreview: RGBClass) {
                self.selectedColor = colorToPreview
                super.init(nibName: nil, bundle: nil)
        }
        
        
        required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
        }
        
        var selectedColor: RGBClass
        
        override func viewDidLoad() {
                super.viewDidLoad()
                self.view.backgroundColor = selectedColor.color
                navigationItem.title = selectedColor.colorName
        }
        
        
        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
