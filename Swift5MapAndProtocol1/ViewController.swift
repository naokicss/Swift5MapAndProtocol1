//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by みや on 2020/06/25.
//  Copyright © 2020 みや. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate {
    
    
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var mapVIew: MKMapView!
    var locManager:CLLocationManager!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
        
    }

    
    @IBAction func LongPressTap(_ sender: UILongPressGestureRecognizer) {
        
        //タップを開始したとき
        
        
        //タップが終了したとき
        
        
    }
    

}

