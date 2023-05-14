//
//  Control.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 15.04.2023.
//

import Foundation

class Controls {
    
    static let sharedControls = Controls()
    
    var isSelectTeam = false
    
    
    
    var match1Enable = true
    var match2Enable = false
    var match3Enable = false
    
    var quarterFinal = false
    
    init(){}
    
}

class ControlsMyTeam {
    
    static let sharedControlsMyTeam = ControlsMyTeam()
    
    var finalAttack = 0.0
    var finalDefense = 0.0
    
}

class ControlGrupPointsAndAverages {
    
    static let sharedControlPoinsAndAverages = ControlGrupPointsAndAverages()
    
    ///Puanlar için
    var myTeanPoints = 0
    var team1Points = 0 //Match1 == Team1 == 4.sıradaki takım
    var team2Points = 0
    var team3Points = 0
    
    ///Averaj için
    var MyteamAverages = 0
    var team1Averages = 0
    var team2Averages = 0
    var team3Averages = 0
}
