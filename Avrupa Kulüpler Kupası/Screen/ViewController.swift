//
//  ViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 4.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: Tanımlar
    
 
  
    let imageLogo = UIImageView()
    
    let mainLabel = UILabel()
    
    let startButton = UIButton()
    

    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        imageLogo.image = UIImage(named: "logo")
        imageLogo.frame = CGRect(x: 0, y: height * 0.5 - (height * 0.4)/2, width: width , height: height * 0.4)
        view.addSubview(imageLogo)
        
        mainLabel.text = "Avrupa Kulüpler Kupası"
        mainLabel.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.1, width: width * 0.8, height: height * 0.1)
        mainLabel.font = UIFont(name: "Impact", size: 30)
        mainLabel.textAlignment = .center
        view.addSubview(mainLabel)
        
        startButton.setTitle("Takım Seçimi", for: UIControl.State.normal)
        startButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        startButton.backgroundColor = .systemGray5
        startButton.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.75, width: width * 0.7, height: height * 0.07)
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(tapStartButton), for: UIControl.Event.touchUpInside)
        startButton.layer.cornerRadius = 12
        
       
        
    }
    
    @objc
    func tapStartButton() {
        performSegue(withIdentifier: "toSegueTeamSelect", sender: nil)
        
    }


}

