//
//  Match1ViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 8.04.2023.
//

import UIKit

class Match1ViewController: UIViewController {
    
    //MARK: Tanımlar
    
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
    //Ve dizisi
    var matchArray = [String]()
    
    ///Takım Skorboardları için
    var scoreBoardImage = UIImageView()
    var leftTeamScore = 0
    var rightTeamScore = 0
    var rightTeamScoreLabel = UILabel()
    var leftTeamScoreLabel = UILabel()
    
    ///Fonksiyonlardan ulaşmak gerekebiliyor
    let width = CGFloat()
    let height = CGFloat()
    
    ///Tasarım amaçlı bir kaç image
    var leftSide = UIImageView()
    var rightSide = UIImageView()
    var ball = UIImageView()
    var grass = UIImageView()
    
    ///Benim takımımın Final Attack ve Defense değerleri için
    var finalAttack = 0.0
    var finalDefense = 0.0
    
    ///Rakibim güçlerine ulaşmak için
    var RivaltotalAttackPower = 0
    var RivaltotalMidPower = 0.0
    var RivaltotalDefensePower = 0
    //Rakibimin Random taktik ve plandan gelcek değerleri için
    var RivalSliderAttack = 0
    var RivalSliderDefense = 0
    var RivalSegmentAttack = 0
    var RivalSegmentMid = 0
    var RivalSegmentDefense = 0
    //Ve final değerleri
    var RivalFinalAttack = 0.0
    var RivalFinalDefense = 0.0
    
    ///Gol tayinleri için burdan çekecekz final değekeri
    var scoreArray = [String]()
    
    var matchText = ""
    
    ///Diğer classlarda değişim yapabilmek için sharedlar
    var controls = Controls.sharedControls
    var controlsMyTeam = ControlsMyTeam.sharedControlsMyTeam
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        finalAttack = controlsMyTeam.finalAttack
        finalDefense = controlsMyTeam.finalDefense
        print("Shareddan gelen atack \(controlsMyTeam.finalAttack)")
        print("Shateddan gelen defans \(controlsMyTeam.finalDefense)")
        
        startMatch.backgroundColor = .black
        startMatch.frame = CGRect(x: width * 0.5 - (width * 0.3)/2, y: height * 0.9, width: width * 0.3, height: height * 0.08)
        startMatch.setTitle("Maçı Başlat", for: UIControl.State.normal)
        startMatch.layer.cornerRadius = 12
        startMatch.addTarget(self, action: #selector(matchStartFunc), for: UIControl.Event.touchUpInside)
        view.addSubview(startMatch)
        
        timeLabel.font = UIFont(name: "Futura", size: 25)
        timeLabel.text = "\(minute)'"
        timeLabel.frame = CGRect(x: width * 0.5 - (width * 0.5)/2, y: height * 0.14, width: width * 0.5, height: height * 0.07)
        timeLabel.textAlignment = .center
        
        view.addSubview(timeLabel)
        
        matchLabel.text = matchText
        matchLabel.font = UIFont(name: "Futura", size: 18)
        matchLabel.frame = CGRect(x: width * 0.5 - (width * 0.95)/2, y: height * 0.07, width: width * 0.95, height: height * 0.1)
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
        view.addSubview(grass)
        view.addSubview(ball)
        
        
        scoreBoardImage.image = UIImage(named: "scoreboard")
        scoreBoardImage.frame = CGRect(x: width * 0.5 - (width * 0.55)/2, y: height * 0.25, width: width * 0.55, height: height * 0.2)
        
        leftTeamScoreLabel.textAlignment = .center
        rightTeamScoreLabel.textAlignment = .center
        rightTeamScoreLabel.textColor = .black
        leftTeamScoreLabel.textColor = .black
        
        leftTeamScoreLabel.frame = CGRect(x: width * 0.3, y: height * 0.32, width: width * 0.155, height: height * 0.05)
        
        rightTeamScoreLabel.frame = CGRect(x: width * 0.55, y: height * 0.32, width: width * 0.155, height: height * 0.05)
        rightTeamScoreLabel.text = rightTeamScore.description
        leftTeamScoreLabel.text = leftTeamScore.description
        
      
        
        view.addSubview(scoreBoardImage)
        view.addSubview(rightTeamScoreLabel)
        view.addSubview(leftTeamScoreLabel)
        
        ///Bu sayfa için navigationBackButton kapatıyorum oyuncu maç bitince çıkbalsin diye!
        self.navigationItem.hidesBackButton = true
        
      
        RivalClassMatched()
        accesToMyRivalsPower()
        print("Rival Attack \(RivalFinalAttack)")
        print("Rival Defense \(RivalFinalDefense)")
    }
    
    //MARK: Functions

    @objc
    func matchStartFunc() {
        startMatch.setTitle("Maça Devam", for: UIControl.State.normal)
        
        
        if minute >= 90 {
           
            startMatch.setTitle("Maçı Bitir", for: UIControl.State.normal)
            
            controls.match2Enable = true
            controls.match1Enable = false
            
            if minute > 90 {
                navigationController?.popViewController(animated: true)
            }
            minute += 1
          
        }else {
            for _ in 1...5 {
                matchFuncInEvery3Minutes()
            }
            
            
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
    
    
    
    ///Bu fonksiyon ile rakbimizin sınıfındaki özellikleri kullanmış olacağız!
    ///Rakibin Final Attack ve Defense değerleri için ayrı bir fonksiyon olacak
    func RivalClassMatched() {
        
        if matchArray[1] == "Arsenal" {
            let arsenal = Arsenal.shared
            RivaltotalAttackPower += arsenal.powerAttack
            RivaltotalDefensePower += arsenal.powerDefense
            RivaltotalMidPower += arsenal.powerMid
            RivaltotalAttackPower += arsenal.bonusAttack
            RivaltotalDefensePower += arsenal.bonusDefense
            RivalsTacticConditionals(tacticAttacks: arsenal.tacticsBonusAttack, tacticPlan: arsenal.tacticsBonusPlan)
            
        }else if matchArray[1] == "Manchester City" {
            let manchesterCity = ManchesterCity.shared
            RivaltotalAttackPower += manchesterCity.powerAttack
            RivaltotalDefensePower += manchesterCity.powerDefense
            RivaltotalMidPower += manchesterCity.powerMid
            RivaltotalAttackPower += manchesterCity.bonusAttack
            RivaltotalDefensePower += manchesterCity.bonusDefense
            RivalsTacticConditionals(tacticAttacks: manchesterCity.tacticsBonusAttack, tacticPlan: manchesterCity.tacticsBonusPlan)
            
        }else if matchArray[1] == "Manchester United" {
            let manchesterUnited = ManchesterUnited.shared
            RivaltotalAttackPower += manchesterUnited.powerAttack
            RivaltotalDefensePower += manchesterUnited.powerDefense
            RivaltotalMidPower += manchesterUnited.powerMid
            RivaltotalAttackPower += manchesterUnited.bonusAttack
            RivaltotalDefensePower += manchesterUnited.bonusDefense
            RivalsTacticConditionals(tacticAttacks: manchesterUnited.tacticsBonusAttack, tacticPlan: manchesterUnited.tacticsBonusPlan)
            
        }else if matchArray[1] == "Tottenham" {
            let tottenham = Tottenham.shared
            RivaltotalAttackPower += tottenham.powerAttack
            RivaltotalDefensePower += tottenham.powerDefense
            RivaltotalMidPower += tottenham.powerMid
            RivaltotalAttackPower += tottenham.bonusAttack
            RivaltotalDefensePower += tottenham.bonusDefense
            RivalsTacticConditionals(tacticAttacks: tottenham.tacticsBonusAttack, tacticPlan: tottenham.tacticsBonusPlan)
            
        }else if matchArray[1] == "Chelsea" {
            let chelsea = Chelsea.shared
            RivaltotalAttackPower += chelsea.powerAttack
            RivaltotalDefensePower += chelsea.powerDefense
            RivaltotalMidPower += chelsea.powerMid
            RivaltotalAttackPower += chelsea.bonusAttack
            RivaltotalDefensePower += chelsea.bonusDefense
            RivalsTacticConditionals(tacticAttacks: chelsea.tacticsBonusAttack, tacticPlan: chelsea.tacticsBonusPlan)
            
        }else if matchArray[1] == "Liverpool" {
            let liverpool = Liverpool.shared
            RivaltotalAttackPower += liverpool.powerAttack
            RivaltotalDefensePower += liverpool.powerDefense
            RivaltotalMidPower += liverpool.powerMid
            RivaltotalAttackPower += liverpool.bonusAttack
            RivaltotalDefensePower += liverpool.bonusDefense
            RivalsTacticConditionals(tacticAttacks: liverpool.tacticsBonusAttack, tacticPlan: liverpool.tacticsBonusPlan)
            
        }else if matchArray[1] == "Barcelona" {
            let barcelona = Barcelona.shared
            RivaltotalAttackPower += barcelona.powerAttack
            RivaltotalDefensePower += barcelona.powerDefense
            RivaltotalMidPower += barcelona.powerMid
            RivaltotalAttackPower += barcelona.bonusAttack
            RivaltotalDefensePower += barcelona.bonusDefense
            RivalsTacticConditionals(tacticAttacks: barcelona.tacticsBonusAttack, tacticPlan: barcelona.tacticsBonusPlan)
            
        }else if matchArray[1] == "Real Madrid" {
            let realMadrid = RealMadrid.shared
            RivaltotalAttackPower += realMadrid.powerAttack
            RivaltotalDefensePower += realMadrid.powerDefense
            RivaltotalMidPower += realMadrid.powerMid
            RivaltotalAttackPower += realMadrid.bonusAttack
            RivaltotalDefensePower += realMadrid.bonusDefense
            RivalsTacticConditionals(tacticAttacks: realMadrid.tacticsBonusAttack, tacticPlan: realMadrid.tacticsBonusPlan)
            
        }else if matchArray[1] == "Atletico Madrid" {
            let atleticoMadrid = AtleticoMadrid.shared
            RivaltotalAttackPower += atleticoMadrid.powerAttack
            RivaltotalDefensePower += atleticoMadrid.powerDefense
            RivaltotalMidPower += atleticoMadrid.powerMid
            RivaltotalAttackPower += atleticoMadrid.bonusAttack
            RivaltotalDefensePower += atleticoMadrid.bonusDefense
            RivalsTacticConditionals(tacticAttacks: atleticoMadrid.tacticsBonusAttack, tacticPlan: atleticoMadrid.tacticsBonusPlan)
            
        }else if matchArray[1] == "Inter" {
            let inter = Inter.shared
            RivaltotalAttackPower += inter.powerAttack
            RivaltotalDefensePower += inter.powerDefense
            RivaltotalMidPower += inter.powerMid
            RivaltotalAttackPower += inter.bonusAttack
            RivaltotalDefensePower += inter.bonusDefense
            RivalsTacticConditionals(tacticAttacks: inter.tacticsBonusAttack, tacticPlan: inter.tacticsBonusPlan)
            
        }else if matchArray[1] == "Napoli" {
            let napoli = Napoli.shared
            RivaltotalAttackPower += napoli.powerAttack
            RivaltotalDefensePower += napoli.powerDefense
            RivaltotalMidPower += napoli.powerMid
            RivaltotalAttackPower += napoli.bonusAttack
            RivaltotalDefensePower += napoli.bonusDefense
            RivalsTacticConditionals(tacticAttacks: napoli.tacticsBonusAttack, tacticPlan: napoli.tacticsBonusPlan)
            
        }else if matchArray[1] == "Milan" {
            let milan = Milan.shared
            RivaltotalAttackPower += milan.powerAttack
            RivaltotalDefensePower += milan.powerDefense
            RivaltotalMidPower += milan.powerMid
            RivaltotalAttackPower += milan.bonusAttack
            RivaltotalDefensePower += milan.bonusDefense
            RivalsTacticConditionals(tacticAttacks: milan.tacticsBonusAttack, tacticPlan: milan.tacticsBonusPlan)
            
        }else if matchArray[1] == "Juventus" {
            let juventus = Juventus.shared
            RivaltotalAttackPower += juventus.powerAttack
            RivaltotalDefensePower += juventus.powerDefense
            RivaltotalMidPower += juventus.powerMid
            RivaltotalAttackPower += juventus.bonusAttack
            RivaltotalDefensePower += juventus.bonusDefense
            RivalsTacticConditionals(tacticAttacks: juventus.tacticsBonusAttack, tacticPlan: juventus.tacticsBonusPlan)
            
        }else if matchArray[1] == "PSG" {
            let psg = PSG.shared
            RivaltotalAttackPower += psg.powerAttack
            RivaltotalDefensePower += psg.powerDefense
            RivaltotalMidPower += psg.powerMid
            RivaltotalAttackPower += psg.bonusAttack
            RivaltotalDefensePower += psg.bonusDefense
            RivalsTacticConditionals(tacticAttacks: psg.tacticsBonusAttack, tacticPlan: psg.tacticsBonusPlan)
            
        }else if matchArray[1] == "Borussia Dortmund" {
            let borussiaDortmund = BorussiaDortmund.shared
            RivaltotalAttackPower += borussiaDortmund.powerAttack
            RivaltotalDefensePower += borussiaDortmund.powerDefense
            RivaltotalMidPower += borussiaDortmund.powerMid
            RivaltotalAttackPower += borussiaDortmund.bonusAttack
            RivaltotalDefensePower += borussiaDortmund.bonusDefense
            RivalsTacticConditionals(tacticAttacks: borussiaDortmund.tacticsBonusAttack, tacticPlan: borussiaDortmund.tacticsBonusPlan)
            
        }else if matchArray[1] == "Bayern München" {
            let bayernMünchen = Arsenal.shared
            RivaltotalAttackPower += bayernMünchen.powerAttack
            RivaltotalDefensePower += bayernMünchen.powerDefense
            RivaltotalMidPower += bayernMünchen.powerMid
            RivaltotalAttackPower += bayernMünchen.bonusAttack
            RivaltotalDefensePower += bayernMünchen.bonusDefense
            RivalsTacticConditionals(tacticAttacks: bayernMünchen.tacticsBonusAttack, tacticPlan: bayernMünchen.tacticsBonusPlan)
        }
        
    }
  
    func accesToMyRivalsPower() {
        
        RivaltotalAttackPower += RivalSliderAttack + RivalSegmentAttack
        RivaltotalDefensePower += RivalSliderDefense + RivalSegmentDefense
        RivaltotalMidPower += Double(RivalSegmentMid)
        
        RivalFinalAttack += Double(RivaltotalAttackPower) + (RivaltotalMidPower/10)
        RivalFinalDefense += Double(RivaltotalDefensePower) + (RivaltotalMidPower/10)
        
    }
    
    func RivalsTacticConditionals(tacticAttacks: Int,tacticPlan: Int) {
        
        if tacticAttacks > 10 {
            RivalSliderAttack = tacticAttacks - 10
            var sliderDefense = 20 - tacticAttacks
            RivalSliderDefense = sliderDefense - 10
        }else if tacticAttacks < 10 {
            RivalSliderAttack = tacticAttacks - 10 //-
            var sliderDefense = 20 - tacticAttacks
            RivalSliderDefense = sliderDefense - 10
        }else {
            //Dengede Oyun
        }
        
        switch tacticPlan {
        case 0:
            RivalSegmentAttack = 3
            RivalSegmentMid = 0
            RivalSegmentDefense = -3
            
        case 1:
            RivalSegmentAttack = 1
            RivalSegmentMid = 1
            RivalSegmentDefense = -2
        case 2:
            RivalSegmentAttack = 0
            RivalSegmentMid = 0
            RivalSegmentDefense = -0
        case 3:
            RivalSegmentAttack = 1
            RivalSegmentMid = 1
            RivalSegmentDefense = -2
        case 4:
            RivalSegmentAttack = 1
            RivalSegmentMid = -2
            RivalSegmentDefense = 1
        case 5:
            RivalSegmentAttack = -3
            RivalSegmentMid = 0
            RivalSegmentDefense = 3
            
        default:
            print("Açıldı")
        }
        
    }
    
    func matchFuncAllOfPozitif() {
        
        //Benim Golüm
        var myGoal = finalAttack - RivalFinalDefense
        //Rakinim Gölü
        var rivalsGoal = RivalFinalAttack - finalDefense
        
     
        var totalAttempt = (myGoal + rivalsGoal) * 10
        var myAttempt : Int = Int(myGoal * 10)
        var rivalAttempt : Int = Int(rivalsGoal * 10)
        scoreArray = [String]()
        for _ in 1...myAttempt {
            scoreArray.append(matchArray[0])
        }
        for _ in 1...rivalAttempt {
            scoreArray.append(matchArray[1])
        }
        
        scoreArray.shuffle()
    
        var element1 = scoreArray.randomElement()!
        var element2 = scoreArray.randomElement()!
        var element3 = scoreArray.randomElement()!
        var element4 = scoreArray.randomElement()!
        var element5 = scoreArray.randomElement()!
        print(element1)
        print(element2)
        print(element3)
        print(element4)
        print(element5)
        print("\n")
        
        var ScoreArray = [String]()
        ScoreArray.append(element1)
        ScoreArray.append(element2)
        ScoreArray.append(element3)
        ScoreArray.append(element4)
        ScoreArray.append(element5)
        
        var set = Set(ScoreArray)
        
        if set.count < 2 {
            //Gol olmuş
            print("Gol olmuş")
            
            var golAtanTakim = ScoreArray[0] // Zaten her eleman aynı
            if golAtanTakim == matchArray[0] {
                //Golü ben atmışım gol sol tarafa yazılır
                leftTeamScore += 1
                leftTeamScoreLabel.text = "\(leftTeamScore)"
            
                
            }else {
                //diğer durumda golü rakip atmıştır, gol sağa yazılır
                rightTeamScore += 1
                rightTeamScoreLabel.text = "\(rightTeamScore)"
            }
        }else {
            //Gol olmamıs
            print("Gol olmamıs")
        }
}

    func matchFuncAllOfNegatif() {
        
        //Benim Golüm
        var myGoal = finalAttack - RivalFinalDefense
        //Rakinim Gölü
        var rivalsGoal = RivalFinalAttack - finalDefense
        
        var newMyGoal = (-1.0) * myGoal
        var newRivalsGoal = (-1.0) * rivalsGoal
            
        var totalAttempt = (newMyGoal + newRivalsGoal) * 10
        var myAttempt : Int = Int(newMyGoal * 10)
        var rivalAttempt : Int = Int(newRivalsGoal * 10)
        scoreArray = [String]()
            
        //Herkes (-) olunca terseleme işlemi yapılcak!
            
        for _ in 1...myAttempt {
            scoreArray.append(matchArray[1])
        }
        for _ in 1...rivalAttempt {
            scoreArray.append(matchArray[0])
        }
            
        scoreArray.shuffle()
       
        var element1 = scoreArray.randomElement()!
        var element2 = scoreArray.randomElement()!
        var element3 = scoreArray.randomElement()!
        var element4 = scoreArray.randomElement()!
        var element5 = scoreArray.randomElement()!
        print(element1)
        print(element2)
        print(element3)
        print(element4)
        print(element5)
        print("\n")
        
        //5li değerin birbirinden farklı mı değil mi diye öğreneceğiz!
        var ScoreArray = [String]()
        ScoreArray.append(element1)
        ScoreArray.append(element2)
        ScoreArray.append(element3)
        ScoreArray.append(element4)
        ScoreArray.append(element5)
        
        var set = Set(ScoreArray)
        
        if set.count < 2 {
            //Gol olmuş
            print("Gol olmuş")
            
            var golAtanTakim = ScoreArray[0] // Zaten her eleman aynı
            if golAtanTakim == matchArray[0] {
                //Golü ben atmışım gol sol tarafa yazılır
                leftTeamScore += 1
                leftTeamScoreLabel.text = "\(leftTeamScore)"
            
                
            }else {
                //diğer durumda golü rakip atmıştır, gol sağa yazılır
                rightTeamScore += 1
                rightTeamScoreLabel.text = "\(rightTeamScore)"
            }
        }else {
            //Gol olmamıs
            print("Gol olmamıs")
        }
    }
    
    
    func matchFuncInEvery3Minutes() {
        //Benim Golüm
        var myGoal = finalAttack - RivalFinalDefense
        //Rakinim Gölü
        var rivalsGoal = RivalFinalAttack - finalDefense
        
        if myGoal > 0 && rivalsGoal > 0 {
            matchFuncAllOfPozitif()
        }else if myGoal < 0 && rivalsGoal < 0 {
            matchFuncAllOfNegatif()
        }else {
            //Demekki biri (+) biri (-)
        }
    }
    
    
    
    func makeAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(button)
        self.present(alert, animated: true)
    }

    
}
