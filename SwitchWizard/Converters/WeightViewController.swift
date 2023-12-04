//
//  WeightViewController.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 8/5/23.
//

import UIKit

class WeightViewController: UIViewController {
    
    
    @IBOutlet weak var Podium: UILabel!
    @IBOutlet weak var Pound:UILabel!
    @IBOutlet weak var Kilogram: UILabel!
    @IBOutlet weak var Ons: UILabel!
    @IBOutlet weak var Ton: UILabel!
    @IBOutlet weak var Gram: UILabel!
    @IBOutlet weak var lableKilogram: UILabel!
    @IBOutlet weak var lableTon: UILabel!
    @IBOutlet weak var lablePound: UILabel!
    @IBOutlet weak var lableGram: UILabel!
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var lableOns: UILabel!
    
    
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var lb: UIButton!
    @IBOutlet weak var kg: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var oz: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
   
    
    
    var isFirst = true
    var num1:String = ""
    var operation = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround 3" , backroundView: backroundView)
        Pound.isHidden = true
        Ton.isHidden = true
        Ons.isHidden = true
        Kilogram.isHidden = true
        Gram.isHidden = true
        lableTon.isHidden = true
        lablePound.isHidden = true
        lableKilogram.isHidden = true
        lableOns.isHidden = true
        lableGram.isHidden = true
        
        Podium.text = "0"
        
        cornerRadius(buttonName: ac)
        cornerRadius(buttonName: lb)
        cornerRadius(buttonName: kg)
        cornerRadius(buttonName: zero)
        cornerRadius(buttonName: point)
        cornerRadius(buttonName: g)
        cornerRadius(buttonName: nine)
        cornerRadius(buttonName: eight)
        cornerRadius(buttonName: seven)
        cornerRadius(buttonName: oz)
        cornerRadius(buttonName: six)
        cornerRadius(buttonName: five)
        cornerRadius(buttonName: four)
        cornerRadius(buttonName: t)
        cornerRadius(buttonName: three)
        cornerRadius(buttonName: two)
        cornerRadius(buttonName: one)
        
    }
    
    
    @IBAction func Numbers(_ sender: Any) {
        let button:UIButton = sender as! UIButton
        guard let text = button.titleLabel?.text else {return}
        num1 += text
        Podium.text = num1
        Podium.isHidden = false
        Pound.isHidden = true
        Ton.isHidden = true
        Ons.isHidden = true
        Kilogram.isHidden = true
        Gram.isHidden = true
        lableTon.isHidden = true
        lablePound.isHidden = true
        lableKilogram.isHidden = true
        lableOns.isHidden = true
        lableGram.isHidden = true
        
        cornerRadius(buttonName: ac)
        cornerRadius(buttonName: lb)
        cornerRadius(buttonName: kg)
        cornerRadius(buttonName: zero)
        cornerRadius(buttonName: point)
        cornerRadius(buttonName: g)
        cornerRadius(buttonName: nine)
        cornerRadius(buttonName: eight)
        cornerRadius(buttonName: seven)
        cornerRadius(buttonName: oz)
        cornerRadius(buttonName: six)
        cornerRadius(buttonName: five)
        cornerRadius(buttonName: four)
        cornerRadius(buttonName: t)
        cornerRadius(buttonName: three)
        cornerRadius(buttonName: two)
        cornerRadius(buttonName: one)
       
     
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait // Sadece dikey (portrait) konumda kalmasını sağlar
        }

    
    
    @IBAction func Result(_ sender: Any) {
        let button:UIButton = sender as! UIButton
        guard let text = button.titleLabel?.text else {return}
        operation = text
        isFirst = false
        guard let intNum1 = Double(num1) else {return}
            
        if operation == "lb" {
                let poundValue = String(format: "%.1f", intNum1)
                Pound.text = poundValue

                let kilogramValue = String(format: "%.2f", intNum1 * 0.453592)
                Kilogram.text = kilogramValue

                let gramValue = String(format: "%.2f", intNum1 * 453.592)
                Gram.text = gramValue

                let ozValue = String(format: "%.1f", intNum1 * 16.0)
                Ons.text = ozValue

                let tonValue = String(format: "%.4f", intNum1 * 0.0005)
                Ton.text = tonValue
            
            } else if operation == "kg" {
                let poundValue = String(format: "%.1f", intNum1 * 2.20462)
                Pound.text = poundValue

                let kilogramValue = String(format: "%.1f", intNum1)
                Kilogram.text = kilogramValue

                let gramValue = String(format: "%.1f", intNum1 * 1000.0)
                Gram.text = gramValue

                let ozValue = String(format: "%.2f", intNum1 * 35.274)
                Ons.text = ozValue

                let tonValue = String(format: "%.3f", intNum1 * 0.00110231)
                Ton.text = tonValue
                
            } else if operation == "g" {
                let poundValue = String(format: "%.3f", intNum1 * 0.00220462)
                Pound.text = poundValue

                let kilogramValue = String(format: "%.3f", intNum1 * 0.001)
                Kilogram.text = kilogramValue

                let gramValue = String(format: "%.1f", intNum1)
                Gram.text = gramValue

                let ozValue = String(format: "%.2f", intNum1 * 0.035274)
                Ons.text = ozValue

                let tonValue = String(format: "%.6f", intNum1 * 0.00000110231)
                Ton.text = tonValue
                
            } else if operation == "oz" {
                let poundValue = String(format: "%.3f", intNum1 * 0.0625)
                Pound.text = poundValue

                let kilogramValue = String(format: "%.3f", intNum1 * 0.0283495)
                Kilogram.text = kilogramValue

                let gramValue = String(format: "%.2f", intNum1 * 28.3495)
                Gram.text = gramValue

                let ozValue = String(format: "%.1f", intNum1)
                Ons.text = ozValue

                let tonValue = String(format: "%.5f", intNum1 * 0.00003125)
                Ton.text = tonValue
                
            } else if operation == "t" {
                let poundValue = String(format: "%.1f", intNum1 * 2204.62)
                Pound.text = poundValue

                let kilogramValue = String(format: "%.1f", intNum1 * 1000.0)
                Kilogram.text = kilogramValue
                
                let gramValue = String(format: "%.1f", intNum1 * 1000000)
                Gram.text = gramValue
                
                let ozValue = String(format: "%.1f", intNum1 * 35274)
                Ons.text = ozValue
                        
                let tonValue = String(format: "%.1f", intNum1)
                Ton.text = tonValue
           
            }
        
        
        
        Pound.isHidden = false
        Ton.isHidden = false
        Ons.isHidden = false
        Kilogram.isHidden = false
        Gram.isHidden = false
        lableTon.isHidden = false
        lablePound.isHidden = false
        lableKilogram.isHidden = false
        lableOns.isHidden = false
        lableGram.isHidden = false
        isFirst = true
        num1 = ""
        Podium.text = "0"
        Podium.isHidden = true
    }
    
    
    @IBAction func Cleaner(_ sender: Any) {
       
        isFirst = true
        num1 = ""
        operation = ""
        Podium.text = "0"
        Podium.isHidden = false
        Pound.isHidden = true
        Ton.isHidden = true
        Ons.isHidden = true
        Kilogram.isHidden = true
        Gram.isHidden = true
        lableTon.isHidden = true
        lablePound.isHidden = true
        lableKilogram.isHidden = true
        lableOns.isHidden = true
        lableGram.isHidden = true
    }
    
}
