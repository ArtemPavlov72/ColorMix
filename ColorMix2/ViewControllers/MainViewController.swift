//
//  MainViewController.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackGroundColor(for redColor: Float, for greenColor: Float, for blueColor: Float)
}

class MainViewController: UIViewController {
    
    private var redColorOfMVC: Float = 1
    private var greenColorOfMVC: Float = 1
    private var blueColorOfMVC: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundColor()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let backGroundColor = segue.destination as? SettingsViewController else {return}
        backGroundColor.redSliderFirst = redColorOfMVC
        backGroundColor.greenSliderFirst = greenColorOfMVC
        backGroundColor.blueSliderFirst = blueColorOfMVC
        backGroundColor.delegate = self
    }
    
    private func backGroundColor() {
        view.backgroundColor = UIColor(
            red: CGFloat(redColorOfMVC),
            green: CGFloat(greenColorOfMVC),
            blue: CGFloat(blueColorOfMVC),
            alpha: 1
        )
        
        
    }
    
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewBackGroundColor(for redColor: Float, for greenColor: Float, for blueColor: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: 1
        )
        self.redColorOfMVC = redColor
        self.greenColorOfMVC = greenColor
        self.blueColorOfMVC = blueColor
    }
}



