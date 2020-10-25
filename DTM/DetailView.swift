//
//  DetailView.swift
//  DTM
//
//  Created by Syedaffan on 10/25/20.
//

import UIKit

class DetailView: UIViewController {
// all outlets
    @IBOutlet weak var navigation: UIButton!
    @IBOutlet weak var dislabel: UILabel!
    @IBOutlet weak var mallimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //rendering all the detail for the selcted mall while the detail seque starts at first
       render()
       
    }
    // navigation/map action
    @IBAction func navigationButton(_ sender: Any) {
    }
    // big boss 2 lies here
    func render(){
        //checking selected region
        // like here we check foro grnoida and we know we got 4 malls , since we are having reusable buttons we cant assign them all in one so we have to check what region we are in and then populating the data of the mall we selcted from that region
        if ViewController.myGlobalVar.region == "Greater Noida"{
            // the switch statement here is an integer it is the sender.tag global variable
        switch Malls.importer.sender {
        //if the sender.tag was 0..3 do this
        case 0:// on zero tag we know its grand venice hence we do the following stuff
            mallimage.image = UIImage(data: Malls.importer.imagegrv!)//gr venice data
        case 1:
            mallimage.image = UIImage(data: Malls.importer.imagemsx!)
        case 2:
            mallimage.image = UIImage(data: Malls.importer.imageans!)
        case 3:
            mallimage.image = UIImage(data: Malls.importer.imageomx!)
        default:
            return
        }
        }else if ViewController.myGlobalVar.region == "Noida"{
            switch Malls.importer.sender {
            case 0:
                mallimage.image = UIImage(data: Malls.importer.imagedm!)
            case 1:
                mallimage.image = UIImage(data: Malls.importer.imagelc!)
            case 2:
                mallimage.image = UIImage(data: Malls.importer.imagegg!)
            case 3:
                mallimage.image = UIImage(data: Malls.importer.imagegp!)
            default:
                return
            }
            
            
        }else if ViewController.myGlobalVar.region == "Delhi"{
            
            switch Malls.importer.sender {
            case 0:
                mallimage.image = UIImage(data: Malls.importer.imagevs!)
            case 1:
                mallimage.image = UIImage(data: Malls.importer.imagetc!)
            case 2:
                mallimage.image = UIImage(data: Malls.importer.imagecc!)
            case 3:
                mallimage.image = UIImage(data: Malls.importer.imagecm!)
            case 4:
                mallimage.image = UIImage(data: Malls.importer.imageds!)
            case 5:
                mallimage.image = UIImage(data: Malls.importer.imageam!)
            case 6:
                mallimage.image = UIImage(data: Malls.importer.imagepm!)
            case 7:
                mallimage.image = UIImage(data: Malls.importer.imagesc!)
            default:
                return
            }
            
        }
        
    }

}
