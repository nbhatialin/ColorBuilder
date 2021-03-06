//
//  CreateViewController.swift
//  RGB
//
//  Created by Nikhil Bhatia-lin on 5/18/17.
//  Copyright © 2017 Nikhil Bhatia-lin. All rights reserved.
//


import UIKit
import os.log

class CreateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorPreview: UIView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var newColor: RGBClass?
    
    var redValue:CGFloat = 0.0/255
    var greenValue: CGFloat = 0.0/255
    var blueValue: CGFloat = 0.0/255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetSliders()
        
        nameTextField.delegate = self
        updateSaveButton()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        doneButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButton()
        navigationItem.title = textField.text
    }
  
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === doneButton
            else {
                return
        }
        
        readRGBValues()
        let color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        let name = nameTextField.text ?? ""
        
        newColor = RGBClass(colorName: name, color: color)
    }
    
    func updatePreview(_ sender: Any) {
        guard let slider = sender as? UISlider
            else {
                return
        }
        
        if redSlider == slider {
            redValue = CGFloat(redSlider.value)
        }
        else if greenSlider == slider {
            greenValue = CGFloat(greenSlider.value)
        }
        else if blueSlider == slider {
            blueValue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        colorPreview.backgroundColor = color
    }
    
    
    @IBAction func redPreview(_ sender: Any) {
        updatePreview(sender)
    }
    @IBAction func greenPreview(_ sender: Any) {
        updatePreview(sender)
    }
    
    @IBAction func bluePreview(_ sender: Any) {
        updatePreview(sender)
    }
    
    func resetSliders() {
        redValue = 127.5/255
        greenValue = 127.5/255
        blueValue = 127.5/255
        redSlider.value = Float(redValue)
        greenSlider.value = Float(greenValue)
        blueSlider.value = Float(blueValue)
    }
    
    func readRGBValues() {
        redValue = CGFloat(redSlider.value)
        greenValue = CGFloat(greenSlider.value)
        blueValue = CGFloat(blueSlider.value)
    }
    
    private func updateSaveButton() {
        let text = nameTextField.text ?? ""
        doneButton.isEnabled = !text.isEmpty
    }
    
}
