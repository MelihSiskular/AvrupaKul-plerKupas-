//
//  FixtureViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 6.04.2023.
//

import UIKit

class FixtureViewController: UIViewController {
    
    //MARK: Tanımlar
    
    var imageScreen = UIImageView()
    
    
    
    var teams = ["Arsenal","Tottenham","Manchester City","Manchester United","Liverpool","Chelsea","Barcelona","Real Madrid","Atletico Madrid","PSG","Inter","Milan","Juventus","Napoli","Borussia Dortmund","Bayern München"]
    
    ///GaneViewController'dan bize gelecek takımımız
    var myTeam = ""
    
    ///Seçtiğimiz Takım Hangi grup içinde olduğunu öğrencez
    var myGroup = ""
    
    ///İlk önce Grubumuzdaki Maçların fikstürü belli olacak
    var match1 = ""
    var match2 = ""
    var match3 = ""
    

    ///16 tane takımdan 4'erli 4 tane grup olcak
    ///Bu gruplar tamamen random bir şekilde oluşturulcak
    var groupA = [String]()
    var groupB = [String]()
    var groupC = [String]()
    var groupD = [String]()
    
    
    

    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = "Taktiklere Dön"
        
        let width = view.frame.size.width
        let height = view.frame.size.height
       
        
    
        randomGroups()
        whatIsYourGroup()
        fixture()
     
      
        
        imageScreen.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageScreen.image = UIImage(named: "iPhone")
        view.addSubview(imageScreen)
        imageScreen.contentMode = .scaleAspectFit
       
    }
    
    
    
    //MARK: FUNC
    
    func randomGroups() {
        
        //Rastgele gruplara Ayrılacak!
        teams.shuffle()
        for i in 0...teams.count - 1  {
            
            let randomteam = teams.last!
            teams.remove(at: teams.count - 1)
            if groupA.count < 4 {
                groupA.append(randomteam)
            }else {
                if groupB.count < 4 {
                    groupB.append(randomteam)
                }else {
                    if groupC.count < 4 {
                        groupC.append(randomteam)
                    }else {
                        groupD.append(randomteam)
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
    }
    
    
    func fixture() {
        
        if myGroup == "A Grubu" {
            if groupA.contains(myTeam) {
               let index = groupA.firstIndex(of: myTeam)
               groupA.remove(at: index!)
               print(groupA)
                
                var team1 = groupA.last!
                groupA.removeLast()
                var team2 = groupA.last!
                groupA.removeLast()
                var team3 = groupA.last!
                groupA.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                
                print(match1)
                print(match2)
                print(match3)
                
                
                
            }
            
        }else if myGroup == "B Grubu" {
            if groupB.contains(myTeam) {
               let index = groupB.firstIndex(of: myTeam)
               groupB.remove(at: index!)
               print(groupB)
                
                var team1 = groupB.last!
                groupB.removeLast()
                var team2 = groupB.last!
                groupB.removeLast()
                var team3 = groupB.last!
                groupB.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                
                print(match1)
                print(match2)
                print(match3)
            }
            
        }else if myGroup == "C Grubu" {
            if groupC.contains(myTeam) {
               let index = groupC.firstIndex(of: myTeam)
               groupC.remove(at: index!)
               print(groupC)
                
                var team1 = groupC.last!
                groupC.removeLast()
                var team2 = groupC.last!
                groupC.removeLast()
                var team3 = groupC.last!
                groupC.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                
                print(match1)
                print(match2)
                print(match3)
            }
            
        }else if myGroup == "D Grubu" {
            if groupD.contains(myTeam) {
               let index = groupD.firstIndex(of: myTeam)
               groupD.remove(at: index!)
               print(groupD)
                
                var team1 = groupD.last!
                groupD.removeLast()
                var team2 = groupD.last!
                groupD.removeLast()
                var team3 = groupD.last!
                groupD.removeLast()
                
                match1 = "\(myTeam) Vs \(team1)"
                match2 = "\(myTeam) Vs \(team2)"
                match3 = "\(myTeam) Vs \(team3)"
                
                print(match1)
                print(match2)
                print(match3)
                
            }
            
        }
        
    }
    
    func makeAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(button)
        self.present(alert, animated: true)
    }
    
    
}
