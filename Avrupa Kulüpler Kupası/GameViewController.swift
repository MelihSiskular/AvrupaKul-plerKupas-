//
//  GameViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 5.04.2023.
//

import UIKit



class GameViewController: UIViewController {
    
    //MARK: Tanımlar
    
    @IBOutlet var sliderAttack: UISlider!
    @IBOutlet var sliderDefense: UISlider!
    
    @IBOutlet var segmentControlOutlet: UISegmentedControl!
    
    ///Next button olarak işlev görecek ve fikstür'e geçecek
    let nextButton = UIButton()
    
    
    ///TableViewdan tıklanınca bu veriler ile eşlenip bu verilerden gösterme işlemi yapacaığız.
    var choosenTeamName = ""
    var choosenTeamPower = ""
    var choosenTeamLogo = UIImage()

    ///TableView dan gelen veriler bunlar üzerinde ekranın üstünde gösterilir
    let TeamImage = UIImageView()
    let TeamName = UILabel()
    let TeamPower = UILabel()
    
    ///Segment Control için Taktik ve Bilgilendirmeleri
    let tacticsTittle = UILabel()
    let tacticsImage = UIImageView()
    let tacticsLabel = UILabel()
    
    ///Slider'da Value değişimi sonucu kullanacaklarımız!
    let sliderControlAttackLabel = UILabel()
    let sliderControlDefenseLabel = UILabel()
    
    let selectedTactics = ""
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        tacticsTittle.text = "Taktik Düzenlemeri"
        tacticsTittle.font = UIFont(name: "Futura", size: 19)
        tacticsTittle.textAlignment = .center
        tacticsTittle.frame = CGRect(x: width * 0.5 - (width * 0.6)/2, y: height * 0.245, width: width * 0.6, height: height * 0.1)
        view.addSubview(tacticsTittle)
        
        tacticsImage.image = UIImage(named: "tahta")
        tacticsImage.frame = CGRect(x: width * 0.05, y: height * 0.4, width: width * 0.25, height: height * 0.18)
        view.addSubview(tacticsImage)
        
        tacticsLabel.text = "Lütfen Dizilişi Seç!"
        tacticsLabel.textAlignment = .left
        tacticsLabel.font = UIFont(name: "Kefa", size: 19)
        tacticsLabel.frame = CGRect(x: width * 0.4, y: height * 0.32, width: width * 0.5, height: height * 0.34)
        tacticsLabel.numberOfLines = 6
        view.addSubview(tacticsLabel)
        
        segmentControlOutlet.frame = CGRect(x: width * 0.5 - (width * 0.95)/2, y: height * 0.32, width: width * 0.95, height: height * 0.05)

        navigationController?.navigationBar.topItem?.backButtonTitle = "Geri"
       
        sliderControlAttackLabel.text = "Hücum Ağırlığı"
        sliderControlDefenseLabel.text = "Defans Ağırlığı"
        sliderControlAttackLabel.font = UIFont(name: "Futura", size: 19)
        sliderControlDefenseLabel.font = UIFont(name: "Futura", size: 19)
        sliderControlAttackLabel.frame = CGRect(x: width * 0.07, y: height * 0.628, width: width * 0.5, height: height * 0.06)
        sliderControlDefenseLabel.frame = CGRect(x: width * 0.07, y: height * 0.76, width: width * 0.5, height: height * 0.06)
        view.addSubview(sliderControlAttackLabel)
        view.addSubview(sliderControlDefenseLabel)
        
        
        sliderAttack.frame = CGRect(x: width * 0.5 - (width * 0.9)/2, y: height * 0.65, width: width * 0.9, height: height * 0.1)
        sliderDefense.frame = CGRect(x: width * 0.5 - (width * 0.9)/2, y: height * 0.775, width: width * 0.9, height: height * 0.1)
        
        
        TeamName.text = choosenTeamName
        TeamName.textAlignment = .center
        TeamName.font = UIFont(name: "Impact", size: 25)
        TeamName.frame = CGRect(x: width * 0.7 - (width * 0.9)/2, y: height * 0.1, width: width * 0.7, height: height * 0.1)
        view.addSubview(TeamName)
        
        TeamImage.image = UIImage(named: choosenTeamName)! //Zaten isimden çekecek!
        //Logo almaya çok gerek yoktu
        TeamImage.frame = CGRect(x: width * 0.05 , y: height * 0.125, width: width * 0.2, height: width * 0.2)
        view.addSubview(TeamImage)
        
        TeamPower.text = choosenTeamPower
        TeamPower.textAlignment = .center
        TeamPower.frame = CGRect(x: width * 0.28, y: height * 0.15, width: width * 0.7, height: height * 0.1)
        TeamPower.font = UIFont(name: "Kefa", size: 14)
        view.addSubview(TeamPower)
        
        nextButton.setTitle("Fikstür", for: UIControl.State.normal)
        nextButton.setTitleColor(UIColor.tintColor, for: UIControl.State.normal)
        nextButton.setTitleColor(UIColor.blue, for: UIControl.State.highlighted)
        nextButton.setTitle("--->", for: UIControl.State.highlighted)
        nextButton.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.88, width: width * 0.8, height: height * 0.1)
        view.addSubview(nextButton)
    }
    
    
    //MARK: FUNCTİONS
    
    
    //SegmentedControl
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
    
        switch sender.selectedSegmentIndex {
        case 0:
            print("0")
            tacticsImage.image = UIImage(named: "3-4-3")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "3-4-3 Taktiği Hakkında bilgi olcak"
            
        case 1:
            print("1")
            tacticsImage.image = UIImage(named: "3-5-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "3-5-2 Taktiği Hakkında bilgi olcak"
        
        case 2:
            print("2")
            tacticsImage.image = UIImage(named: "4-4-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-4-2 Taktiği Hakkında bilgi olcak"
            
        case 3:
            print("3")
            tacticsImage.image = UIImage(named: "4-3-3")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-3-3 Taktiği Hakkında bilgi olcak"
        
        case 4:
            print("4")
            tacticsImage.image = UIImage(named: "4-2-3-1")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-2-3-1 Taktiği Hakkında bilgi olcak"
            
        case 5:
            print("5")
            tacticsImage.image = UIImage(named: "5-3-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "5-3-2 Taktiği Hakkında bilgi olcak"
            
        default:
            print("Açıldı")
            
        }
        
    }
    
    
    
    
 

}
