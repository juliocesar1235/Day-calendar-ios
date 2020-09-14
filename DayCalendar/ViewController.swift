//
//  ViewController.swift
//  DayCalendar
//
//  Created by Julio Gutierrez Briones on 9/10/20.
//  Copyright © 2020 Julio César Gutiérrez Briones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monthLb: UILabel!
    @IBOutlet weak var numLb: UILabel!
    @IBOutlet weak var dayLb: UILabel!
    @IBOutlet weak var yearLb: UILabel!
    
    var fecha = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(swipe(_:)))
        
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(swipe(_:)))
        
        leftRecognizer.direction = .left
        rightRecognizer.direction = .right
        self.view.addGestureRecognizer(leftRecognizer)
        self.view.addGestureRecognizer(rightRecognizer)
    
        setText(getDateFormat(fecha))
    }
    
    func getDateFormat(_ date: Date) -> [String]{
        let formato = DateFormatter()
        let dateInString : String
        formato.dateFormat = "MMMM d EEEE y"
        dateInString = formato.string(from: date)
        return dateInString.components(separatedBy: " ")
    }

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if(sender.direction == .left){
            fecha = fecha.addingTimeInterval(86400)
            setText(getDateFormat(fecha))
        }
        else if(sender.direction == .right){
            fecha = fecha.addingTimeInterval(-86400)
            setText(getDateFormat(fecha))
        }
    }
    
    func setText(_ stringArr: [String]){
        monthLb.text = stringArr[0]
        numLb.text = stringArr[1]
        dayLb.text = stringArr[2]
        yearLb.text = stringArr[3]
    }
    
    
    
}

