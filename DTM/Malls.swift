//
//  GrNoida.swift
//  DTM
//
//  Created by Syedaffan on 8/24/20.
//

import UIKit


//node.js api
let url = "https://dtmappapi.herokuapp.com/data"
// global variable
//var myregion = ViewController.myGlobalVar.region
class SegueFromLeft: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
                       },
                       completion: { finished in
                        src.present(dst, animated: false, completion: nil)
                       }
        )
    }
}

class Malls: UIViewController {
    
    // all buttons for malls
    @IBOutlet var cards: [UIButton]!
    
    @IBOutlet weak var loderView: UIView!
    
    @IBOutlet weak var loder: UIActivityIndicatorView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // getting api data back iwth rendering all styles
        
        render(url: url)
    }
    
    //button functions
    
    @IBAction func bb(_ sender: UIButton) {
        performSegue(withIdentifier: "detail", sender: self)
       
    }
    
    
    @IBAction func backswipe(_ sender: Any) {
        //performSegue(withIdentifier: "main", sender: (Any).self)
    }
    
    
    
    func render(url:String){
        loder.startAnimating()
        navBar.title = ""
        for i in 0...15{
            cards[i].layer.cornerRadius = 10
            cards[i].titleLabel!.layer.shadowOffset = CGSize(width: 2.0, height: 2.0);
            cards[i].titleLabel!.layer.shadowRadius = 2.0;
            cards[i].titleLabel!.layer.shadowOpacity = 1.0;
            cards[i].titleLabel!.layer.masksToBounds = false;
        }
        // url session to get data back from the api into readable format
       
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("somthin wrong")
                return
            }
            var result: grNoida?
            do {
                result = try JSONDecoder().decode(grNoida.self, from: data)
            } catch  {
                print(error)
            }
            
            guard let json = result else{
                
                return
            }
            // end of the request for api here
            //print(myregion)
            // populating data on the button views!
            
            
            if ViewController.myGlobalVar.region == "Greater Noida"{
                DispatchQueue.main.async { [self] in
                    
                    navBar.title = "Malls in Greater Noida"
                    viewHeight.constant = 1200
                    for i in 4...15{
                        cards[i].isHidden = true
                        cards[i].isEnabled = false
                    }
                    
                    /// grand venice
                    
                    self.cards[0].setTitle(json.gvname, for: .normal)
                    let grvurl = URL(string: json.gvmallimage)!
                    if let datagr = try? Data(contentsOf: grvurl){
                        self.cards[0].setBackgroundImage(UIImage(data: datagr), for: .normal)
                    }
                    
                    /// msxmall
                    self.cards[1].setTitle(json.mmname, for: .normal)
                    let msxurl = URL(string: json.mmmallimage)!
                    if let datamm = try? Data(contentsOf: msxurl){
                        self.cards[1].setBackgroundImage(UIImage(data: datamm), for: .normal)
                    }
                    
                    /// ansalplaza
                    self.cards[2].setTitle(json.apname, for: .normal)
                    let ansurl = URL(string: json.apmallimage)!
                    if let dataap = try? Data(contentsOf: ansurl){
                        self.cards[2].setBackgroundImage(UIImage(data: dataap), for: .normal)
                    }
                    
                    ///omaxearcade
                    self.cards[3].setTitle(json.oaname, for: .normal)
                    let omxurl = URL(string: json.oamallimage)!
                    if let dataoa = try? Data(contentsOf: omxurl){
                        self.cards[3].setBackgroundImage(UIImage(data: dataoa), for: .normal)
                    }
                    self.loder.stopAnimating()
                    self.loder.isHidden = true
                    loder.isUserInteractionEnabled = false
                    loderView.isExclusiveTouch = false
                    loderView.isUserInteractionEnabled = false
                }
            }else if ViewController.myGlobalVar.region == "Noida"{
                // show noida stuff
                DispatchQueue.main.async {
                    
                    self.navBar.title = "Malls in Noida"
                    self.viewHeight.constant = 1200
                    for i in 4...15{
                        self.cards[i].isHidden = true
                        self.cards[i].isEnabled = false
                    }
                    
                    /// dlf mall
                    self.cards[0].setTitle(json.dmname, for: .normal)
                    let dmurl = URL(string: json.dmmallimage)!
                    if let datadm = try? Data(contentsOf: dmurl){
                        self.cards[0].setBackgroundImage(UIImage(data: datadm), for: .normal)
                    }
                    
                    self.cards[1].setTitle(json.lcname, for: .normal)
                    let lcurl = URL(string: json.lcmallimage)!
                    if let datalc = try? Data(contentsOf: lcurl){
                        self.cards[1].setBackgroundImage(UIImage(data: datalc), for: .normal)
                        
                    }
                    
                    self.cards[2].setTitle(json.ggname, for: .normal)
                    let ggurl = URL(string: json.ggmallimage)!
                    if let datagg = try? Data(contentsOf: ggurl){
                        self.cards[2].setBackgroundImage(UIImage(data: datagg), for: .normal)
                        
                    }
                    
                    self.cards[3].setTitle(json.gpname, for: .normal)
                    let gpurl = URL(string: json.gpmallimage)!
                    if let datagp = try? Data(contentsOf: gpurl){
                        self.cards[3].setBackgroundImage(UIImage(data: datagp), for: .normal)
                    }
                    self.loder.stopAnimating()
                    self.loder.isHidden = true
                    self.loder.isUserInteractionEnabled = false
                    self.loderView.isExclusiveTouch = false
                    self.loderView.isUserInteractionEnabled = false
                }
            }else if ViewController.myGlobalVar.region == "Delhi"{
                //delhi stuff here
                
                DispatchQueue.main.async {
                    
                    self.navBar.title = "Malls in Delhi"
                    self.viewHeight.constant = 2400
                    
                    for i in 8...15{
                        self.cards[i].isHidden = true
                        self.cards[i].isEnabled = false
                    }
                    /// dlf mall
                    self.cards[0].setTitle(json.vsname, for: .normal)
                    let vsurl = URL(string: json.vsmallimage)!
                    if let datavs = try? Data(contentsOf: vsurl){
                        self.cards[0].setBackgroundImage(UIImage(data: datavs), for: .normal)
                    }
                    
                    self.cards[1].setTitle(json.tcname, for: .normal)
                    let tcurl = URL(string: json.tcmallimage)!
                    if let datatc = try? Data(contentsOf: tcurl){
                        self.cards[1].setBackgroundImage(UIImage(data: datatc), for: .normal)
                        
                    }
                    
                    self.cards[2].setTitle(json.ccname, for: .normal)
                    let ccurl = URL(string: json.ccmallimage)!
                    if let datacc = try? Data(contentsOf: ccurl){
                        self.cards[2].setBackgroundImage(UIImage(data: datacc), for: .normal)
                        
                    }
                    
                    self.cards[3].setTitle(json.cmname, for: .normal)
                    let cmurl = URL(string: json.cmmallimage)!
                    if let datacm = try? Data(contentsOf: cmurl){
                        self.cards[3].setBackgroundImage(UIImage(data: datacm), for: .normal)
                    }
                    
                    self.cards[4].setTitle(json.dsname, for: .normal)
                    let dsurl = URL(string: json.dsmallimage)!
                    if let datads = try? Data(contentsOf: dsurl){
                        self.cards[4].setBackgroundImage(UIImage(data: datads), for: .normal)
                    }
                    
                    self.cards[5].setTitle(json.amname, for: .normal)
                    let amurl = URL(string: json.ammallimage)!
                    if let dataam = try? Data(contentsOf: amurl){
                        self.cards[5].setBackgroundImage(UIImage(data: dataam), for: .normal)
                        
                    }
                    
                    self.cards[6].setTitle(json.pmname, for: .normal)
                    let pmurl = URL(string: json.pmmallimage)!
                    if let datapm = try? Data(contentsOf: pmurl){
                        self.cards[6].setBackgroundImage(UIImage(data: datapm), for: .normal)
                        
                    }
                    
                    self.cards[7].setTitle(json.scname, for: .normal)
                    let scurl = URL(string: json.scmallimage)!
                    if let datasc = try? Data(contentsOf: scurl){
                        self.cards[7].setBackgroundImage(UIImage(data: datasc), for: .normal)
                    }
                    self.loder.stopAnimating()
                    self.loder.isHidden = true
                    self.loder.isUserInteractionEnabled = false
                    self.loderView.isExclusiveTouch = false
                    self.loderView.isUserInteractionEnabled = false
                }
               
            }
            
            
        })
        task.resume()
        
     
        
        
        
    }
    
    
}

