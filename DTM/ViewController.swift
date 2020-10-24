//
//  ViewController.swift
//  DTM
//
//  Created by Syedaffan on 8/24/20.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // creating the database
   // let realmDatabase = try! Realm()
    
   
    
    
    @IBOutlet weak var locPick: UIPickerView!

    @IBOutlet weak var nextb: UIButton!
    
    var locationPicker:[String] = [String]();
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        render()
        
    
        
       
        //picker view init
        self.locPick.delegate = self
        self.locPick.dataSource = self
        locationPicker = ["Greater Noida","Noida","Delhi"]
        
        
        
        
                
    }
    
    @IBAction func next(_ sender: Any) {
        // prints what region is being selceted currently by the user
        let selectedReg = locationPicker[locPick.selectedRow(inComponent: 0)]
        
       // print(selectedReg)
        
        nextb.layer.shadowOpacity = 0.0;
        
        myGlobalVar.region = selectedReg
        
        
            performSegue(withIdentifier: "Malls", sender: self)
        
       
        print("here is the value whenever its initated "+selectedReg)
      
        
    }
    
    //functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationPicker.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationPicker[row]
    }

    func render(){
        nextb.layer.cornerRadius = 10
        locPick.layer.cornerRadius = 20
        nextb.layer.shadowOffset = CGSize(width: 2.0, height: 2.0);
        nextb.layer.shadowRadius = 2.0;
        nextb.layer.shadowOpacity = 1.0;
        nextb.layer.masksToBounds = false;
        locPick.layer.shadowOffset = CGSize(width: 2.0, height: 2.0);
        locPick.layer.shadowRadius = 2.0;
        locPick.layer.shadowOpacity = 1.0;
        locPick.layer.masksToBounds = false;
    }
    // global variable
    struct myGlobalVar {
        static var region = String()
    }
    //uiyfu
}


