////
////  Api server.swift
////  Formdata
////
////  Created by Admin on 02/11/23.
////

import Alamofire

func postmethod(){

        let baseURL = "https://www.app.sanreport.info/server/db_native.php"
        let queryParameters: [String: String] = [
            "divisionCode": "113,",
            "rSF": "MR8752",
            "axn": "table/list",
            "orderBy": "",
            "sfCode": "MR8752"
        ]
        let jsonData: [String: Any] = [
            "tableName": "mas_worktype",
            "coloumns": ["type_code as id", "Wtype as name", "Hlfdy_flag as Hlfdy_flag"],
            "today": "",
            "where": "['isnull(Active_flag,0)=0']",
            "or": "",
            "wt": "",
            "sfCode": "MR8752",
            "orderBy": "",
            "divisionCode": "113,"
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonData) {
            let headers: HTTPHeaders = [
                "Content-Type": "application/json" // Set the content type to JSON
            ]
            AF.request(baseURL, method: .post, parameters: queryParameters, encoding: JSONEncoding.default, headers: headers)
                .validate() // Optional: You can add validation as needed
                .responseJSON { response in
                    if let statusCode = response.response?.statusCode {
                        print("Status Code: \(statusCode)")
                    }

                    switch response.result {
                    case .success(let data):
                        if let validJSONData = data as? [String: Any] {
                            print("Response Data: \(validJSONData)")
                        } else {
                            print("Response does not contain valid JSON data.")
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
        } else {
            print("Error converting JSON data to Data")
        }


    }
