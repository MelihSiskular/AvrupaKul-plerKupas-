//
//  Match1ViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 8.04.2023.
//

import UIKit

class Match1ViewController: UIViewController {
    
    ///Maçı başlatan buton
    var startMatch = UIButton()
    
    ///Maçın kaçıncı dakikda olduğunu gösterir
    var timeLabel = UILabel()
    
    ///Dakikayı gösteren int değeri
    var minute = 0
    
    ///15 dakikalık timerımız
    var timer15Minute = Timer()

    ///timeIntervalimiz için kontrol
    var currentMinute = Int()
    
    ///Maçın kimle kim arasıdna oynanacağı gözüken Label
    var matchLabel = UILabel()
    
    ///Fonksiyonlardan ulaşmak gerekebiliyor
    let width = CGFloat()
    let height = CGFloat()
    
    ///Tasarım amaçlı bir kaç image
    var leftSide = UIImageView()
    var rightSide = UIImageView()
    var ball = UIImageView()
    var grass = UIImageView()
    
    var matchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        
        startMatch.backgroundColor = .black
        startMatch.frame = CGRect(x: width * 0.5 - (width * 0.3)/2, y: height * 0.9, width: width * 0.3, height: height * 0.08)
        startMatch.setTitle("Maçı Başlat", for: UIControl.State.normal)
        startMatch.layer.cornerRadius = 12
        startMatch.addTarget(self, action: #selector(matchStartFunc), for: UIControl.Event.touchUpInside)
        view.addSubview(startMatch)
        
        timeLabel.font = UIFont(name: "Futura", size: 25)
        timeLabel.text = "\(minute)'"
        timeLabel.frame = CGRect(x: width * 0.5 - (width * 0.5)/2, y: height * 0.2, width: width * 0.5, height: height * 0.07)
        timeLabel.textAlignment = .center
        
        view.addSubview(timeLabel)
        
        matchLabel.text = matchText
        matchLabel.font = UIFont(name: "Futura", size: 18)
        matchLabel.frame = CGRect(x: width * 0.5 - (width * 0.95)/2, y: height * 0.1, width: width * 0.95, height: height * 0.1)
        matchLabel.textAlignment = .center
        view.addSubview(matchLabel)

      
        
        rightSide.image = UIImage(named: "right")
        leftSide.image = UIImage(named: "left")
        ball.image = UIImage(named: "ball")
        grass.image = UIImage(named: "grass")
        
        grass.frame = CGRect(x: width * 0.1, y: height * 0.705, width: width * 0.8, height: height * 0.04)
        rightSide.frame = CGRect(x: width * 0.78, y: height * 0.65, width: width * 0.18, height: height * 0.1)
        leftSide.frame = CGRect(x: width * 0.04, y: height * 0.65, width: width * 0.18, height: height * 0.1)
        ball.frame = CGRect(x: width * 0.5 - (width * 0.08)/2, y: height * 0.69, width: width * 0.08, height: height * 0.05)
        
        
        view.addSubview(rightSide)
        view.addSubview(leftSide)
        view.addSubview(ball)
        view.addSubview(grass)
        
    }
    
    

    @objc
    func matchStartFunc() {
        
        UIView.animate(withDuration: 2.5 ,animations: { [self] in
       
            ball.center.x = width + 100
            
        }) { _  in
            UIView.animate(withDuration: 3) { [self] in
                ball.center.x = width + 275
            }
        }
        
        
        
        currentMinute = minute
        
        timer15Minute = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { [self] timer in
            
            if currentMinute - minute > -15 {
                
                minute += 1
                print(minute)
                timeLabel.text = "\(minute)'"
                
                DispatchQueue.main.async {
                    self.startMatch.isUserInteractionEnabled = false
                    self.startMatch.alpha = 0.5
                }
                
            }else {
                timer15Minute.invalidate()
                startMatch.isUserInteractionEnabled = true
                startMatch.alpha = 1
            }
          
            
        })
    }
    

    
}
