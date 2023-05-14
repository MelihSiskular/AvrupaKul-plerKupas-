//
//  FixtureViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 6.04.2023.
//

import UIKit

class FixtureViewController: UIViewController {
    
    //MARK: Tanımlar
    
    ///Yaptığıım Tasarımın yerini alacak tüm ekranı kaplayan image
    var imageScreen = UIImageView()
    
    
    ///Grupları rastegele bir şekilde belirlemek için takım isimlerinin olduğu bir diziye ihtyacım oldu
    var teams = ["Arsenal","Tottenham","Manchester City","Manchester United","Liverpool","Chelsea","Barcelona","Real Madrid","Atletico Madrid","PSG","Inter","Milan","Juventus","Napoli","Borussia Dortmund","Bayern München"]
    
    ///GaneViewController'dan bize gelecek takımımız
    var myTeam = ""
    
    ///Seçtiğimiz Takım Hangi grup içinde olduğunu öğrencez
    var myGroup = ""
    
    ///Grubumuzdaki Maçların fikstürü belli olacak
    var match1 = ""
    var match2 = ""
    var match3 = ""
    //Bunları bir de diziye atalım aktarma işleminde
    var match1Array = [String]()
    var match2Array = [String]()
    var match3Array = [String]()
    
    ///Kendi Takım Renklerimiz gameViewScreen üzerinden gelecek
    var myTeamColors = [UIColor]()
    
    ///Grup Aşamasında maçların oynanması için başka ekran götüren butonlar
    var buttonMatch1 = UIButton()
    var buttonMatch2 = UIButton()
    var buttonMatch3 = UIButton()
    
    ///16 tane takımdan 4'erli 4 tane grup olcak
    ///Bu gruplar tamamen random bir şekilde oluşturulcak
    var groupA = [String]()
    var groupB = [String]()
    var groupC = [String]()
    var groupD = [String]()
    
    ///Bizim içinde olduğumuz Grup ekranda gözükecek
    ///Bu yüzden gruptaki takımların isimleri, puanları, averajları göstermemiz gerek
    ///onun için laeller açıyorum
    var groupNameLabel = UILabel()
    var groupFirstPosition = UILabel()
    var groupSecondPosition = UILabel()
    var groupThirdPosition = UILabel()
    var groupFourthPosition = UILabel()
    var groupFirstPoint = UILabel()
    var groupSecondPoint = UILabel()
    var groupThirdPoint = UILabel()
    var groupFourthPoint = UILabel()
    var groupFirstAverage = UILabel()
    var groupSecondAverage = UILabel()
    var groupThirdAverage = UILabel()
    var groupFourthAverage = UILabel()
    
    ///Tanımladığımız match1,2,3 değerleri göstercek label
    var matchLabel1 = UILabel()
    var matchLabel2 = UILabel()
    var matchLabel3 = UILabel()
    
    ///Eğer grup aşaması başarı ile tamamlanırsa Çeyrek finale gidececk buton
    var goQuarterFinals = UIButton()
    
    ///Çeyrek Finale gitmek için ilk iki takım
    var firstPosition = ""
    var secondPosition = ""
    
    ///Grup Aşamasının altında  bir açıklama
    var guideLabel = UILabel()
    
    
  
    
    
    
    ///Diğer classlarda değişim yapabilmek için sharedlar
    var controls = Controls.sharedControls
    var controlsMyTeam = ControlsMyTeam.sharedControlsMyTeam
    var controlsPoinsAndAverages = ControlGrupPointsAndAverages.sharedControlPoinsAndAverages
    let shared = GroupStages.shared
    var groupStages = GroupStages.shared
    
  
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = "Taktiklere Dön"
        
        let width = view.frame.size.width
        let height = view.frame.size.height
       
        imageScreen.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageScreen.image = UIImage(named: "iPhone")
        view.addSubview(imageScreen)
        imageScreen.contentMode = .scaleAspectFit
        
        print("Shareddan gelen atack \(controlsMyTeam.finalAttack)")
        print("Shateddan gelen defans \(controlsMyTeam.finalDefense)")
        
        groupFirstPosition.frame = CGRect(x: width * 0.05, y: height * 0.15, width: width * 0.65, height: height * 0.06)
        
       
        groupSecondPosition.frame = CGRect(x: width * 0.05, y: height * 0.22, width: width * 0.65, height: height * 0.06)
        

        groupThirdPosition.frame = CGRect(x: width * 0.05, y: height * 0.29, width: width * 0.65, height: height * 0.06)
        
       
        groupFourthPosition.frame = CGRect(x: width * 0.05, y: height * 0.365, width: width * 0.65, height: height * 0.06)
        
        groupFirstPosition.text = ""
        groupSecondPosition.text = ""
        groupThirdPosition.text = ""
        groupFourthPosition.text = ""
        
       
        
        groupFirstPosition.textAlignment = .center
        groupSecondPosition.textAlignment = .center
        groupThirdPosition.textAlignment = .center
        groupFourthPosition.textAlignment = .center
        
        groupFirstPosition.font = UIFont(name: "Kefa", size: 19)
        groupSecondPosition.font = UIFont(name: "Kefa", size: 19)
        groupThirdPosition.font = UIFont(name: "Kefa", size: 19)
        groupFourthPosition.font = UIFont(name: "Kefa", size: 19)
        
   
        groupFirstPoint.frame = CGRect(x: width * 0.72, y: height * 0.15, width: width * 0.09, height: height * 0.06)
        groupFirstPoint.text = "0"
        groupFirstPoint.textAlignment = .center
        
      
        groupSecondPoint.frame = CGRect(x: width * 0.72, y: height * 0.22, width: width * 0.09, height: height * 0.06)
        groupSecondPoint.text = "0"
        groupSecondPoint.textAlignment = .center
        
        
 
        groupThirdPoint.frame = CGRect(x: width * 0.72, y: height * 0.29, width: width * 0.09, height: height * 0.06)
        groupThirdPoint.text = "0"
        groupThirdPoint.textAlignment = .center
       
        
   
        groupFourthPoint.frame = CGRect(x: width * 0.72, y: height * 0.365, width: width * 0.09, height: height * 0.06)
        groupFourthPoint.text = "0"
        groupFourthPoint.textAlignment = .center
        
        
        
        
        groupFirstAverage.frame = CGRect(x: width * 0.845, y: height * 0.15, width: width * 0.09, height: height * 0.06)
        groupFirstAverage.text = "0"
        groupFirstAverage.textAlignment = .center
     
        
      
        groupSecondAverage.frame = CGRect(x: width * 0.844, y: height * 0.22, width: width * 0.09, height: height * 0.06)
        groupSecondAverage.text = "0"
        groupSecondAverage.textAlignment = .center
       
        
        
        groupThirdAverage.frame = CGRect(x: width * 0.845, y: height * 0.29, width: width * 0.09, height: height * 0.06)
        groupThirdAverage.text = "0"
        groupThirdAverage.textAlignment = .center
      
        
  
        groupFourthAverage.frame = CGRect(x: width * 0.845, y: height * 0.365, width: width * 0.09, height: height * 0.06)
        groupFourthAverage.text = "0"
        groupFourthAverage.textAlignment = .center
     
        
        matchLabel1.frame = CGRect(x: width * 0.05, y: height * 0.502, width: width * 0.7, height: height * 0.052)
      
        
        matchLabel2.frame = CGRect(x: width * 0.05, y: height * 0.619, width: width * 0.7, height: height * 0.052)
       
        
        matchLabel3.frame = CGRect(x: width * 0.05, y: height * 0.737, width: width * 0.7, height: height * 0.052)
        
        buttonMatch1.setTitle("Oyna", for: UIControl.State.normal)
        buttonMatch1.setTitle("--->", for: UIControl.State.highlighted)
        buttonMatch1.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        buttonMatch2.setTitle("Oyna", for: UIControl.State.normal)
        buttonMatch2.setTitle("--->", for: UIControl.State.highlighted)
        buttonMatch2.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        buttonMatch3.setTitle("Oyna", for: UIControl.State.normal)
        buttonMatch3.setTitle("--->", for: UIControl.State.highlighted)
        buttonMatch3.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        buttonMatch1.frame = CGRect(x: width * 0.8, y: height * 0.507, width: width * 0.16, height: height * 0.04)
        
       
        buttonMatch2.frame = CGRect(x: width * 0.8, y: height * 0.625, width: width * 0.16, height: height * 0.04)
        
       
        buttonMatch3.frame = CGRect(x: width * 0.8, y: height * 0.742, width: width * 0.16, height: height * 0.04)
        
        buttonMatch2.alpha = 0.5
        buttonMatch3.alpha = 0.5
        buttonMatch2.isUserInteractionEnabled = false
        buttonMatch3.isUserInteractionEnabled = false
      
        groupFirstAverage.font = UIFont(name: "Futura", size: 19)
        groupSecondAverage.font = UIFont(name: "Futura", size: 19)
        groupThirdAverage.font = UIFont(name: "Futura", size: 19)
        groupFourthAverage.font = UIFont(name: "Futura", size: 19)
        
        groupFirstPoint.font = UIFont(name: "Futura", size: 19)
        groupSecondPoint.font = UIFont(name: "Futura", size: 19)
        groupThirdPoint.font = UIFont(name: "Futura", size: 19)
        groupFourthPoint.font = UIFont(name: "Futura", size: 19)
      
        matchLabel1.textAlignment = .center
        matchLabel2.textAlignment = .center
        matchLabel3.textAlignment = .center
        
        matchLabel1.font = UIFont(name: "Kefa", size: 14)
        matchLabel2.font = UIFont(name: "Kefa", size: 14)
        matchLabel3.font = UIFont(name: "Kefa", size: 14)
        
        
        groupNameLabel.frame = CGRect(x: width * 0.05, y: height * 0.09, width: width * 0.65, height: height * 0.07)
        groupNameLabel.textAlignment = .left
        groupNameLabel.font = UIFont(name: "Impact", size: 22)
        
        goQuarterFinals.setTitle("Çeyrek Finallere Git", for: UIControl.State.normal)
        goQuarterFinals.setTitle("--->", for: UIControl.State.highlighted)
        goQuarterFinals.backgroundColor = .systemGray5
        goQuarterFinals.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.9, width: width * 0.8, height: height * 0.055)
        goQuarterFinals.setTitleColor(.black, for: UIControl.State.normal)
        goQuarterFinals.alpha = 0.5
        goQuarterFinals.isUserInteractionEnabled = false
        goQuarterFinals.layer.cornerRadius = 12
        
        guideLabel.frame = CGRect(x: width * 0.5 - (width * 0.9)/2, y: height * 0.8, width: width * 0.9, height: height * 0.1)
        guideLabel.text = "Eğer Grup Aşamasını ilk iki sırada tamamlarsanız Çeyrek Final Aşamasına geçebileceksiniz! "
        guideLabel.textAlignment = .center
        guideLabel.font = UIFont(name: "Futura", size: 15)
        guideLabel.numberOfLines = 3
       
       
        buttonMatch1.addTarget(self, action: #selector(goToMatch1), for: UIControl.Event.touchUpInside)
        buttonMatch2.addTarget(self, action: #selector(goToMatch2), for: UIControl.Event.touchUpInside)
        buttonMatch3.addTarget(self, action: #selector(goToMatch3), for: UIControl.Event.touchUpInside)
        
        view.addSubview(groupNameLabel)
        view.addSubview(groupFirstPosition)
        view.addSubview(groupSecondPosition)
        view.addSubview(groupThirdPosition)
        view.addSubview(groupFourthPosition)
        view.addSubview(groupFirstPoint)
        view.addSubview(groupSecondPoint)
        view.addSubview(groupThirdPoint)
        view.addSubview(groupFourthPoint)
        view.addSubview(groupFirstAverage)
        view.addSubview(groupSecondAverage)
        view.addSubview(groupThirdAverage)
        view.addSubview(groupFourthAverage)
        view.addSubview(matchLabel1)
        view.addSubview(matchLabel2)
        view.addSubview(matchLabel3)
        view.addSubview(buttonMatch1)
        view.addSubview(buttonMatch2)
        view.addSubview(buttonMatch3)
        view.addSubview(goQuarterFinals)
        view.addSubview(guideLabel)
        
      

       
        groupFirstPosition.text = myTeam
        if controls.isSelectTeam  {
            //Eğer ki selectTeam True ise yani takımı seçtiysek eski veriler gözüksün
            sharedMyGroup()
            
            
            
        }else {
            
            randomGroups()
            whatIsYourGroup()
            fixture()
            controls.isSelectTeam = true
            
        }
     
        
        
 
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if controls.match1Enable == true {
            buttonMatch1.isUserInteractionEnabled = true
            buttonMatch1.alpha = 1
            
            
            buttonMatch2.isUserInteractionEnabled = false
            buttonMatch2.alpha = 0.5
            
            buttonMatch3.isUserInteractionEnabled = false
            buttonMatch3.alpha = 0.5
            
        }else if controls.match2Enable == true {
            buttonMatch1.isUserInteractionEnabled = false
            buttonMatch1.alpha = 0.5
            
            
            buttonMatch2.isUserInteractionEnabled = true
            buttonMatch2.alpha = 1
            
            buttonMatch3.isUserInteractionEnabled = false
            buttonMatch3.alpha = 0.5
            
        }else if controls.match3Enable == true {
            buttonMatch1.isUserInteractionEnabled = false
            buttonMatch1.alpha = 0.5
            
            buttonMatch2.isUserInteractionEnabled = false
            buttonMatch2.alpha = 0.5
            
            buttonMatch3.isUserInteractionEnabled = true
            buttonMatch3.alpha = 1
        }else {
            //Bu da hepsinin false olduğu yani 3. maçıno oynandığı an burdan yapılan grup sıralam kontrolüne göre çeyrek final butonu aktifleşir
            buttonMatch3.isUserInteractionEnabled = false
            buttonMatch3.alpha = 0.5
            //Son maçtan geldiğimizde bunu da kapatmamız lazım!
            
            //Eğer çeyrek finale gidemezsek orada başka bişi yazsın 'Bir dahaki sefere' gibi
            teamsWhichPassTheGroupStage()
            print("A Grubu:",groupStages.groupAfirstSecond)
            print("B Grubu:",groupStages.groupBfirstSecond)
            print("C Grubu:",groupStages.groupCfirstSecond)
            print("D Grubu:",groupStages.groupDfirstSecond)
            
            titleOfQuarterFinalButton()
            
        }
        groupFirstPoint.text = "\(controlsPoinsAndAverages.myTeanPoints)"
        groupSecondPoint.text = "\(controlsPoinsAndAverages.team3Points)"
        groupThirdPoint.text = "\(controlsPoinsAndAverages.team2Points)"
        groupFourthPoint.text = "\(controlsPoinsAndAverages.team1Points)"
       
        groupFirstAverage.text = "\(controlsPoinsAndAverages.MyteamAverages)"
        groupSecondAverage.text = "\(controlsPoinsAndAverages.team3Averages)"
        groupThirdAverage.text = "\(controlsPoinsAndAverages.team2Averages)"
        groupFourthAverage.text = "\(controlsPoinsAndAverages.team1Averages)"
        
       
        
    }
    
    //MARK: FUNC
    
    func whoWasInMyGroupA(GroupA: Array<String>) {
        var myGroupA = GroupA
        
   
        
       
        if myGroupA.contains(myTeam) {
           let index = myGroupA.firstIndex(of: myTeam)
            myGroupA.remove(at: index!)
        
            for i in myGroupA {
                
               if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
            
            groupPositionOrderA()
            var team1 = myGroupA.last!
            myGroupA.removeLast()
            var team2 = myGroupA.last!
            myGroupA.removeLast()
            var team3 = myGroupA.last!
            myGroupA.removeLast()
            
            match1 = "\(myTeam) Vs \(team1)"
            match2 = "\(myTeam) Vs \(team2)"
            match3 = "\(myTeam) Vs \(team3)"
            match1Array.append(myTeam)
            match1Array.append(team1)
            match2Array.append(myTeam)
            match2Array.append(team2)
            match3Array.append(myTeam)
            match3Array.append(team3)
            
            
            print(match1)
            print(match2)
            print(match3)
            
            matchLabel1.text = match1
            matchLabel2.text = match2
            matchLabel3.text = match3
            
           
            
            
        }
        
    }
    func whoWasInMyGroupB(GroupB: Array<String>) {
        
        var myGroupB = GroupB
        
    
        
       
        if myGroupB.contains(myTeam) {
           let index = myGroupB.firstIndex(of: myTeam)
            myGroupB.remove(at: index!)
        
            for i in myGroupB {
                
               if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
            
            groupPositionOrderB()
            var team1 = myGroupB.last!
            myGroupB.removeLast()
            var team2 = myGroupB.last!
            myGroupB.removeLast()
            var team3 = myGroupB.last!
            myGroupB.removeLast()
            
            match1 = "\(myTeam) Vs \(team1)"
            match2 = "\(myTeam) Vs \(team2)"
            match3 = "\(myTeam) Vs \(team3)"
            match1Array.append(myTeam)
            match1Array.append(team1)
            match2Array.append(myTeam)
            match2Array.append(team2)
            match3Array.append(myTeam)
            match3Array.append(team3)
            
            
            print(match1)
            print(match2)
            print(match3)
            
            matchLabel1.text = match1
            matchLabel2.text = match2
            matchLabel3.text = match3
            
           
            
            
        }
        
    }
    func whoWasInMyGroupC(GroupC: Array<String>) {
        
        var myGroupC = GroupC
        
     
        
       
        if myGroupC.contains(myTeam) {
           let index = myGroupC.firstIndex(of: myTeam)
            myGroupC.remove(at: index!)
        
            for i in myGroupC {
                
               if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
            
            groupPositionOrderC()
            var team1 = myGroupC.last!
            myGroupC.removeLast()
            var team2 = myGroupC.last!
            myGroupC.removeLast()
            var team3 = myGroupC.last!
            myGroupC.removeLast()
            
            match1 = "\(myTeam) Vs \(team1)"
            match2 = "\(myTeam) Vs \(team2)"
            match3 = "\(myTeam) Vs \(team3)"
            match1Array.append(myTeam)
            match1Array.append(team1)
            match2Array.append(myTeam)
            match2Array.append(team2)
            match3Array.append(myTeam)
            match3Array.append(team3)
            
            
            print(match1)
            print(match2)
            print(match3)
            
            matchLabel1.text = match1
            matchLabel2.text = match2
            matchLabel3.text = match3
            
           
            
            
        }
        
    }
    func whoWasInMyGroupD(GroupD: Array<String>) {
        
        var myGroupD = GroupD
        
   
        
       
        if myGroupD.contains(myTeam) {
           let index = myGroupD.firstIndex(of: myTeam)
            myGroupD.remove(at: index!)
        
            for i in myGroupD {
                
               if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
            
            groupPositionOrderD()
            var team1 = myGroupD.last!
            myGroupD.removeLast()
            var team2 = myGroupD.last!
            myGroupD.removeLast()
            var team3 = myGroupD.last!
            myGroupD.removeLast()
            
            match1 = "\(myTeam) Vs \(team1)"
            match2 = "\(myTeam) Vs \(team2)"
            match3 = "\(myTeam) Vs \(team3)"
            match1Array.append(myTeam)
            match1Array.append(team1)
            match2Array.append(myTeam)
            match2Array.append(team2)
            match3Array.append(myTeam)
            match3Array.append(team3)
            
            
            print(match1)
            print(match2)
            print(match3)
            
            matchLabel1.text = match1
            matchLabel2.text = match2
            matchLabel3.text = match3
            
           
            
            
        }
        
    }
    
    func sharedMyGroup() {
        
        //Gruplar kaydedilcek
        var savedGroupA = self.shared.groupA
        var savedGroupB = self.shared.groupB
        var savedGroupC = self.shared.groupC
        var savedGroupD = self.shared.groupD
        
        for i in savedGroupA {
            if myTeam == i {
                groupNameLabel.text = "A Grubu"
                whoWasInMyGroupA(GroupA: shared.groupA)
            }
        }
        for i in savedGroupB {
            if myTeam == i {
                groupNameLabel.text = "B Grubu"
                whoWasInMyGroupB(GroupB: shared.groupB)
            }
        }
        for i in savedGroupC {
            if myTeam == i {
                groupNameLabel.text = "C Grubu"
                whoWasInMyGroupC(GroupC: shared.groupC)
            }
        }
        for i in savedGroupD {
            if myTeam == i {
                groupNameLabel.text = "D Grubu"
                whoWasInMyGroupD(GroupD: shared.groupD)
            }
        }
        
    }
    
    func titleOfQuarterFinalButton() {
        
        if myGroup == "A Grubu" {
            
            if groupStages.groupAfirstSecond.contains(myTeam) {
                //Çeyrek Finale gideceğim
                goQuarterFinals.isUserInteractionEnabled = true
                goQuarterFinals.alpha = 1
            }else {
                //Çeyrek Finale gidemeyeceğim
                goQuarterFinals.setTitle("Bir Dahaki Sefere", for: UIControl.State.normal)
            }
            
        }else if myGroup == "B Grubu" {
            
            if groupStages.groupBfirstSecond.contains(myTeam) {
                //Çeyrek Finale gideceğim
                goQuarterFinals.isUserInteractionEnabled = true
                goQuarterFinals.alpha = 1
            }else {
                //Çeyrek Finale gidemeyeceğim
                goQuarterFinals.setTitle("Bir Dahaki Sefere", for: UIControl.State.normal)
            }

            
        }else if myGroup == "C Grubu" {
            
            if groupStages.groupCfirstSecond.contains(myTeam) {
                //Çeyrek Finale gideceğim
                goQuarterFinals.isUserInteractionEnabled = true
                goQuarterFinals.alpha = 1
            }else {
                //Çeyrek Finale gidemeyeceğim
                goQuarterFinals.setTitle("Bir Dahaki Sefere", for: UIControl.State.normal)
            }

            
        }else if myGroup == "D Grubu" {
            
            if groupStages.groupDfirstSecond.contains(myTeam) {
                //Çeyrek Finale gideceğim
                goQuarterFinals.isUserInteractionEnabled = true
                goQuarterFinals.alpha = 1
            }else {
                //Çeyrek Finale gidemeyeceğim
                goQuarterFinals.setTitle("Bir Dahaki Sefere", for: UIControl.State.normal)
            }

            
        }
        
    }
    
    @objc
    func goToMatch1() {
        
        performSegue(withIdentifier: "toMatch1", sender: nil)
        
    }
    
    @objc
    func goToMatch2() {
        
        performSegue(withIdentifier: "toMatch2", sender: nil)
        
    }
    
    @objc
    func goToMatch3() {
        
        performSegue(withIdentifier: "toMatch3", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMatch1" {
            
            let destination = segue.destination as! Match1ViewController
            destination.matchText = match1
            destination.matchArray = match1Array
            
        }
        else if segue.identifier == "toMatch2" {
            
            let destination = segue.destination as! Match2ViewController
            destination.matchText = match2
            destination.matchArray = match2Array
            
        }
        else if segue.identifier == "toMatch3" {
            
            let destination = segue.destination as! Match3ViewController
            destination.matchText = match3
            destination.matchArray = match3Array
            
            
        }
    }
    
    func randomGroups() {
        
        
        
        //Rastgele gruplara Ayrılacak!
        teams.shuffle()
        for i in 0...teams.count - 1  {
            
            let randomteam = teams.last!
            teams.remove(at: teams.count - 1)
            if groupA.count < 4 {
                groupA.append(randomteam)
                shared.groupA.append(randomteam)
            }else {
                if groupB.count < 4 {
                    groupB.append(randomteam)
                    shared.groupB.append(randomteam)
                }else {
                    if groupC.count < 4 {
                        groupC.append(randomteam)
                        shared.groupC.append(randomteam)
                    }else {
                        groupD.append(randomteam)
                        shared.groupD.append(randomteam)
                    }
                }
            }
        }
    }
    
    func whatIsYourGroup() {
        //Takımımız Hangi Grupta onu bulucak!
        
        for i in groupA {
            if i == myTeam {
                myGroup = "A Grubu"
            }
        }
        
        for i in groupB {
            if i == myTeam {
                myGroup = "B Grubu"
            }
        }
        
        for i in groupC {
            if i == myTeam {
                myGroup = "C Grubu"
            }
        }
        
        for i in groupD {
            if i == myTeam {
                myGroup = "D Grubu"
            }
        }
      
        groupNameLabel.text = myGroup
    }
    
    
    func fixture() {
        //Hangi grupta isek o gruptakilerle fikstür belirleyen fonksiyon
        //Aynı zamanda diğer gruplardaki sıralamayı da belirler
        
        if myGroup == "A Grubu" {
            if groupA.contains(myTeam) {
               let index = groupA.firstIndex(of: myTeam)
               groupA.remove(at: index!)
               print(groupA)
                groupPositionOrderA()
                var team1 = groupA.last!
                groupA.removeLast()
                var team2 = groupA.last!
                groupA.removeLast()
                var team3 = groupA.last!
                groupA.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                match1Array.append(myTeam)
                match1Array.append(team1)
                match2Array.append(myTeam)
                match2Array.append(team2)
                match3Array.append(myTeam)
                match3Array.append(team3)
                
                
                print(match1)
                print(match2)
                print(match3)
                
                matchLabel1.text = match1
                matchLabel2.text = match2
                matchLabel3.text = match3
                
                exceptAotherGruopLeaders()
                
                
            }
            
        }else if myGroup == "B Grubu" {
            if groupB.contains(myTeam) {
               let index = groupB.firstIndex(of: myTeam)
               groupB.remove(at: index!)
               print(groupB)
                groupPositionOrderB()
                var team1 = groupB.last!
                groupB.removeLast()
                var team2 = groupB.last!
                groupB.removeLast()
                var team3 = groupB.last!
                groupB.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                match1Array.append(myTeam)
                match1Array.append(team1)
                match2Array.append(myTeam)
                match2Array.append(team2)
                match3Array.append(myTeam)
                match3Array.append(team3)
                
                matchLabel1.text = match1
                matchLabel2.text = match2
                matchLabel3.text = match3
                
                
                print(match1)
                print(match2)
                print(match3)
                
                exceptBotherGruopLeaders()
                
            }
            
        }else if myGroup == "C Grubu" {
            if groupC.contains(myTeam) {
               let index = groupC.firstIndex(of: myTeam)
               groupC.remove(at: index!)
               print(groupC)
                groupPositionOrderC()
                var team1 = groupC.last!
                groupC.removeLast()
                var team2 = groupC.last!
                groupC.removeLast()
                var team3 = groupC.last!
                groupC.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                match1Array.append(myTeam)
                match1Array.append(team1)
                match2Array.append(myTeam)
                match2Array.append(team2)
                match3Array.append(myTeam)
                match3Array.append(team3)
                
        
                
                print(match1)
                print(match2)
                print(match3)
                
                matchLabel1.text = match1
                matchLabel2.text = match2
                matchLabel3.text = match3
                
                exceptCotherGruopLeaders()
                
            }
            
        }else if myGroup == "D Grubu" {
            if groupD.contains(myTeam) {
               let index = groupD.firstIndex(of: myTeam)
               groupD.remove(at: index!)
               print(groupD)
                groupPositionOrderD()
                var team1 = groupD.last!
                groupD.removeLast()
                var team2 = groupD.last!
                groupD.removeLast()
                var team3 = groupD.last!
                groupD.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                match1Array.append(myTeam)
                match1Array.append(team1)
                match2Array.append(myTeam)
                match2Array.append(team2)
                match3Array.append(myTeam)
                match3Array.append(team3)
                
                print(match1)
                print(match2)
                print(match3)
                
                matchLabel1.text = match1
                matchLabel2.text = match2
                matchLabel3.text = match3
                
                exceptDotherGruopLeaders()
            }
        }
        
        
        
    }
    
    
    func groupPositionOrderA() {
        if myGroup == "A Grubu" {
            for i in groupA {
                
               if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
        }
    }
    
    func groupPositionOrderB() {
        if myGroup == "B Grubu" {
            for i in groupB {
                
                if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
        }
    }
    
    func groupPositionOrderC() {
        if myGroup == "C Grubu" {
            for i in groupC {
                
                if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
            }
        }
    }
    
    func groupPositionOrderD() {
        if myGroup == "D Grubu" {
            for i in groupD {
                
                if groupSecondPosition.text == "" {
                    groupSecondPosition.text = String(i)
                }else if groupThirdPosition.text == "" {
                    groupThirdPosition.text = String(i)
                }else if groupFourthPosition.text == "" {
                    groupFourthPosition.text = String(i)
                }
                
            }
        }
    }
    
    func exceptAotherGruopLeaders() {
        
        let shared = GroupStages.shared
        
        groupB.shuffle()
        groupC.shuffle()
        groupD.shuffle()
        
        shared.groupBfirstSecond.append(groupB[0])
        shared.groupBfirstSecond.append(groupB[1])
        
        shared.groupCfirstSecond.append(groupC[0])
        shared.groupCfirstSecond.append(groupC[1])
        
        shared.groupDfirstSecond.append(groupD[0])
        shared.groupDfirstSecond.append(groupD[1])
        
        
        
    }
    

    
    func exceptBotherGruopLeaders() {
        
        let shared = GroupStages.shared
        
        groupA.shuffle()
        groupC.shuffle()
        groupD.shuffle()
        
        shared.groupAfirstSecond.append(groupA[0])
        shared.groupAfirstSecond.append(groupA[1])
        
        shared.groupCfirstSecond.append(groupC[0])
        shared.groupCfirstSecond.append(groupC[1])
        
        shared.groupDfirstSecond.append(groupD[0])
        shared.groupDfirstSecond.append(groupD[1])
        
        
    }
    
    func exceptCotherGruopLeaders() {
        
        let shared = GroupStages.shared
        
        groupB.shuffle()
        groupA.shuffle()
        groupD.shuffle()
        
        shared.groupBfirstSecond.append(groupB[0])
        shared.groupBfirstSecond.append(groupB[1])
        
        shared.groupAfirstSecond.append(groupA[0])
        shared.groupAfirstSecond.append(groupA[1])
        
        shared.groupDfirstSecond.append(groupD[0])
        shared.groupDfirstSecond.append(groupD[1])
        
        
        
    }
    
    func exceptDotherGruopLeaders() {
        
        let shared = GroupStages.shared
        
        groupB.shuffle()
        groupC.shuffle()
        groupA.shuffle()
        
        shared.groupBfirstSecond.append(groupB[0])
        shared.groupBfirstSecond.append(groupB[1])
        
        shared.groupCfirstSecond.append(groupC[0])
        shared.groupCfirstSecond.append(groupC[1])
        
        shared.groupAfirstSecond.append(groupA[0])
        shared.groupAfirstSecond.append(groupA[1])
        
        
    }
    
    func teamsWhichPassTheGroupStage() {
        
        var MyPoints = controlsPoinsAndAverages.myTeanPoints // 1.sıra
        var team1Points = controlsPoinsAndAverages.team1Points //4.sıra
        var team2Points = controlsPoinsAndAverages.team2Points // 3.sıra
        var team3Poinst = controlsPoinsAndAverages.team3Points // 2.sıra
        
        var MyAverage = controlsPoinsAndAverages.MyteamAverages // 1.sıra
        var team1Average = controlsPoinsAndAverages.team1Averages //4.sıra
        var team2Average = controlsPoinsAndAverages.team2Averages // 3.sıra
        var team3Average = controlsPoinsAndAverages.team3Averages // 2.sıra
    
        var RealPointsArray = [MyPoints,team1Points,team2Points,team3Poinst]
        var pointsArray = Set([MyPoints,team1Points,team2Points,team3Poinst])
        
        var RealAveragesArray = [MyAverage,team1Average,team2Average,team3Average]
        var AveragesArray = Set([MyAverage,team1Average,team2Average,team3Average])
        
        if pointsArray.count == 4 {
            print("HERKESİN PUANI FARKLI")
            //Herkesin puanı birbirinden farklı averaj önemsiz, en iyi ikiliyi al
            var firstPositionPoint = pointsArray.max()!
            pointsArray.remove(firstPositionPoint)
            var secondPositionPoint = pointsArray.max()!
            // ilk 2 elemanı aldık!
            //Bunları hangi takımlar olduğunu anlamamz lazım
            var takimIndex = 0
            for i in RealPointsArray {
                
                if i == firstPositionPoint {
                    
                    if takimIndex == 0 {
                        //1.benim
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(myTeam)
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(myTeam)
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(myTeam)
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(myTeam)
                        }
                        
                    }else if takimIndex == 1 {
                        //1. team1 == match1 == 4.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match1Array[1])
                        }
                        
                    }else if takimIndex == 2 {
                        //1. team2 == match2 == 3.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match2Array[1])
                        }
                    }else if takimIndex == 3 {
                        //1. team3 == match3 == 2.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match3Array[1])
                        }
                    }
                    
                    print(groupStages.groupAfirstSecond)
                    print(groupStages.groupBfirstSecond)
                    print(groupStages.groupCfirstSecond)
                    print(groupStages.groupDfirstSecond)
                }else {
                    takimIndex += 1
                }
               
                
            }
            var takim2Index = 0
            for i in RealPointsArray {
                if i == secondPositionPoint {
                    
                    if takim2Index == 0 {
                        //2.benim
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(myTeam)
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(myTeam)
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(myTeam)
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(myTeam)
                        }
                        
                    }else if takim2Index == 1 {
                        //2. team1 == match1 == 4.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match1Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match1Array[1])
                        }
                        
                    }else if takim2Index == 2 {
                        //2. team2 == match2 == 3.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match2Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match2Array[1])
                        }
                    }else if takim2Index == 3 {
                        //2. team3 == match3 == 2.sıra
                        if myGroup == "A Grubu" {
                            groupStages.groupAfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "B Grubu" {
                            groupStages.groupBfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "C Grubu" {
                            groupStages.groupCfirstSecond.append(match3Array[1])
                            
                        }else if myGroup == "D Grubu" {
                            groupStages.groupDfirstSecond.append(match3Array[1])
                        }
                    }
                }else {
                    takim2Index += 1
                }
                
            }
            
        
            //GroupStageden firstSecond'a yollamamız lazım!
            
        
//
//            if myGroup == "A Grubu" {
//
//                groupStages.groupAfirstSecond.append(firstPosition) //1. olan 0. indeks!
//                groupStages.groupAfirstSecond.append(secondPosition)
//
//            }else if myGroup == "B Grubu" {
//
//                groupStages.groupBfirstSecond.append(firstPosition)
//                groupStages.groupBfirstSecond.append(secondPosition)
//
//            }else if myGroup == "C Grubu" {
//
//                groupStages.groupCfirstSecond.append(firstPosition)
//                groupStages.groupCfirstSecond.append(secondPosition)
//
//            }else if myGroup == "D Grubu" {
//
//                groupStages.groupDfirstSecond.append(firstPosition)
//                groupStages.groupDfirstSecond.append(secondPosition)
//
//            }
            //Bizim grubumuz haricindekiler zaten belirlendi!
            
        }else if pointsArray.count == 3 {
            //AYNI PUANA SAHİP 2 TAKIM VAR
            print("AYNI PUANA SAHİP 2 TAKIM VAR")
            
        }else if pointsArray.count == 2 {
            //AYNI PUANA SAHİP 3 TAKIM VAR
            //Veya 2ye 2
            print("AYNI PUANA SAHİP 3 TAKIM VEYA 2YE2")
           
            
        }else if pointsArray.count == 1 {
            //HERKES AYNI PUANA SAHİP
            print("AYNI PUANA SAHİP 4 TAKIM VAR")
            
        }
        
        
    }
    
    
    func makeAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(button)
        self.present(alert, animated: true)
    }
    
}
