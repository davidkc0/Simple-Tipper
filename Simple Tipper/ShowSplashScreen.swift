//
//  ShowSplashScreen.swift
//  simple tip
//
//  Created by David Ciaffoni on 6/22/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        preformSelector(Selector("ShowNavController"), withObject: nil, afterDelay: 3 )
    }
    

    func showNavController() {
        preformSegueWithIdentifier("showSplashScreen", sender: self)
    }

}






