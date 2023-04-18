//
//  Control.swift
//  Avrupa Kulüpler Kupası
//
//  Created by Melih Şişkular on 15.04.2023.
//

import Foundation

class Controls {
    
    static let sharedControls = Controls()
    
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
