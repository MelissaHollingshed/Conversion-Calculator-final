//
//  CalculatorViewController.swift
//  Conversion Calculator final
//
//  Created by Melissa Hollingshed on 12/7/18.
//  Copyright © 2018 Melissa Hollingshed. All rights reserved.
//


import UIKit

class ConversionsViewController: UIViewController {
    
    var model = Model()
 
    
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var plusMiunsButton: UIButton!
    @IBOutlet weak var converterButton: UIButton!
    @IBOutlet weak var sevanButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    
    
    
    @IBAction func converterButtonAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: "Choose Conversion", preferredStyle: .actionSheet)
        for x in 0..<model.converterArray.count {
            actionSheet.addAction(UIAlertAction(title: model.converterArray[x].label, style: .default , handler:{ (UIAlertAction)in
                self.changeConverter(index: x)
            }))
        }
        self.present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func signButtonAction(_ sender: Any) {
        if (model.currentIn == "") { return }
        if (model.currentIn.first == "-") {model.currentIn.removeFirst()}
        else {model.currentIn = "-" + model.currentIn}
        model.currentOut = String(format: "%.2f", Double(convert(model.currentIn, model.currentConverter))!)
        updateView()
    }
    @IBAction func clearButtonAction(_ sender: Any) {
        model.currentIn = ""
        model.currentOut = ""
        model.decimalFlag = false
        updateView()
    }
    @IBAction func numberButtonAction(_ sender: Any) {
        if (((sender as! UIButton).titleLabel?.text!)! == ".") {
            if (model.decimalFlag == false) {
                model.currentIn.append(((sender as! UIButton).titleLabel?.text!)!)
                updateView()
                model.decimalFlag = true
                return
            } else { return }
        }
        model.currentIn.append(((sender as! UIButton).titleLabel?.text!)!)
        model.currentOut = String(format: "%.2f", Double(convert(model.currentIn, model.currentConverter))!)
        updateView()
    }
    func updateView() {
        outputDisplay.text = model.currentOut + " " + model.converterArray[model.currentConverter].outputUnit!
        inputDisplay.text = model.currentIn + " " + model.converterArray[model.currentConverter].inputUnit!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearButton.roundButtons()
        decimalButton.roundButtons()
        plusMiunsButton.roundButtons()
        converterButton.roundButtons()
        sevanButton.roundButtons()
        eightButton.roundButtons()
        nineButton.roundButtons()
        fourButton.roundButtons()
        fiveButton.roundButtons()
        sixButton.roundButtons()
        oneButton.roundButtons()
        twoButton.roundButtons()
        threeButton.roundButtons()
        zeroButton.layer.cornerRadius = 20
        zeroButton.layer.borderWidth = 5
     
        
    }
    
    func changeConverter(index: Int) {
        clearButtonAction(clearButton)
        inputDisplay.text = model.converterArray[index].inputUnit
        outputDisplay.text = model.converterArray[index].outputUnit
        model.currentConverter = index
    }
    
    func doubleFromInput(_ input: String) -> Double? {
        var input = input
        if (input.last == ".") { input = String(input.dropLast()) }
        return Double(input)
    }
    
    func convert(_ input: String,_ classifier: Int) -> String {
        let input = doubleFromInput(input)
        var output = 0.0
        if (input == nil) { return "" }
        switch classifier {
        case 0 : output = (input! - 32) * 5/9
        case 1 : output = (input! * 9/5) + 32
        case 2 : output = (input! / 0.62137)
        case 3 : output = (input! * 0.62137)
        default : output = 0.0
        }
        return String(output)
    }
    

}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension UIButton {
    func roundButtons() {
        self.layer.masksToBounds = false
        self.layer.borderWidth = 8
       // self.layer.cornerRadius = self.frame.width / 2
        self.layer.cornerRadius = self.frame.width / 2

    }}
