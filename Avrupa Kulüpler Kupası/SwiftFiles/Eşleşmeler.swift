//
//  Eşleşmeler.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 10.04.2023.
//

import Foundation


class GroupStages {
    
    static let shared = GroupStages()
    
    var groupA = [String]()
    var groupB = [String]()
    var groupC = [String]()
    var groupD = [String]()
    
    var groupAfirstSecond = [String]()
    var groupBfirstSecond = [String]()
    var groupCfirstSecond = [String]()
    var groupDfirstSecond = [String]()
    
    init(){}
    
    
    
}


class QuarterFinals : GroupStages{
    
    var shared = GroupStages.shared
    
    static let shared2 = QuarterFinals()
    
    
    var matchQuarterFinal1 = "\(shared.groupAfirstSecond[0]) Vs \(shared.groupBfirstSecond[1])"
    
    var matchQuarterFinal2 = "\(shared.groupBfirstSecond[0]) Vs \(shared.groupAfirstSecond[1])"
    
    var matchQuarterFinal3 = "\(shared.groupCfirstSecond[0]) Vs \(shared.groupDfirstSecond[1])"
    
    var matchQuarterFinal4 = "\(shared.groupDfirstSecond[0]) Vs \(shared.groupDfirstSecond[1])"
    
    
    
    var match1Winner = [String]()
    var match2Winner = [String]()
    var match3Winner = [String]()
    var match4Winner = [String]()
    
}

class SemiFinals : QuarterFinals {
    
    var shared2 = QuarterFinals.shared2
    
    static let shared3 = SemiFinals()
    
    var matchSemiFinal1 = "\(shared2.match1Winner[0]) Vs \(shared2.match2Winner[0])"
    var matchSemiFinal2 = "\(shared2.match3Winner[0]) Vs \(shared2.match4Winner[0])"
    
    var matchSemiFinalWinner1 = [String]()
    var matchSemiFinalWinner2 = [String]()
    
    
}

class Final: SemiFinals {
    
    var shared3 = SemiFinals.shared3
    
    var matchFinal = "\(shared3.matchSemiFinalWinner1[0]) Vs \(shared3.matchSemiFinalWinner2[0])"
    
    var champion = ""
    
}

