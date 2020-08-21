//
//  BFApiManager.swift
//  Butterfly-CoreData
//
//  Created by Chris on 2020/8/21.
//  Copyright © 2020 Butterfly. All rights reserved.
//

import Foundation

protocol BFApiManagerDelegate {
    func didFetchDataSuccess(price: String, currency: String)
    func didFailWithError(error: Error)
}


struct BFApiManager {
    var delegate: BFApiManagerDelegate?
    
    func fetchData() {
        let baseURL = "https://my-json-server.typicode.com/butterfly-systems/sample-data/purchase_orders"
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                print("response=\(response)")
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        _ = String(format: "%.2f", bitcoinPrice)
//                        self.delegate?.didFetchDataSuccess(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> BFPurchaseOrder? {
        print("data=\(data)")
        return nil
    }
}
