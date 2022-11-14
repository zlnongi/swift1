//
//  ViewController.swift
//  week7
//
//  Created by 여진홍 on 2022/11/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var alarmWork: UILabel!
    let dateformatter = DateFormatter()
    var alarmdate : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmdate = UserDefaults.standard.string(forKey: "alarm") ?? ""
        if(alarmdate == ""){
            alarmLabel.text = "알람 없음"
        } else{
            alarmLabel.text = "알람:" + alarmdate
        }
        alarmWork.text = ""
        start()
        alarm()
        
    }
    
    @IBAction func setAlarmButton(_ sender: Any) {
        changed()
        alarmLabel.text = "알람: " + alarmdate
        alarmWork.text = ""
        UserDefaults.standard.set(alarmdate, forKey: "alarm")
    }
    
    func start(){
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
    }
    func changed(){
        alarmdate = dateformatter.string(from: datepicker.date)
        print(alarmdate)
    }
    func alarm() {
        DispatchQueue.global().async{
            while(true){
                if(self.alarmdate == self.dateformatter.string(from: Date())){
                    DispatchQueue.main.sync{
                        self.alarmWork.text = "알람이 울렸습니다."
                    }
                }
            }
        }
    }
}

