//
//  TeamSelectViewController.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 5.04.2023.
//

import UIKit

class TeamSelectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK: Tanımlar
    
    ///İçinde oynanacak takımlar bulunacak
    ///Bunlardan kendi takımımızı seçeceğiz
    ///TableView üzerinde gözükecek
    var teamArray = [String]()
    
    ///Takım Güçlerini daha doğru olması için Fifa23 üzerinden alıyorum
    var teamPower = [String]()
    
    ///Bu dizi takımın renklerini belli eder
    ///taktik diziliminde bu renkler ana tema rengi olacak!
    ///Her takım için biri ana renk olmak üzere 2 rengi olacak
    var teamColor = [[UIColor]]()
    

    
    ///Her bir cell'e tıklanınca segue işlemi olacak
    ///Karşıdaki Değerleri ile eşleşmesi için böyle kullanıyorum
    var selectTeamName = ""
    var selectTeamPower = ""
    var selectTeamLogo = UIImage()
    var selectTeamColor = [UIColor]()
    
  @IBOutlet var tableView: UITableView!
    
  //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.backButtonTitle = "Menü"
        
        

        
        ///Takım ismi, logo,renkleri ve takım güçleri  için tableViewCellere bilgi buradan gelecek
        teamArray.append("Arsenal")
        teamPower.append("Atak: 82 - Orta Saha: 84 - Defans: 80")
        teamColor.append([UIColor(red: 1, green: 0.1491002738, blue: 0, alpha: 1),UIColor(red: 0.003236678662, green: 0.07242403179, blue: 0.4763430357, alpha: 1)])
        print(teamColor)
        print(teamColor[0])
        print(teamColor[0][0])
       
        teamArray.append("Tottenham")
        teamPower.append("Atak: 84 - Orta Saha: 81 - Defans: 80")
        teamColor.append([UIColor(red: 0.0009294916526, green: 0.02323836647, blue: 0.2609384656, alpha: 1),UIColor(red: 0.8374214172, green: 0.8374213576, blue: 0.8374213576, alpha: 1)])
        
        teamArray.append("Manchester City")
        teamPower.append("Atak: 86 - Orta Saha: 86 - Defans: 86")
        teamColor.append([UIColor(red: 0.4620369673, green: 0.8382686973, blue: 1, alpha: 1),UIColor(red: 0, green: 0.5898008943, blue: 1, alpha: 1)])
        
        teamArray.append("Manchester United")
        teamPower.append("Atak: 80 - Orta Saha: 83 - Defans: 82")
        teamColor.append([UIColor(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1),UIColor(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)])
        
        teamArray.append("Liverpool")
        teamPower.append("Atak: 84 - Orta Saha: 82 - Defans: 87")
        teamColor.append([UIColor(red: 0, green: 0.9866140485, blue: 0.8378128409, alpha: 1),UIColor(red: 1, green: 0.3005654514, blue: 0.2565172613, alpha: 1)])
        
        teamArray.append("Chelsea")
        teamPower.append("Atak: 84 - Orta Saha: 86  - Defans: 84 ")
        teamColor.append([UIColor(red: 0.2668529749, green: 0.2017768025, blue: 1, alpha: 1),UIColor(red: 0, green: 0.488997221, blue: 0.8384560347, alpha: 1)])
        
        teamArray.append("Barcelona")
        teamPower.append("Atak: 84 - Orta Saha: 85 - Defans: 82")
        teamColor.append([UIColor(red: 1, green: 0.1491002738, blue: 0, alpha: 1),UIColor(red: 0.003236678662, green: 0.07242403179, blue: 0.4763430357, alpha: 1)])
               
        teamArray.append("Real Madrid")
        teamPower.append("Atak: 85 - Orta Saha: 85 - Defans: 84")
        teamColor.append([UIColor(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1),UIColor(red: 0.02641665242, green: 0.4087672354, blue: 0.7961984273, alpha: 1)])
        
        teamArray.append("Atletico Madrid")
        teamPower.append("Atak: 82 - Orta Saha: 82 - Defans: 80")
        teamColor.append([UIColor(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1),UIColor(red: 0.09890558571, green: 0.08981335908, blue: 0.6053970456, alpha: 1)])
        
        teamArray.append("PSG")
        teamPower.append("Atak: 88 - Orta Saha: 82 - Defans: 83")
        teamColor.append([UIColor(red: 0.006715274416, green: 0.1177108809, blue: 0.6651839614, alpha: 1),UIColor(red: 1, green: 0.1491314173, blue: 0, alpha: 1)])
        
        teamArray.append("Inter")
        teamPower.append("Atak: 85 - Orta Saha: 83 - Defans: 83")
        teamColor.append([UIColor(red: 0.2668529749, green: 0.2017768025, blue: 1, alpha: 1),UIColor(red: 0, green: 0, blue: 0, alpha: 1)])
        
        teamArray.append("Milan")
        teamPower.append("Atak: 81 - Orta Saha: 82 - Defans: 79")
        teamColor.append([UIColor(red: 1, green: 0.1491002738, blue: 0, alpha: 1),UIColor(red: 0, green: 0, blue: 0, alpha: 1)])
        
        teamArray.append("Juventus")
        teamPower.append("Atak: 84 - Orta Saha: 81 - Defans: 82")
        teamColor.append([UIColor(red: 0, green: 0, blue: 0, alpha: 1),UIColor(red: 0.8374214172, green: 0.8374213576, blue: 0.8374213576, alpha: 1)])
        
        teamArray.append("Napoli")
        teamPower.append("Atak: 81 - Orta Saha: 81 - Defans: 80")
        teamColor.append([UIColor(red: 0.2212652266, green: 0.836792171, blue: 1, alpha: 1),UIColor(red: 0, green: 0.3225597739, blue: 1, alpha: 1)])
        
        teamArray.append("Borussia Dortmund")
        teamPower.append("Atak: 82 - Orta Saha: 81 - Defans: 80")
        teamColor.append([UIColor(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1),UIColor(red: 0, green: 0, blue: 0, alpha: 1)])
        
        teamArray.append("Bayern München")
        teamPower.append("Atak: 89  - Orta Saha: 85 - Defans: 82")
        teamColor.append([UIColor(red: 1, green: 0.1491002738, blue: 0, alpha: 1),UIColor(red: 0.2547155321, green: 0.5019488335, blue: 1, alpha: 1)])
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.teamName.text = teamArray[indexPath.row]
        cell.teamImage.image = UIImage(named: teamArray[indexPath.row])
        cell.teamFeatures.text = teamPower[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        selectTeamName = teamArray[indexPath.row]
        selectTeamPower = teamPower[indexPath.row]
        selectTeamLogo = UIImage(named: teamArray[indexPath.row])!
        selectTeamColor = teamColor[indexPath.row] // iki elemanlı bir dizi geliyor
        
        
        performSegue(withIdentifier: "toGame", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let destination = segue.destination as! GameViewController
            destination.choosenTeamName = selectTeamName
            destination.choosenTeamPower = selectTeamPower
            destination.choosenTeamLogo = selectTeamLogo
            destination.choosenTeamColor = selectTeamColor
        }
    }
    
}
