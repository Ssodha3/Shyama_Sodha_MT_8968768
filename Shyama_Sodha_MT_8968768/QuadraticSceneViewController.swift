//
//  QuadraticSceneViewController.swift
//  Shyama_Sodha_MT_8968768

//formula calculation logic
import UIKit

class QuadraticSceneViewController: UIViewController, UITextFieldDelegate {
    
    
    //all connection
    @IBOutlet weak var aValueTf: UITextField!
    @IBOutlet weak var bValueTf: UITextField!
    @IBOutlet weak var cValueTf: UITextField!
    @IBOutlet weak var msgHiddenTv: UITextView!
    @IBOutlet weak var sumHiddenTv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sumHiddenTv.isHidden = true
        msgHiddenTv.isHidden = true
        
        aValueTf.delegate = self
        bValueTf.delegate = self
        cValueTf.delegate = self
        
        //only no keyboard
        aValueTf.keyboardType = .numberPad
        bValueTf.keyboardType = .numberPad
        cValueTf.keyboardType = .numberPad

    }
    
    //calculate button fun
    @IBAction func calculateBtn(_ sender: UIButton) {
        
        //check if empty
        guard let a = Double(aValueTf.text ?? ""),
              let b = Double(bValueTf.text ?? ""),
              let c = Double(cValueTf.text ?? "") else{
            errMsg("Enter a value for A, B, and C to find X.")
            return
        }
        
        if a == 0 {
            errMsg("The value you entered for A is invalid.")
            return
        }
        //formula of quadration
        let formula = b*b-4*a*c
        
        //all 3 descriminant
        if formula<0{
            errMsg("There are no results since the discriminant is less than zero.")
        }else if formula == 0 {
            let x = -b/(2*a)
            showAns("There is only one value for X: \(x)")
        }else{
            let x1 = (-b+sqrt(formula)) / (2*a)
            let x2 = (-b - sqrt(formula)) / (2*a)
            
            showAns("There are two values for X: \(x1), \(x2)")
        }
    }
    
    //clear all field when click
    @IBAction func clearBtn(_ sender: UIButton) {
        clearAll()
    }
    
    //display errmsg
    func errMsg(_ message: String){
        msgHiddenTv.isHidden=false
        msgHiddenTv.text = message
        sumHiddenTv.isHidden = true
    }
    
    //display calculation
    func showAns(_ result: String){
        sumHiddenTv.isHidden = false
        let finalAns = String(format: "%.2f", result)
        sumHiddenTv.text = finalAns
        msgHiddenTv.isHidden = true
    }
    
    func clearAll(){
        aValueTf.text = ""
        bValueTf.text = ""
        cValueTf.text = ""
        sumHiddenTv.isHidden = true
        msgHiddenTv.isHidden = true
    }
    
    //keyboard gone when click outside textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
}
