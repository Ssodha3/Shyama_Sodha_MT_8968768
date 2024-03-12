//
//  Lab3ViewController.swift
//  Shyama_Sodha_MT_8968768
//lab3 logic
import UIKit

class Lab3ViewController: UIViewController {

    @IBOutlet weak var fNameTf: UITextField!
    @IBOutlet weak var lNameTf: UITextField!
    @IBOutlet weak var countryTf: UITextField!
    @IBOutlet weak var ageTf: UITextField!
    @IBOutlet weak var hiddenLb: UILabel!
    @IBOutlet weak var userInfoTv: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenLb.isHidden = true
        userInfoTv.isEditable = false
       
    }
    
    @IBAction func addBtn(_ sender: Any) {
        //show info that entered
        showInfo()
        userInfoTv.isEditable = false
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        statusLb()
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        newForm()
    }
    
    private func showInfo(){
        
        let fName = fNameTf.text ?? ""
        let lName = lNameTf.text ?? ""
        let countryName = countryTf.text ?? ""
        let userAge = ageTf.text ?? ""
        
        let userData = "First Name:\(fName)\n Last Name:\(lName)\n Country:\(countryName)\n Age:\(userAge)"
        
        userInfoTv.text = userData
        
    }
    
    private func statusLb(){
        //clear all field n show info in textview
        let fName = fNameTf.text ?? ""
        let lName = lNameTf.text ?? ""
        let countryName = countryTf.text ?? ""
        let userAge = ageTf.text ?? ""
        
        if fName.isEmpty || lName.isEmpty || countryName.isEmpty || userAge.isEmpty {
            
            hiddenLb.text = "Complete the missing info!"
        }else{
            
            hiddenLb.text = "Successfully submitted"
            
            let userData = "First Name:\(fName)\n Last Name:\(lName)\n Country:\(countryName)\n Age:\(userAge)"
            
            userInfoTv.text = userData
            
            fNameTf.text = ""
            lNameTf.text = ""
            countryTf.text = ""
            ageTf.text = ""
        }
        
        hiddenLb.isHidden = false
        
    }
    
    private func newForm(){
        
        //clear all n reset to new form
        fNameTf.text = ""
        lNameTf.text = ""
        countryTf.text = ""
        ageTf.text = ""
        userInfoTv.text = ""
        
        userInfoTv.isEditable = false
        hiddenLb.isHidden = true
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.becomeFirstResponder()
        }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
