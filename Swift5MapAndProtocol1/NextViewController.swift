//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by みや on 2020/06/25.
//  Copyright © 2020 みや. All rights reserved.
//

import UIKit


protocol SearchLocationDelegate {
    func searchLocation(idoValue:String,keidoValue:String)
}


class NextViewController: UIViewController {

    
    @IBOutlet weak var idoTextField: UITextField!
    
    @IBOutlet weak var keidoTextField: UITextField!
    
    
    var delegate:SearchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func okAction(_ sender: Any) {
    }

    
    //入力された値を取得
    
    //デリゲートメソッドの引数に入れる
    
    //両方のTFが空でなければ戻る

}
