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
    
    var addressString = ""
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
        
        
        if sender.state == .began{
        //タップを開始したとき
        
        }else if sender.state == .ended{
        //タップが終了したとき
            
            //タップした位置を指定して、MKMapView上の緯度、軽度を取得する
            
            //緯度軽度から住所に変更する
            
        }
        
    }
    

}

