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

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate,SearchLocationDelegate {
    
    
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
           
            //タップした位置(CGPoint)を指定してMKMapMKMapView上の緯度経度を取得する
            
          
            let tapPoint = sender.location(in: view)
            
            
            let center = mapVIew.convert(tapPoint, toCoordinateFrom: mapVIew)
            let lat = center.latitude
            let log = center.longitude
            
            convert(lat: lat, log: log)
            
        }
        
    }
    
    func convert(lat:CLLocationDegrees,log:CLLocationDegrees){
        
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: log)
        
        
        
        //オプショナルバインディング if 変数　!= nil{}  if let 変数　変数1{ print(変数)}*/
        
         
        //クロージャー
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            
            if let placeMark = placeMark{
                
                if let pm = placeMark.first{
                    
                    if pm.administrativeArea != nil || pm.locality != nil {
                        
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                    }else{
                        
                        self.addressString = pm.name!
                        
                    }
               
                    
                    self.addressLabel.text = self.addressString
                }
                 print(placeMark)
            }
        }
    }
   
    
    @IBAction func goToSearchVC(_ sender: Any) {
        
        
        //画面遷移
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            
            let nextVC = segue.destination as! NextViewController
            nextVC.delegate = self
            //
            
        }
        
        
    }
    //任されたデリゲートメソッド
    func searchLocation(idoValue: String, keidoValue: String) {
        
        if idoValue.isEmpty != true && keidoValue.isEmpty != true{
            
            
            let idoString = idoValue
            let keidoString = keidoValue
            
            //緯度経度からコーディネート
            let coordinate = CLLocationCoordinate2DMake(Double(idoString)!,  Double(keidoString)!)
            
            
            //表示する範囲を指定します
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            
            //領域を指定
            
            let region = MKCoordinateRegion(center:coordinate, span: span )
            
            //領域をmapviewに設定
            
            mapVIew.setRegion(region, animated: true)
            
            //緯度経度から住所に変換
            
            convert(lat:Double(idoString)! , log: Double(keidoString)!)
            
            //ラベルに表示
                 addressLabel.text = addressString
            
        }else{
            
            addressLabel.text = "表示できません"
            
        }
        
        
       }
    
    
}

