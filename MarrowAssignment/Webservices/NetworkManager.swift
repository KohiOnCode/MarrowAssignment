//
//  NetworkManager.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

final class Webservices{
    
    static let shared = Webservices()
    
    private init(){
        
    }
    
    // MARK: Fetch_API_Common_Method
    
    func fetchAPI<T:Codable>(_APIurl : String?, resultType : T.Type, completionHandler : @escaping (_ result : T)->Void) {
        guard let validUrl = _APIurl else {return}
        var request = URLRequest(url: URL(string: validUrl)!)
        print(validUrl)
        URLSession.shared.dataTask(with: request) { responseData, responseUrl, responseError in
            guard let data = responseData, responseError == nil else{
                print("Something went wrong")
                return
            }
            do{
                let result = try? JSONDecoder().decode(T.self, from: data)
                guard let finalresult = result else {return}
                completionHandler(finalresult)
            }
            catch{
                debugPrint(error)
            }
        }.resume()
    }
    
}
