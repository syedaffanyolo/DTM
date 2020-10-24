//
//  DetailView.swift
//  DTM
//
//  Created by Syedaffan on 10/25/20.
//

import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var navigation: UIButton!
    @IBOutlet weak var dislabel: UILabel!
    @IBOutlet weak var mallimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mallimage.image = UIImage(data: Malls.importer.image)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigationButton(_ sender: Any) {
    }
    
   

}
