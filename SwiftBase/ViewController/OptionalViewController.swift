//
//  OptionalViewController.swift
//  SwiftPlayground
//
//  Created by Destiny on 2020/7/24.
//  Copyright © 2020 Destiny. All rights reserved.
//

import UIKit

class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "可选链";
        self.view.backgroundColor = UIColor.white;
        
        let john = Person()
//        let roomCount = john.residence!.numberOfRooms
//        print("roomCount:\(roomCount)")
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        
        john.residence = Residence()
        john.residence?.numberOfRooms = 5;
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
