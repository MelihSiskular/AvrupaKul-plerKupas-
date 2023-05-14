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
    
    ///Takım Renkler için ana renk ve ikinci Renk
    var teamColorFirst = ""
    var teamColorSecond = ""
    
    ///Her takımın kendi class'ı var
    ///Eğer kendine uygun olan diziliş ve hğcum-defans ağırlığını seçtiyse gücünde artış meydana gelcek
    ///Eğer ki kendine en uygun olmayan diziliişi ve hücum-defans ağırlığını seçerse düşüş olacak
    ///Şuan 0 başlatıyorum bunlar slider ve segment üzerindeki değişikliklere göre değişecek!
    ///En son segue işlemi olurken çağrılcak ve sınıf üzerinde değişecek, Kontrollerde ozaman belli olcak!
    var tacticsBonusAttack = 0
    var tacticsBonusPlan = 0
    
    ///SliderPointler
    ///Her Takımın kendine göre özel sliderı ve kötü sliderı var ancak;
    ///Her ihtimalde oyunumuza göre özel puanlar kazanmamız gerek!
    ///Attack değeri üzerinden gideceğim
    ///BU DEĞERLER TAKIMIN ATACK-MİD-DEFANS değerlerine eklencek!
    var sliderPointsAttack = 0
    var sliderPoinstDefense = 0
    
    ///SegmentPointler
    ///Her takımın kendine özel Taktik planı iyi ve kötü etkileyecek şekilde var
    ///Ancak bizim dizilişimizin de belli avantajları olmalı, az da olsa
    ///BU DEĞERLER TAKIMIN ATACK-MİD-DEFANS değerlerine eklencek!
    ///MAX (3) MİN (-3) Değerleri alır
    var segmentPointAttack = 0
    var segmentPointDefense = 0
    var segmentPointMid = 0
    
    ///TableViewdan tıklanınca bu veriler ile eşlenip bu verilerden gösterme işlemi yapacaığız.
    var choosenTeamName = ""
    var choosenTeamPower = ""
    var choosenTeamLogo = UIImage()
    var choosenTeamColor = [UIColor]()
    
    ///TableView dan gelen veriler bunlar üzerinde ekranın üstünde gösterilir
    let TeamImage = UIImageView()
    let TeamName = UILabel()
    let TeamPower = UILabel()
    
    ///Segment Control için Taktik ve Bilgilendirmeleri
    let tacticsTittle = UILabel()
    let tacticsImage = UIImageView()
    let tacticsLabel = UILabel()
    
    ///Slider'da Value Görünüm
    let sliderControlAttackLabel = UILabel()
    let sliderControlDefenseLabel = UILabel()
    
    ///Toplam hücüm-mid-defans güçlerimiz için, bu 3 değer üzerinden algoritma kurulacak
    var totalAttackPower = 0
    var totalMidPower = 0.0
    var totalDefensePower = 0
    
    ///Ve en son olarak total 3 alandaki değerlerimiz 2'Ye sadeleşecek hücüm ve defans diye
    var finalAttack = 0.0
    var finalDefense = 0.0
    
    ///Takımımın final değerlerini rahat aktarmak için shared
    var sharedMyTeam = ControlsMyTeam.sharedControlsMyTeam
    
    
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        let width = view.frame.size.width
        let height = view.frame.size.height
        
        tacticsTittle.text = "Taktik Düzenlemeleri"
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
        
        
        segmentControlOutlet.backgroundColor = choosenTeamColor[0]
        segmentControlOutlet.frame = CGRect(x: width * 0.5 - (width * 0.95)/2, y: height * 0.32, width: width * 0.95, height: height * 0.05)

        navigationController?.navigationBar.topItem?.backButtonTitle = "Takım Seçimine Dön"
       
        sliderControlAttackLabel.text = "Hücum Ağırlığı %50"
        sliderControlDefenseLabel.text = "Defans Ağırlığı %50"
        sliderControlAttackLabel.font = UIFont(name: "Futura", size: 19)
        sliderControlDefenseLabel.font = UIFont(name: "Futura", size: 19)
        sliderControlAttackLabel.frame = CGRect(x: width * 0.07, y: height * 0.628, width: width * 0.5, height: height * 0.06)
        sliderControlDefenseLabel.frame = CGRect(x: width * 0.07, y: height * 0.76, width: width * 0.5, height: height * 0.06)
        sliderAttack.tintColor = choosenTeamColor[0]
        sliderDefense.tintColor = choosenTeamColor[1]
        view.addSubview(sliderControlAttackLabel)
        view.addSubview(sliderControlDefenseLabel)
        
        
        sliderAttack.frame = CGRect(x: width * 0.5 - (width * 0.9)/2, y: height * 0.65, width: width * 0.9, height: height * 0.1)
        sliderDefense.frame = CGRect(x: width * 0.5 - (width * 0.9)/2, y: height * 0.775, width: width * 0.9, height: height * 0.1)
        sliderAttack.value = 10
        sliderDefense.value = 10
        
        
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
        
        nextButton.setTitle("Grup Aşaması", for: UIControl.State.normal)
        nextButton.setTitleColor(choosenTeamColor[1], for: UIControl.State.normal)
        nextButton.setTitleColor(choosenTeamColor[1], for: UIControl.State.highlighted)
        nextButton.setTitle("--->", for: UIControl.State.highlighted)
        nextButton.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.9, width: width * 0.8, height: height * 0.055)
        nextButton.backgroundColor = choosenTeamColor[0]
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: UIControl.Event.touchUpInside)
        nextButton.layer.cornerRadius = 12
        nextButton.isUserInteractionEnabled = false
        view.addSubview(nextButton)
        
    }
    
    
    //MARK: FUNCTİONS
    
    //SegmentedControl
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
    
        switch sender.selectedSegmentIndex {
        case 0:
            
            tacticsImage.image = UIImage(named: "3-4-3")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "3-4-3 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = 3
            segmentPointMid = 0
            segmentPointDefense = -3
            nextButton.isUserInteractionEnabled = true
            
        case 1:
            
            tacticsImage.image = UIImage(named: "3-5-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "3-5-2 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = 1
            segmentPointMid = 1
            segmentPointDefense = -2
            nextButton.isUserInteractionEnabled = true
        
        case 2:
         
            tacticsImage.image = UIImage(named: "4-4-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-4-2 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = 0
            segmentPointMid = 0
            segmentPointDefense = 0
            nextButton.isUserInteractionEnabled = true
            
        case 3:
            
            tacticsImage.image = UIImage(named: "4-3-3")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-3-3 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = 1
            segmentPointMid = 1
            segmentPointDefense = -2
            nextButton.isUserInteractionEnabled = true
            
        case 4:
        
            tacticsImage.image = UIImage(named: "4-2-3-1")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "4-2-3-1 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = 1
            segmentPointMid = -2
            segmentPointDefense = 1
            nextButton.isUserInteractionEnabled = true
            
        case 5:
           
            tacticsImage.image = UIImage(named: "5-3-2")
            tacticsLabel.font = UIFont(name: "Kefa", size: 14)
            tacticsLabel.text = "5-3-2 Taktiği Hakkında bilgi olcak"
            segmentPointAttack = -3
            segmentPointMid = 0
            segmentPointDefense = 3
            nextButton.isUserInteractionEnabled = true
            
        default:
            print("Açıldı")
            
        }
    }
    
    
    //Slider İşlemleri
    @IBAction func sliderAttackFunc(_ sender: UISlider) {
        ///Class için değer gönderirken attacktan veya defanstan seçerse diye 2 türlü de düşün
        ///Eğer ataktan kaydırırsa direk o değer
        ///Ama defanstan seçerse 20 - x olarak eşitle
    
        
        
        var sliderValue = Int(sliderAttack.value)
        var sliderDefenseValue = 20 - sliderValue
        sliderDefense.value = Float(sliderDefenseValue)
        
        sliderControlDefenseLabel.text! = "Defans Ağırlığı %\(sliderDefenseValue * 5)"
        sliderControlAttackLabel.text! = "Hücum Ağırlığı %\(sliderValue * 5)"
        
        if sliderValue > 10 {
            //Hücum Ağırlıklı
            sliderPointsAttack = (sliderValue - 10) //Hücumumuz + alcak
            sliderPoinstDefense = (sliderDefenseValue - 10) //Defansımız - Alcak
            
        }else if sliderValue == 10 {
            //Dengede oyun tercih edildi!
        }else {
            //Defans Ağırlıklı
            sliderPointsAttack = (sliderValue - 10) //Hücumumuz - Alcak
            sliderPoinstDefense = (sliderDefenseValue - 10) // Defansımız + Alcak
            
        }
    }
    
    
    @IBAction func sliderDefenseFunc(_ sender: UISlider) {
        
        var sliderValue = Int(sliderDefense.value)
        var sliderAttackValue = 20 - sliderValue
        sliderAttack.value = Float(sliderAttackValue)
        
        sliderControlDefenseLabel.text! = "Defans Ağırlığı %\(sliderValue * 5)"
        sliderControlAttackLabel.text! = "Hücum Ağırlığı %\(sliderAttackValue * 5)"
        
        if sliderValue > 10 {
            //Defans Ağırlıklı
            sliderPointsAttack = (sliderAttackValue - 10) //Hücumumuz - alcak
            sliderPoinstDefense = (sliderValue - 10) //Defansımız + Alcak
            
        }else if sliderValue == 10 {
            //Dengede oyun tercih edildi!
        }else {
            //Hücum Ağırlıklı
            sliderPointsAttack = (sliderAttackValue - 10) //Hücumumuz + Alcak
            sliderPoinstDefense = (sliderValue - 10) // Defansımız - Alcak
            
        }
        
        
       
        
    }
    
    //MARK: Segue ve Hazırlık
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMatchFixture" {
            
            
            totalAttackPower = 0
            totalMidPower = 0.0
            totalDefensePower = 0
            
            
            totalMidPower += Double(segmentPointMid)
            totalAttackPower += segmentPointAttack
            totalDefensePower += segmentPointDefense
            totalAttackPower += sliderPointsAttack
            totalDefensePower += sliderPoinstDefense
            teamClassMatched() //FUNC
          
            finalAttack = (Double(totalAttackPower)) + (totalMidPower/10)
            finalDefense = (Double(totalDefensePower)) + (totalMidPower/10)
            ///Her takımın kendi classında total bir değer oluşacak
            ///Ancak bizim seçtiğim takım oluşan total değer yerine kendi sürekli değişebilir final değerlerimiz kullancaz
            sharedMyTeam.finalAttack = finalAttack
            sharedMyTeam.finalDefense = finalDefense
            
            let destination = segue.destination as! FixtureViewController
            
            if destination.myTeam == "" {
                destination.myTeam = choosenTeamName
                destination.myTeamColors = choosenTeamColor
                
            }
        }
    }
    
//    func matchedTeamClass() {
//
//        if let myTeam = dict[choosenTeamName] {
//            totalAttackPower += myTeam.powerAttack
//            totalDefensePower += myTeam.powerDefense
//            totalAttackPower += myTeam.bonusAttack
//            totalDefensePower += myTeam.bonusDefense
//
//            //Burda Robot mu yoksa biz mi diye herkes için bir attackdefence randomu için bişi olması lazım !!!!!!!! (Oyunun güzelliği için random olsun dedik biz dışındaki herkes random olmalı bizimlki ona göre düzenlenmeli!)
//
//
//            ///MESELA BU VİEWDİDLOADDA ÇAĞRILABİLİR ÖNCE RANDOM TACTİC VE PLAN İÇİN Bİ DEĞER GELİR SONRA BİZ ELLE DEĞİŞTİRİRİZ ONU ATARIZ EN SON Kİ DURUMA GÖRE PUANIMI ALIRIZ BİZ DEĞİŞTİRMEZSEK TE RANDOM ATANAN DEĞER HERKES İÇİN KALIR!
//
//        }
//    }
    
    func teamClassMatched() {
        
        if choosenTeamName == "Arsenal" {
            let arsenal = Arsenal.shared
            totalAttackPower += arsenal.powerAttack
            totalDefensePower += arsenal.powerDefense
            totalMidPower += arsenal.powerMid
            totalAttackPower += arsenal.bonusAttack
            totalDefensePower += arsenal.bonusDefense
        }else if choosenTeamName == "Manchester City" {
            let manchesterCity = ManchesterCity.shared
            totalAttackPower += manchesterCity.powerAttack
            totalDefensePower += manchesterCity.powerDefense
            totalMidPower += manchesterCity.powerMid
            totalAttackPower += manchesterCity.bonusAttack
            totalDefensePower += manchesterCity.bonusDefense
        }else if choosenTeamName == "Manchester United" {
            let manchesterUnited = ManchesterUnited.shared
            totalAttackPower += manchesterUnited.powerAttack
            totalDefensePower += manchesterUnited.powerDefense
            totalMidPower += manchesterUnited.powerMid
            totalAttackPower += manchesterUnited.bonusAttack
            totalDefensePower += manchesterUnited.bonusDefense
        }else if choosenTeamName == "Tottenham" {
            let tottenham = Tottenham.shared
            totalAttackPower += tottenham.powerAttack
            totalDefensePower += tottenham.powerDefense
            totalMidPower += tottenham.powerMid
            totalAttackPower += tottenham.bonusAttack
            totalDefensePower += tottenham.bonusDefense
        }else if choosenTeamName == "Chelsea" {
            let chelsea = Chelsea.shared
            totalAttackPower += chelsea.powerAttack
            totalDefensePower += chelsea.powerDefense
            totalMidPower += chelsea.powerMid
            totalAttackPower += chelsea.bonusAttack
            totalDefensePower += chelsea.bonusDefense
        }else if choosenTeamName == "Liverpool" {
            let liverpool = Liverpool.shared
            totalAttackPower += liverpool.powerAttack
            totalDefensePower += liverpool.powerDefense
            totalMidPower += liverpool.powerMid
            totalAttackPower += liverpool.bonusAttack
            totalDefensePower += liverpool.bonusDefense
        }else if choosenTeamName == "Barcelona" {
            let barcelona = Barcelona.shared
            totalAttackPower += barcelona.powerAttack
            totalDefensePower += barcelona.powerDefense
            totalMidPower += barcelona.powerMid
            totalAttackPower += barcelona.bonusAttack
            totalDefensePower += barcelona.bonusDefense
        }else if choosenTeamName == "Real Madrid" {
            let realMadrid = RealMadrid.shared
            totalAttackPower += realMadrid.powerAttack
            totalDefensePower += realMadrid.powerDefense
            totalMidPower += realMadrid.powerMid
            totalAttackPower += realMadrid.bonusAttack
            totalDefensePower += realMadrid.bonusDefense
        }else if choosenTeamName == "Atletico Madrid" {
            let atleticoMadrid = AtleticoMadrid.shared
            totalAttackPower += atleticoMadrid.powerAttack
            totalDefensePower += atleticoMadrid.powerDefense
            totalMidPower += atleticoMadrid.powerMid
            totalAttackPower += atleticoMadrid.bonusAttack
            totalDefensePower += atleticoMadrid.bonusDefense
        }else if choosenTeamName == "Inter" {
            let inter = Inter.shared
            totalAttackPower += inter.powerAttack
            totalDefensePower += inter.powerDefense
            totalMidPower += inter.powerMid
            totalAttackPower += inter.bonusAttack
            totalDefensePower += inter.bonusDefense
        }else if choosenTeamName == "Napoli" {
            let napoli = Napoli.shared
            totalAttackPower += napoli.powerAttack
            totalDefensePower += napoli.powerDefense
            totalMidPower += napoli.powerMid
            totalAttackPower += napoli.bonusAttack
            totalDefensePower += napoli.bonusDefense
        }else if choosenTeamName == "Milan" {
            let milan = Milan.shared
            totalAttackPower += milan.powerAttack
            totalDefensePower += milan.powerDefense
            totalMidPower += milan.powerMid
            totalAttackPower += milan.bonusAttack
            totalDefensePower += milan.bonusDefense
        }else if choosenTeamName == "Juventus" {
            let juventus = Juventus.shared
            totalAttackPower += juventus.powerAttack
            totalDefensePower += juventus.powerDefense
            totalMidPower += juventus.powerMid
            totalAttackPower += juventus.bonusAttack
            totalDefensePower += juventus.bonusDefense
        }else if choosenTeamName == "PSG" {
            let psg = PSG.shared
            totalAttackPower += psg.powerAttack
            totalDefensePower += psg.powerDefense
            totalMidPower += psg.powerMid
            totalAttackPower += psg.bonusAttack
            totalDefensePower += psg.bonusDefense
        }else if choosenTeamName == "Borussia Dortmund" {
            let borussiaDortmund = BorussiaDortmund.shared
            totalAttackPower += borussiaDortmund.powerAttack
            totalDefensePower += borussiaDortmund.powerDefense
            totalMidPower += borussiaDortmund.powerMid
            totalAttackPower += borussiaDortmund.bonusAttack
            totalDefensePower += borussiaDortmund.bonusDefense
        }else if choosenTeamName == "Bayern München" {
            let bayernMünchen = Arsenal.shared
            totalAttackPower += bayernMünchen.powerAttack
            totalDefensePower += bayernMünchen.powerDefense
            totalMidPower += bayernMünchen.powerMid
            totalAttackPower += bayernMünchen.bonusAttack
            totalDefensePower += bayernMünchen.bonusDefense
        }
        
    }
    
        
    func makeAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(button)
        self.present(alert, animated: true)
    }
    
    
    @objc
    func nextButtonClicked() {
        
        performSegue(withIdentifier: "toMatchFixture", sender: nil)
       
        
        
    }
    
    
    
 

}
