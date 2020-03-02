//
//  AES256Manager.swift
//  AES256Test
//
//  Created by Jeonggyu Park on 02/03/2020.
//  Copyright © 2020 Jeonggyu Park. All rights reserved.
//

import Foundation
import CryptoSwift

class AES256Manager {
    private static let SECRET_KEY = "1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2"
    private static let IV = "1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6"
    
    static func encrypt(string: String) -> String {
        guard !string.isEmpty else { return "" }
                
        return try! getAESObject().encrypt(string.bytes).toBase64() ?? ""
    }
    
    static func decrypt(encoded: String) -> String {
        let datas = Data(base64Encoded: encoded)
        
        guard datas != nil else {
            return ""
        }
        
        let bytes = datas!.bytes
        let decode = try! getAESObject().decrypt(bytes)
        
        return String(bytes: decode, encoding: .utf8) ?? ""
    }
    
    private static func getAESObject() -> AES{
        let keyDecodes : Array<UInt8> = SECRET_KEY.components(separatedBy: ",").map { return UInt8($0, radix: 16)! }
        let ivDecodes : Array<UInt8> = IV.components(separatedBy: ",").map{ return UInt8.init($0, radix: 16)! }
                                
        let aesObject = try! AES(key: keyDecodes, blockMode: CBC(iv: ivDecodes), padding: .pkcs5)
        
        return aesObject
    }
}



