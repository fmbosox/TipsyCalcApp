//
//  TipModel.swift
//  TipsyCalcApp
//
//  Created by Felipe Montoya on 10/1/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import Foundation

class tipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _totalBillPayers: Double = 1.0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _splitTotalAmount: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    var tipPercent: Double {
        get {
            return _tipPercent
        }
        set {
            _tipPercent = newValue
        }
    }
    
    var totalBillPayers: Double {
        get{
            return _totalBillPayers
        }
        set{
            _totalBillPayers = newValue
        }
    }
    
    var tipAmount: Double{
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var spliTotalAmount: Double {
        return _splitTotalAmount
    }
    
    init(billAmount: Double,tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    func calculateTip(){
        _tipAmount = billAmount * tipPercent
        _totalAmount = tipAmount + billAmount
        _splitTotalAmount = totalAmount/totalBillPayers
    }
    
    
}
