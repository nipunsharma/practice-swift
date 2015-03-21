//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Domenico on 21.03.15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController{
    
    override var happiness: Int{
        didSet{
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory: Int{
        get {}
        set {}
    }
    
    private struct History{
        static let SegueIdentifier = "Show Diagnostic History"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            switch identifier{
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController{
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
}