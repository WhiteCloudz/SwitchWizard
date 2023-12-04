//
//  VolumeViewController.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 8/5/23.
//

import UIKit

class VolumeViewController: UIViewController {

    @IBOutlet weak var Podium: UILabel!
    @IBOutlet weak var Cubic: UILabel!
    @IBOutlet weak var Mililiter: UILabel!
    @IBOutlet weak var Gallon: UILabel!
    @IBOutlet weak var Liter: UILabel!
    @IBOutlet weak var Quart: UILabel!
    @IBOutlet weak var Pint: UILabel!
    @IBOutlet weak var labelCubic: UILabel!
    @IBOutlet weak var labelMililiter: UILabel!
    @IBOutlet weak var labelGallon: UILabel!
    @IBOutlet weak var labelLiter: UILabel!
    @IBOutlet weak var labelQuart: UILabel!
    @IBOutlet weak var labelPint: UILabel!
    @IBOutlet weak var lableOns: UILabel!
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var Ons: UILabel!
    
    @IBOutlet weak var gal: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var m3: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var qt: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var oz: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var pt: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var ml: UIButton!
    
    var isFirst = true
    var num1:String = ""
    var operation = ""
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround 3" , backroundView: backroundView)
        labelCubic.isHidden = true
        labelMililiter.isHidden = true
        labelGallon.isHidden = true
        labelLiter.isHidden = true
        labelQuart.isHidden = true
        labelPint.isHidden = true
        lableOns.isHidden = true
        Cubic.isHidden = true
        Mililiter.isHidden = true
        Gallon.isHidden = true
        Pint.isHidden = true
        Liter.isHidden = true
        Quart.isHidden = true
        Ons.isHidden = true
        Podium.text = "0"
    
        cornerRadius(buttonName: ac)
        cornerRadius(buttonName: gal)
        cornerRadius(buttonName: L)
        cornerRadius(buttonName: zero)
        cornerRadius(buttonName: point)
        cornerRadius(buttonName: m3)
        cornerRadius(buttonName: nine)
        cornerRadius(buttonName: eight)
        cornerRadius(buttonName: seven)
        cornerRadius(buttonName: qt)
        cornerRadius(buttonName: six)
        cornerRadius(buttonName: five)
        cornerRadius(buttonName: four)
        cornerRadius(buttonName: oz)
        cornerRadius(buttonName: three)
        cornerRadius(buttonName: two)
        cornerRadius(buttonName: one)
        cornerRadius(buttonName: pt)
        cornerRadius(buttonName: ml)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
        }
    
    @IBAction func goToHome(_ sender: UIButton) {
    }
    
    
    @IBAction func Numbers(_ sender: Any) {
        let button:UIButton = sender as! UIButton
        guard let text = button.titleLabel?.text else {return}
        num1 += text
        Podium.text = num1
        Podium.isHidden = false
        labelCubic.isHidden = true
        labelMililiter.isHidden = true
        labelGallon.isHidden = true
        labelLiter.isHidden = true
        labelQuart.isHidden = true
        labelPint.isHidden = true
        lableOns.isHidden = true
        Cubic.isHidden = true
        Mililiter.isHidden = true
        Gallon.isHidden = true
        Pint.isHidden = true
        Liter.isHidden = true
        Quart.isHidden = true
        Ons.isHidden = true
        
    }

    

    @IBAction func Result(_ sender: Any) {
        let button: UIButton = sender as! UIButton
           guard let text = button.titleLabel?.text else { return }
           operation = text
           Podium.text = num1
           isFirst = false

           guard let intNum1 = Double(num1) else {
               return
           }

        if operation == "gal" {
                   let cubicMeterValue = intNum1 * 0.00495113
                   let literValue = intNum1 * 3.78541
                   let milliliterValue = intNum1 * 3785.41
                   let pintValue = intNum1 * 8.0
                   let quartValue = intNum1 * 4.0
                   let gallonValue = intNum1
                   let ounceValue = intNum1 * 128.0

                   Gallon.text = String(format: "%.1f", gallonValue)
                   Cubic.text = String(format: "%.2f", cubicMeterValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Pint.text = String(format: "%.1f", pintValue)
                   Liter.text = String(format: "%.2f", literValue)
                   Quart.text = String(format: "%.1f", quartValue)
                   Ons.text = String(format: "%.1f", ounceValue)
            
               } else if operation == "L" {
                   let cubicMeterValue = intNum1 * 0.001
                   let milliliterValue = intNum1 * 1000.0
                   let pintValue = intNum1 * 2.11338
                   let quartValue = intNum1 * 1.05669
                   let gallonValue = intNum1 * 0.264172
                   let ounceValue = intNum1 * 33.814

                   Cubic.text = String(format: "%.3f", cubicMeterValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Pint.text = String(format: "%.2f", pintValue)
                   Gallon.text = String(format: "%.2f", gallonValue)
                   Quart.text = String(format: "%.2f", quartValue)
                   Ons.text = String(format: "%.1f", ounceValue)
                   Liter.text = String(format: "%.1f", intNum1)
                   
               } else if operation == "m³" {
                   let literValue = intNum1 * 1000.0
                   let milliliterValue = intNum1 * 1_000_000.0
                   let pintValue = intNum1 * 2113.38
                   let quartValue = intNum1 * 1056.69
                   let gallonValue = intNum1 * 264.172
                   let ounceValue = intNum1 * 33_814.0

                   Liter.text = String(format: "%.1f", literValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Pint.text = String(format: "%.2f", pintValue)
                   Gallon.text = String(format: "%.2f", gallonValue)
                   Quart.text = String(format: "%.2f", quartValue)
                   Ons.text = String(format: "%.1f", ounceValue)
                   Cubic.text = String(format: "%.1f", intNum1)
                   
               } else if operation == "qt" {
                   let cubicMeterValue = intNum1 * 0.000946353
                   let literValue = intNum1 * 0.946353
                   let milliliterValue = intNum1 * 946.353
                   let pintValue = intNum1 * 2
                   let gallonValue = intNum1 * 0.25
                   let ounceValue = intNum1 * 32.0

                   Cubic.text = String(format: "%.4f", cubicMeterValue)
                   Liter.text = String(format: "%.2f", literValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Gallon.text = String(format: "%.2f", gallonValue)
                   Ons.text = String(format: "%.1f", ounceValue)
                   Pint.text = String(format: "%.1f", pintValue)
                   Quart.text = String(describing: intNum1)

                   
               } else if operation == "oz" {
                   let cubicMeterValue = intNum1 * 2.95735e-5
                   let literValue = intNum1 * 0.0295735
                   let milliliterValue = intNum1 * 29.5735
                   let pintValue = intNum1 * 0.0625
                   let quartValue = intNum1 * 0.03125
                   let gallonValue = intNum1 * 0.0078125
                   let ounceValue = intNum1

                   Cubic.text = String(format: "%.5f", cubicMeterValue)
                   Liter.text = String(format: "%.2f", literValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Pint.text = String(format: "%.2f", pintValue)
                   Quart.text = String(format: "%.2f", quartValue)
                   Gallon.text = String(format: "%.3f", gallonValue)
                   Ons.text = String(format: "%.1f", ounceValue)
                   
                   
               } else if operation == "ml" {
                   let cubicMeterValue = intNum1 * 1e-6
                   let literValue = intNum1 * 0.001
                   let pintValue = intNum1 * 0.00211338
                   let quartValue = intNum1 * 0.00105669
                   let gallonValue = intNum1 * 0.000264172
                   let ounceValue = intNum1 * 0.033814

                   Cubic.text = String(format: "%.6f", cubicMeterValue)
                   Liter.text = String(format: "%.3f", literValue)
                   Pint.text = String(format: "%.3f", pintValue)
                   Gallon.text = String(format: "%.4f", gallonValue)
                   Quart.text = String(format: "%.3f", quartValue)
                   Ons.text = String(format: "%.2f", ounceValue)
                   Mililiter.text = String(format: "%.1f", Double(intNum1))
                   
             } else if operation == "pt" {
                   let cubicMeterValue = intNum1 * 4.73176e-4
                   let literValue = intNum1 * 0.473176
                   let milliliterValue = intNum1 * 473.176
                   let gallonValue = intNum1 * 0.125
                   let quartValue = intNum1 / 2
                   let ounceValue = intNum1 * 16.0

                   Cubic.text = String(format: "%.4f", cubicMeterValue)
                   Liter.text = String(format: "%.2f", literValue)
                   Mililiter.text = String(format: "%.1f", milliliterValue)
                   Gallon.text = String(format: "%.2f", gallonValue)
                   Quart.text = String(format: "%.1f", quartValue)
                   Ons.text = String(format: "%.1f", ounceValue)
                   Pint.text = String(describing: intNum1)
                          
            }

                   isFirst = true
                   num1 = ""
                   Podium.text = "0"
                   labelCubic.isHidden = false
                   labelMililiter.isHidden = false
                   labelGallon.isHidden = false
                   labelLiter.isHidden = false
                   labelQuart.isHidden = false
                   labelPint.isHidden = false
                   lableOns.isHidden = false
                   Cubic.isHidden = false
                   Mililiter.isHidden = false
                   Gallon.isHidden = false
                   Pint.isHidden = false
                   Liter.isHidden = false
                   Quart.isHidden = false
                   Ons.isHidden = false
                   Podium.isHidden = true
               }
        
    
    
    @IBAction func Cleaner(_ sender: Any) {
        isFirst = true
        num1 = ""
        Podium.text = "0"
        Cubic.text = ""
        Mililiter.text = ""
        Gallon.text = ""
        Pint.text = ""
        Liter.text = ""
        Quart.text = ""
        Ons.text = ""
        labelCubic.isHidden = true
        labelMililiter.isHidden = true
        labelGallon.isHidden = true
        labelLiter.isHidden = true
        labelQuart.isHidden = true
        labelPint.isHidden = true
        lableOns.isHidden = true
        Cubic.isHidden = true
        Mililiter.isHidden = true
        Gallon.isHidden = true
        Pint.isHidden = true
        Liter.isHidden = true
        Quart.isHidden = true
        Ons.isHidden = true
        Podium.isHidden = false
    }
    
}
