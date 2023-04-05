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
    
    ///Her bir cell'e tıklanınca segue işlemi olacak
    ///Karşıdaki Değerleri ile eşleşmesi için böyle kullanıyorum
    var selectTeamName = ""
    var selectTeamPower = ""
    var selectTeamLogo = UIImage()
    
  @IBOutlet var tableView: UITableView!
    
  //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.backButtonTitle = "Geri"
        
        
        ///Takım ismi, logo ve takım güçleri  için tableViewCellere bilgi buradan gelecek
        teamArray.append("Arsenal")
        teamPower.append("Atak: 82 - Orta Saha: 84 - Defans: 80")
        
        teamArray.append("Tottenham")
        teamPower.append("Atak: 84 - Orta Saha: 81 - Defans: 80")
        
        teamArray.append("Manchester City")
        teamPower.append("Atak: 86 - Orta Saha: 86 - Defans: 86")
        
        teamArray.append("Manchester United")
        teamPower.append("Atak: 80 - Orta Saha: 83 - Defans: 82")
        
        teamArray.append("Liverpool")
        teamPower.append("Atak: 84 - Orta Saha: 82 - Defans: 87")
        
        teamArray.append("Chelsea")
        teamPower.append("Atak: 84 - Orta Saha: 86  - Defans: 84 ")
        
        teamArray.append("Barcelona")
        teamPower.append("Atak: 84 - Orta Saha: 85 - Defans: 82")
        
        teamArray.append("Real Madrid")
        teamPower.append("Atak: 85 - Orta Saha: 85 - Defans: 84")
        
        teamArray.append("Atletico Madrid")
        teamPower.append("Atak: 82 - Orta Saha: 82 - Defans: 80")
        
        teamArray.append("PSG")
        teamPower.append("Atak: 88 - Orta Saha: 82 - Defans: 83")
        
        teamArray.append("Inter")
        teamPower.append("Atak: 85 - Orta Saha: 83 - Defans: 83")
        
        teamArray.append("Milan")
        teamPower.append("Atak: 81 - Orta Saha: 82 - Defans: 79")
        
        teamArray.append("Juventus")
        teamPower.append("Atak: 84 - Orta Saha: 81 - Defans: 82")
        
        teamArray.append("Napoli")
        teamPower.append("Atak: 81 - Orta Saha: 81 - Defans: 80")
        
        teamArray.append("Borussia Dortmund")
        teamPower.append("Atak: 82 - Orta Saha: 81 - Defans: 80")
        
        teamArray.append("Bayern München")
        teamPower.append("Atak: 89  - Orta Saha: 85 - Defans: 82")
        
        
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
        
        performSegue(withIdentifier: "toGame", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let destination = segue.destination as! GameViewController
            destination.choosenTeamName = selectTeamName
            destination.choosenTeamPower = selectTeamPower
            destination.choosenTeamLogo = selectTeamLogo
        }
    }
    
}
