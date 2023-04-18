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


///Herkeste olan bonusAttack ve bonusDefense değerleri herkes için tamamen random gelecek
///Ancak tacticBonusPlan ve Attack versiyonu robotlar için random bizim için biz ne seçtiysek olmalı


class ManchesterCity {
    
    static let shared = ManchesterCity()
    
    let powerAttack = 86
    let powerMid = 86.0
    let powerDefense = 86
    
    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    //Burası henüz kullanılmıyor!
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    

    
    init(){}

}



class ManchesterUnited {
    
    static let shared = ManchesterUnited()
    
    let powerAttack = 80
    let powerMid = 83.0
    let powerDefense = 82
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
 
}

class Arsenal {
    
    static let shared = Arsenal()
    
    
    let powerAttack = 82
    let powerMid = 84.0
    let powerDefense = 80
    
    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    
    
    init(){}

    

}


class Tottenham {
    
    static let shared = Tottenham()
    
    let powerAttack = 84
    let powerMid = 81.0
    let powerDefense = 80
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
}


class Chelsea {
    
    static let shared = Chelsea()
    
    let powerAttack = 84
    let powerMid = 86.0
    let powerDefense = 84
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
    
}


class Liverpool {
    
    static let shared = Liverpool()
    
    let powerAttack = 84
    let powerMid = 82.0
    let powerDefense = 87
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    init(){}
    
}


class RealMadrid {
    
    static let shared = RealMadrid()
    
    let powerAttack = 85
    let powerMid = 85.0
    let powerDefense = 84
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    

    init(){}
}


class Barcelona {
    
    static let shared = Barcelona()
    
    let powerAttack = 84
    let powerMid = 85.0
    let powerDefense = 82
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)

    init(){}
}


class AtleticoMadrid {
    
    static let shared = AtleticoMadrid()
    
    let powerAttack = 82
    let powerMid = 82.0
    let powerDefense = 80
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
 
    init(){}
}


class Inter {
    
    static let shared = Inter()
    
    let powerAttack = 85
    let powerMid = 83.0
    let powerDefense = 83
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    init(){}

}

class Milan {
    
    static let shared = Milan()
    
    let powerAttack = 81
    let powerMid = 82.0
    let powerDefense = 79
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}

}

class Napoli {
    
    static let shared = Napoli()
    
    let powerAttack = 81
    let powerMid = 81.0
    let powerDefense = 80
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
  
}


class Juventus {
    
    static let shared = Juventus()
    
    let powerAttack = 84
    let powerMid = 81.0
    let powerDefense = 82
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    
    init(){}
}

class PSG {
    
    static let shared = PSG()
    
    let powerAttack = 88
    let powerMid = 82.0
    let powerDefense = 83
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
    
}

class BorussiaDortmund {
    
    static let shared = BorussiaDortmund()
    
    let powerAttack = 80
    let powerMid = 81.0
    let powerDefense = 80
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
    
    init(){}
  
}

class BayernMünchen {
    
    static let shared = BayernMünchen()
    
    let powerAttack = 89
    let powerMid = 85.0
    let powerDefense = 82
  

    var bonusAttack = Int.random(in: -10...10)
    var bonusDefense = Int.random(in: -10...10)
  
    var tacticsBonusAttack = Int.random(in: 0...20)
    var tacticsBonusPlan = Int.random(in: 0...5)
 
    init(){}
}




