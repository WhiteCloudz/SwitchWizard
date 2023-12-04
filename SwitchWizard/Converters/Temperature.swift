//
//  Temperature.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 8/5/23.

import UIKit

class Temperature: UIViewController {
    
  
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var kelvin: UILabel!
    @IBOutlet weak var celcius: UILabel!
    @IBOutlet weak var fahrenheit: UILabel!
    @IBOutlet weak var podium: UILabel!
    @IBOutlet weak var lableCelcius: UILabel!
    @IBOutlet weak var lableFahrenheit: UILabel!
    @IBOutlet weak var lableKelvin: UILabel!
    
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var point: UIButton!
    
    var isFirst = true
    var num1:String = ""
    var operation = ""
    var converte = 0.0
    var converteCelcius = 0.0
    var converteKelvin = 0.0
    var converteFahrenheit = 0.0
    let decimaPlaces = 2
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround 3" , backroundView: backroundView)
        podium.text = "0"
        fahrenheit.isHidden = true
        celcius.isHidden = true
        kelvin.isHidden = true
        lableCelcius.isHidden = true
        lableFahrenheit.isHidden = true
        lableKelvin.isHidden = true
        
        cornerRadius(buttonName: ac)
        cornerRadius(buttonName: f)
        cornerRadius(buttonName: c)
        cornerRadius(buttonName: zero)
        cornerRadius(buttonName: k)
        cornerRadius(buttonName: nine)
        cornerRadius(buttonName: eight)
        cornerRadius(buttonName: seven)
        cornerRadius(buttonName: six)
        cornerRadius(buttonName: five)
        cornerRadius(buttonName: four)
        cornerRadius(buttonName: three)
        cornerRadius(buttonName: two)
        cornerRadius(buttonName: one)
        cornerRadius(buttonName: point)
    
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait // Sadece dikey (portrait) konumda kalmasını sağlar
        }
  
   
    
    @IBAction func Numbers(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        guard let text = button.titleLabel?.text else {return}
        podium.isHidden = false
        num1 += text
        podium.text = num1
        
        fahrenheit.text = ""
        celcius.text = ""
        kelvin.text = ""
        isFirst = true
        fahrenheit.isHidden = true
        celcius.isHidden = true
        kelvin.isHidden = true
        lableCelcius.isHidden = true
        lableFahrenheit.isHidden = true
        lableKelvin.isHidden = true
        podium.isHidden = false
        
    }
    
    
    @IBAction func Proces(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        guard let text = button.titleLabel?.text else {return}
        operation = text
        podium.text = num1
        isFirst = false
        
        guard let intNum1 = Double(num1) else {
            return
        }
        
        
        if operation == "°F" {
            converteCelcius = (intNum1 - 32) * 5 / 9
            let celciusValue = String(format: "%.\(decimaPlaces)f", converteCelcius)
            celcius.text = String(describing: celciusValue)
            
            converteKelvin = (intNum1 + 459.67) * 5 / 9
            let kelvinValue = String(format: "%.\(decimaPlaces)f", converteKelvin)
            kelvin.text = String(describing: kelvinValue)
            
            fahrenheit.text = String(describing: intNum1)
            
            
        }else if operation == "°C" {
            converteFahrenheit = (intNum1 * 9 / 5) + 32
            let fahrenheitValue = String(format: "%.\(decimaPlaces)f", converteFahrenheit)
            fahrenheit.text = String(describing: fahrenheitValue)
            
            converteKelvin = (intNum1 + 273.15)
            let kelvinValue = String(format: "%.\(decimaPlaces)f", converteKelvin)
            kelvin.text = String(describing:  kelvinValue)
            
            celcius.text = String(describing: intNum1)
                
            
        }else if operation == "K" {
            converteFahrenheit = (intNum1 - 273.15) * 9 / 5 + 32
            let fahrenheitValue = String(format: "%.\(decimaPlaces)f", converteFahrenheit)
            fahrenheit.text = String(describing: fahrenheitValue)
            
            converteCelcius = (intNum1 - 273.15)
            let celciusValue = String(format: "%.\(decimaPlaces)f", converteCelcius)
            celcius.text = String(describing: celciusValue)
            
            kelvin.text = String(describing: intNum1)
            
            
        }
      
        
        isFirst = true
        operation = ""
        fahrenheit.isHidden = false
        celcius.isHidden = false
        kelvin.isHidden = false
        lableCelcius.isHidden = false
        lableFahrenheit.isHidden = false
        lableKelvin.isHidden = false
        podium.isHidden = true
        podium.text = "0"
        num1 = ""
        
    }
    
    
    @IBAction func Cleaner(_ sender: Any) {
        
        num1 = ""
        podium.text = "0"
        fahrenheit.text = ""
        celcius.text = ""
        kelvin.text = ""
        isFirst = true
        fahrenheit.isHidden = true
        celcius.isHidden = true
        kelvin.isHidden = true
        lableCelcius.isHidden = true
        lableFahrenheit.isHidden = true
        lableKelvin.isHidden = true
        podium.isHidden = false
    }
    
}
