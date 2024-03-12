//
//  CanadaSceneViewController.swift
//  Shyama_Sodha_MT_8968768

import UIKit

class CanadaSceneViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var errMsgL: UILabel!
    @IBOutlet weak var nameTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTf.delegate = self
    }

    @IBAction func findBtn(_ sender: UIButton) {
        
        //check if empty
        guard let cityName = nameTf.text else{
            return
        }
        cityImage(cityName)
    }
    
    func cityImage(_ cityName: String){

        var img = ""
        var errMsg = ""
        
        //set img according to text
        switch cityName.lowercased() {
        case "toronto":
            img = "Toronto"
        case "calgary":
            img = "Calgary"
        case "halifax":
            img = "Halifax"
        case "montreal":
            img = "Montreal"
        case "vancouver":
            img = "Vancouver"
        case "winnipeg":
            img = "Winnipeg"
        default:
            errMsg = "city not found!"
        }
            if img != ""{
                cityImg.image = UIImage(named: img)
                errMsgL.isHidden = true
            }
            else{
                errMsgL.isHidden = false
                errMsgL.text = errMsg
            }
    }
    
    //keyboard gone when click outside textfield
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
