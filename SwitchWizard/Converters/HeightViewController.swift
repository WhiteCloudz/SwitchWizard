//
//  HeightViewController.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 8/5/23.
//

import UIKit
import Foundation

    class HeightViewController: UIViewController {
        @IBOutlet weak var Podium: UILabel!
        @IBOutlet weak var Feet: UILabel!
        @IBOutlet weak var Kilometre: UILabel!
        @IBOutlet weak var Centimetre: UILabel!
        @IBOutlet weak var Mile: UILabel!
        @IBOutlet weak var Inch: UILabel!
        @IBOutlet weak var Metre: UILabel!
        @IBOutlet weak var labelFeet: UILabel!
        @IBOutlet weak var labelMetre: UILabel!
        @IBOutlet weak var labelInch: UILabel!
        @IBOutlet weak var labelCentimetre: UILabel!
        @IBOutlet weak var labelKilometre: UILabel!
        @IBOutlet weak var labelMile: UILabel!
        @IBOutlet weak var lableYard: UILabel!
        @IBOutlet var backroundView: UIView!
        @IBOutlet weak var yard: UILabel!
        
        @IBOutlet weak var yd: UIButton!
        @IBOutlet weak var ac: UIButton!
        @IBOutlet weak var ft: UIButton!
        @IBOutlet weak var m: UIButton!
        @IBOutlet weak var zero: UIButton!
        @IBOutlet weak var point: UIButton!
        @IBOutlet weak var cm: UIButton!
        @IBOutlet weak var nine: UIButton!
        @IBOutlet weak var eight: UIButton!
        @IBOutlet weak var seven: UIButton!
        @IBOutlet weak var inc: UIButton!
        @IBOutlet weak var six: UIButton!
        @IBOutlet weak var five: UIButton!
        @IBOutlet weak var four: UIButton!
        @IBOutlet weak var km: UIButton!
        @IBOutlet weak var three: UIButton!
        @IBOutlet weak var two: UIButton!
        @IBOutlet weak var one: UIButton!
        @IBOutlet weak var mi: UIButton!
        
        var isFirst = true
        var num1:String = ""
        var operation = ""
       
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupBackroundImageToVievController(imageNamed: "backround 3" , backroundView: backroundView)
            labelFeet.isHidden = true
            lableYard.isHidden = true
            labelInch.isHidden = true
            labelMile.isHidden = true
            labelMetre.isHidden = true
            labelKilometre.isHidden = true
            labelCentimetre.isHidden = true
            Centimetre.isHidden = true
            Feet.isHidden = true
            yard.isHidden = true
            Inch.isHidden = true
            Metre.isHidden = true
            Kilometre.isHidden = true
            Mile.isHidden = true
            Podium.text = "0"
        
            cornerRadius(buttonName: ac)
            cornerRadius(buttonName: ft)
            cornerRadius(buttonName: m)
            cornerRadius(buttonName: zero)
            cornerRadius(buttonName: point)
            cornerRadius(buttonName: cm)
            cornerRadius(buttonName: nine)
            cornerRadius(buttonName: eight)
            cornerRadius(buttonName: seven)
            cornerRadius(buttonName: inc)
            cornerRadius(buttonName: six)
            cornerRadius(buttonName: five)
            cornerRadius(buttonName: four)
            cornerRadius(buttonName: km)
            cornerRadius(buttonName: three)
            cornerRadius(buttonName: two)
            cornerRadius(buttonName: one)
            cornerRadius(buttonName: mi)
            cornerRadius(buttonName: yd)
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
            labelFeet.isHidden = true
            lableYard.isHidden = true
            labelInch.isHidden = true
            labelMile.isHidden = true
            labelMetre.isHidden = true
            labelKilometre.isHidden = true
            labelCentimetre.isHidden = true
            Centimetre.isHidden = true
            Feet.isHidden = true
            yard.isHidden = true
            Inch.isHidden = true
            Metre.isHidden = true
            Kilometre.isHidden = true
            Mile.isHidden = true
            
        }
   
        

        @IBAction func Result(_ sender: Any) {
            let button: UIButton = sender as! UIButton
            guard let text = button.titleLabel?.text else {return}
            operation = text
            Podium.text = num1
            isFirst = false
            
            guard let intNum1 = Double(num1) else {
                return
            }
            
            if operation == "ft" {
                let yardValue = String(format: "%.2f", intNum1 * 0.333333)
                    yard.text = yardValue
                
                let cmValue = String(format: "%.1f", intNum1 * 30.48)
                Centimetre.text = cmValue
                
            
                let kmValue = String(format: "%.4f", intNum1 * 0.000305)
                Kilometre.text =  kmValue
                
               
                let inValue = String(format: "%.2f", intNum1 * 12)
                Inch.text = inValue
                
                let mileValue = String(format: "%.4f", intNum1 / 5280)
                Mile.text =  mileValue
                
                Feet.text = String(describing: intNum1)
                
                let metreValue = String(format: "%.1f", intNum1 * 0.3048)
                Metre.text = metreValue
                
            }else if operation == "cm"{
                let yardValue = String(format: "%.2f", intNum1 * 0.0109361)
                    yard.text = yardValue
               
                Centimetre.text = String(describing: intNum1)
                
                let kmValue = String(format: "%.5f", intNum1 / 100000)
                Kilometre.text =  kmValue
                
                let inValue = String(format: "%.2f", intNum1 / 2.54)
                Inch.text = inValue
                
                let mileValue = String(format: "%.5f", intNum1 / 160934.4)
                Mile.text =  mileValue
                
              
                let feetValue = String(format: "%.2f", intNum1 / 30.48)
                Feet.text =  feetValue
                
                let metreValue = String(format: "%.2f", intNum1  / 100)
                Metre.text = metreValue
                
            }else if operation == "in"{
                let yardValue = String(format: "%.2f", intNum1 * 0.0277778)
                    yard.text = yardValue
                
                let cmValue = String(format: "%.1f", intNum1 * 2.54)
                Centimetre.text = cmValue
                
                let kmValue = String(format: "%.5f", intNum1 / 39370.1)
                Kilometre.text =  kmValue
                
                Inch.text = String(describing: intNum1)
                
                let mileValue = String(format: "%.5f", intNum1 / 63360)
                Mile.text =  mileValue
                
                let feetValue = String(format: "%.3f", intNum1 / 12)
                Feet.text =  feetValue
                
                let metreValue = String(format: "%.2f", intNum1 * 0.0254)
                Metre.text = metreValue
                
            }else if operation == "mi"{
                let yardValue = String(format: "%.2f", intNum1 * 1760)
                   yard.text = yardValue
                
                let cmValue = String(format: "%.1f", intNum1 * 160934.4)
                Centimetre.text = cmValue
                
                let kmValue = String(format: "%.2f", intNum1 * 1.60934)
                Kilometre.text =  kmValue
                
              
                let inValue = String(format: "%.1f", intNum1 * 63360)
                Inch.text = inValue
                
                Mile.text = String(describing: intNum1)
                
                let feetValue = String(format: "%.1f", intNum1  * 5280)
                Feet.text =  feetValue
            
                let metreValue = String(format: "%.1f", intNum1 * 1609.34)
                Metre.text = metreValue
                
            }else if operation == "km"{
                let yardValue = String(format: "%.2f", intNum1 * 1093.61)
                   yard.text = yardValue
                
                let cmValue = String(format: "%.1f", intNum1 * 100000)
                Centimetre.text = cmValue
                
                Kilometre.text = String(describing: intNum1)
                
                let inValue = String(format: "%.2f", intNum1 * 39370.1)
                Inch.text = inValue
            
                let mileValue = String(format: "%.2f", intNum1  * 0.621371)
                Mile.text =  mileValue
                
                let feetValue = String(format: "%.2f", intNum1  * 3280.84)
                Feet.text =  feetValue
                
                let metreValue = String(format: "%.1f", intNum1 * 1000)
                Metre.text = metreValue
           
            }else if operation == "m"{
                let yardValue = String(format: "%.2f", intNum1 * 1.09361)
                    yard.text = yardValue
              
                let cmValue = String(format: "%.1f", intNum1  * 100)
                Centimetre.text = cmValue
                
                let kmValue = String(format: "%.4f", intNum1  / 1000)
                Kilometre.text =  kmValue
                
                let inValue = String(format: "%.2f", intNum1 * 39.37)
                Inch.text = inValue
            
                let mileValue = String(format: "%.4f", intNum1  * 0.000621371)
                Mile.text =  mileValue
                
                let feetValue = String(format: "%.2f", intNum1 * 3.28084)
                Feet.text =  feetValue
                
                Metre.text = String(describing: intNum1)
                
            }else if operation == "yd" {
                let cmValue = String(format: "%.1f", intNum1 * 91.44)
                    Centimetre.text = cmValue
                    
                    let kmValue = String(format: "%.4f", intNum1 * 0.0009144)
                    Kilometre.text = kmValue
                    
                    let inValue = String(format: "%.2f", intNum1 * 36)
                    Inch.text = inValue
                    
                    let mileValue = String(format: "%.4f", intNum1 / 1760)
                    Mile.text = mileValue
                    
                    let feetValue = String(format: "%.2f", intNum1 * 3)
                    Feet.text =  feetValue
                    
                    let metreValue = String(format: "%.1f", intNum1 * 0.9144)
                    Metre.text = metreValue
                    
                    yard.text = String(describing: intNum1)
            }
                
                        
            isFirst = true
            num1 = ""
            Podium.text = "0"
            labelFeet.isHidden = false
            labelInch.isHidden = false
            labelMile.isHidden = false
            labelMetre.isHidden = false
            labelKilometre.isHidden = false
            labelCentimetre.isHidden = false
            Centimetre.isHidden = false
            Feet.isHidden = false
            Inch.isHidden = false
            Metre.isHidden = false
            Kilometre.isHidden = false
            Mile.isHidden = false
            Podium.isHidden = true
            lableYard.isHidden = false
            yard.isHidden = false
            }
        
        
        @IBAction func Cleaner(_ sender: Any) {
            isFirst = true
            num1 = ""
            Podium.text = "0"
            Centimetre.text = ""
            Kilometre.text = ""
            Inch.text = ""
            Mile.text = ""
            Feet.text = ""
            Metre.text = ""
            labelFeet.isHidden = true
            lableYard.isHidden = true
            labelInch.isHidden = true
            labelMile.isHidden = true
            labelMetre.isHidden = true
            labelKilometre.isHidden = true
            labelCentimetre.isHidden = true
            Centimetre.isHidden = true
            Feet.isHidden = true
            yard.isHidden = true
            Inch.isHidden = true
            Metre.isHidden = true
            Kilometre.isHidden = true
            Mile.isHidden = true
            Podium.isHidden = false
        }
        
    }
