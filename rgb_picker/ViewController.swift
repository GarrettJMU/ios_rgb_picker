//
//  ViewController.swift
//  rgb_picker
//
//  Created by Garrett Hughes on 9/11/18.
//  Copyright © 2018 Garrett Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redInput: UITextField!
    @IBOutlet weak var greenInput: UITextField!
    @IBOutlet weak var blueInput: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!
    
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oldRedColor = UserDefaults.standard.value(forKey: "red")
        let oldGreenColor = UserDefaults.standard.value(forKey: "green")
        let oldBlueColor = UserDefaults.standard.value(forKey: "blue")
        
        if ((oldRedColor as? Float) != nil) && ((oldGreenColor as? Float) != nil) && ((oldBlueColor as? Float) != nil) {
            
            let floatedRed = oldRedColor as! Float
            let floatedGreen = oldGreenColor as! Float
            let floatedBlue = oldBlueColor as! Float
            changeDisplayColor(red: floatedRed, green: floatedGreen, blue: floatedBlue)
            updateInputsAndSliders(red: floatedRed, green: floatedGreen, blue: floatedBlue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func redInputAction(_ sender: UITextField) {
        redColor = Float(redInput.text!)!
    }
    @IBAction func greenInputAction(_ sender: UITextField) {
        greenColor = Float(greenInput.text!)!
    }
    @IBAction func blueInputAction(_ sender: UITextField) {
        blueColor = Float(blueInput.text!)!
    }
    @IBAction func redSliderInput(_ sender: Any) {
        redInput.text = String(Int(redSlider.value))
    }
    @IBAction func greenSliderInput(_ sender: Any) {
        greenInput.text = String(Int(greenSlider.value))
    }
    @IBAction func blueSliderInput(_ sender: Any) {
        blueInput.text = String(Int(blueSlider.value))
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        updateColors()
        updateSlidersOnSubmit()
        dismissKeyboard()
        changeDisplayColor(red: redColor, green: greenColor, blue: blueColor)
    }
    
    func updateColors() {
        redColor = Float(redInput.text!)!
        greenColor = Float(greenInput.text!)!
        blueColor = Float(blueInput.text!)!
    }
    
    func updateSlidersOnSubmit()    {
        redSlider.value = Float(redInput.text!)!
        greenSlider.value = Float(greenInput.text!)!
        blueSlider.value = Float(blueInput.text!)!
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            colorView.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    func updateInputsAndSliders(red: Float, green: Float, blue: Float)    {
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        
        redInput.text = String(Int(red))
        greenInput.text = String(Int(green))
        blueInput.text = String(Int(blue))
    }
    
    func dismissKeyboard()  {
        view.endEditing(true)
    }
    
    func changeDisplayColor(red: Float, green: Float, blue: Float)   {
        let red = CGFloat(red/100)
        let green = CGFloat(green/100)
        let blue  = CGFloat(blue/100)
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
