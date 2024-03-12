//
//  Lab2ViewController.swift
//  Shyama_Sodha_MT_8968768

//lab2 working
import UIKit

class Lab2ViewController: UIViewController {

    
    var counter = 0
    var modeInc = false
    
    @IBOutlet weak var txtNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnInc(_ sender: Any) {
        
        //inc counter by 2 if modeinc else inc by 1
        if modeInc{
            counter += 2
        }else{
            counter += 1
        }
        txtNum.text = String(counter)
    }
    
    @IBAction func btnDec(_ sender: Any) {
        //dec counter by 2 if modeinc else dec by 1
        if modeInc{
            counter -= 2
        }else{
            counter -= 1
        }
        txtNum.text = String(counter)
    }
    
    @IBAction func btnAddValue(_ sender: Any) {
        //change to 2 value at a time
        modeInc = true
    }
    @IBAction func btnReset(_ sender: Any) {
        counter = 0
        txtNum.text = String(counter)
        modeInc = false
    }
}
