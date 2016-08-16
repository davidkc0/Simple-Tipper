//
//  ViewController.swift
//  Tip Calculator
//
//  Created by David Ciaffoni on 6/21/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var txtTipPercent: UITextField!
    @IBOutlet weak var lbTotalAmount: UILabel!
    @IBOutlet weak var lbTipAmount: UILabel!
    @IBOutlet var btButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        txtTipPercent.tag = 100
        
    }
    
    
    
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func btPress(sender: AnyObject)
    {
        if txtBillAmount.editing == true || txtTipPercent.editing == true
        {
            txtBillAmount.resignFirstResponder()
            txtTipPercent.resignFirstResponder()
            
            if txtBillAmount.text != "" && txtTipPercent.text != ""
            {
                let billAmount = Double (txtBillAmount.text!)
                let tipPercent = Double(txtTipPercent.text!)
                let tipAmount = billAmount! * tipPercent!/100
                let totalPay = tipAmount + billAmount!
                
                
                let formatedTotalPay = round(totalPay * 100)/100
                let formatedTipAmount = round(tipAmount * 100)/100
                
                self.view.addSubview(lbTipAmount)
                self.view.addSubview(lbTotalAmount)
                self.lbTipAmount.alpha = 0
                self.lbTotalAmount.alpha = 0
                
                lbTipAmount.text = String(format: "$%.2f", tipAmount)
                lbTipAmount.text = String(format: "$%.2f", billAmount!)
                
                lbTotalAmount.text = ("total: $\(formatedTotalPay)")
                lbTipAmount.text = ("tip: $\(formatedTipAmount)")
                
                
                UIView.animateWithDuration(1.5, animations: {
                    self.lbTipAmount.alpha = 1.0
                    self.lbTotalAmount.alpha = 1.0
                    
                })
                
                dismissKeyboard()
            }
        }
    }
}

extension ViewController: UITextFieldDelegate
{
    func textFieldShouldEndEditing(textField: UITextField) -> Bool
    {
        if textField.text != "" && textField.tag == 100 && txtBillAmount.text != ""
        {
            btPress(self)
        }
        
        return true
    }
}










