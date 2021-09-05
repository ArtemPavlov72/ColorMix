//
//  ViewController.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 04.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorPlace: UIView!
    
    @IBOutlet weak var redColor: UILabel!
    @IBOutlet weak var greenColor: UILabel!
    @IBOutlet weak var blueColor: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    var redSliderFirst = Float()
    var greenSliderFirst = Float()
    var blueSliderFirst = Float()
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPlace.layer.cornerRadius = 15
        
        redValueTF.delegate = self
        greenValueTF.delegate = self
        blueValueTF.delegate = self
        
        setFirstValue()
        setColor()
        setValue(for: redColor, greenColor, blueColor)
    }
    
    @IBAction func doneButton() {
        view.endEditing(true)
        delegate.setNewBackGroundColor(for: Float(redSlider.value), for: Float(greenSlider.value), for: Float(blueSlider.value))
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redColor.text = string(from: redSlider)
            redValueTF.text = redColor.text
        case greenSlider:
            greenColor.text = string(from: greenSlider)
            greenValueTF.text = greenColor.text
        default:
            blueColor.text = string(from: blueSlider)
            blueValueTF.text = blueColor.text
        }
    }
    
    private func setColor() {
        colorPlace.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setFirstValue() {
        redSlider.value = redSliderFirst
        greenSlider.value = greenSliderFirst
        blueSlider.value = blueSliderFirst
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColor:
                redColor.text = string(from: redSlider)
                redValueTF.text = redColor.text
            case greenColor:
                greenColor.text = string(from: greenSlider)
                greenValueTF.text = greenColor.text
            default:
                blueColor.text = string(from: blueSlider)
                blueValueTF.text = blueColor.text
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else {return}
        guard let numberValue = Float(newValue) else {return}
        if textField == redValueTF {
            redSlider.value = numberValue
            redColor.text = string(from: redSlider)
            setColor()
        } else {
            if
                textField == greenValueTF {
                greenSlider.value = numberValue
                greenColor.text = string(from: greenSlider)
                setColor()
            } else {
                blueSlider.value = numberValue
                blueColor.text = string(from: blueSlider)
                setColor()
            }
        }
    }
}





