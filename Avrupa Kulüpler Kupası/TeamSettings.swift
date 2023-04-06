//
//  TeamSettings.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 6.04.2023.
//

import Foundation


//MARK: Bilinmesi Gereken Notlar
///Her takımın kendine göre en iyi olduğu bir oyun planı olacak
///Bu oyun planını Kullanıcı seçerse ekstra bonus kazancak atak,ortasaha,defansı için
///bu oyun planları güncel halini segment controlleddan alacağız sırası şöyle:
///3-4-3     value = 0
///3-5-2     value = 1
///4-4-2    value = 2
///4-3-3    value =3
///4-2-3-1  value = 4
///5-3-2    value = 5
///Kontrol işlemleri bu valueye göre yapılacak!
///
///Attacktan gelen değeri 5'e bölme sebebimiz value değeri 0-20 arası ben yüzdelik olarak bakmıştım!


//SEÇTİĞİM TAKIM NE İSE ONUN KENDİ SINIFI ÇAĞRILCAK!

class ManchesterCity {
    
    let powerAttack = 86
    let powerMid = 86
    let powerDefense = 86
    
    //Kullanıcı sliderdan seçtiği Attack değeri olacak!
    var tacticsBonusAttack : Int
    
    //Kullanıcının dizilişlerinde seçtiği plan olacak!
    var tacticsBonusPlan : Int
    
    
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 65/5 {
            //ekstra puan olsun sebebi: Kendine göre en iyi hücümAğırlığını seçti
            
            
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
            
            //ekstra puan olsun sebebi: Kendine göre en iyi dizilişi seçti
        
        //Eğer hiç bişi uyumlu değilse ekstra düşüş olabilir !
        }
    }
}



class ManchesterUnited {
    
    let powerAttack = 80
    let powerMid = 83
    let powerDefense = 82
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}

class Arsenal {
    
    let powerAttack = 82
    let powerMid = 84
    let powerDefense = 80
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 65/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}


class Tottenham {
    
    let powerAttack = 84
    let powerMid = 81
    let powerDefense = 80
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 55/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}


class Chelsea {
    let powerAttack = 84
    let powerMid = 86
    let powerDefense = 84
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 65/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 1{
     
        }
    }
}


class Liverpool {
    let powerAttack = 84
    let powerMid = 82
    let powerDefense = 87
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 55/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 3{
     
        }
    }
    
    
}


class RealMadrid {
    let powerAttack = 85
    let powerMid = 85
    let powerDefense = 84
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 3{
     
        }
    }
}


class Barcelona {
    let powerAttack = 84
    let powerMid = 85
    let powerDefense = 82
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
            
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 3{
            
        }
    }
}


class AtleticoMadrid {
    let powerAttack = 82
    let powerMid = 82
    let powerDefense = 80
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 40/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 5{
     
        }
    }
}


class Inter {
    let powerAttack = 85
    let powerMid = 83
    let powerDefense = 83
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 1{
     
        }
    }
}

class Milan {
    let powerAttack = 81
    let powerMid = 82
    let powerDefense = 79
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 50/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}

class Napoli {
    let powerAttack = 81
    let powerMid = 81
    let powerDefense = 80
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 3{
     
        }
    }
}


class Juventus {
    let powerAttack = 84
    let powerMid = 81
    let powerDefense = 82
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 60/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 1{
     
        }
    }
}

class PSG {
    let powerAttack = 88
    let powerMid = 82
    let powerDefense = 83
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 70/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 0{
     
        }
    }
}

class BorussiaDortmund {
    let powerAttack = 80
    let powerMid = 81
    let powerDefense = 80
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 50/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}

class BayernMünchen {
    let powerAttack = 89
    let powerMid = 85
    let powerDefense = 82
  

    var tacticsBonusAttack : Int
    var tacticsBonusPlan : Int
    
    init(tacticsBonusAttack: Int,tacticsBonusPlan: Int) {
        self.tacticsBonusAttack = tacticsBonusAttack
        if self.tacticsBonusAttack == 70/5 {
    
        }
        self.tacticsBonusPlan = tacticsBonusPlan
        if self.tacticsBonusPlan == 4{
     
        }
    }
}



