import Foundation
import x3UI
import Alamofire

class DataController: NSObject {
    public static var userName: String?
    public static var password: String?
    override init() {
        
    }
    deinit {
        
    }
    public func alamofireSend<T: CustomDataResult>(_ url: String, method: String, params: CustomRequestParams, dataType: T.Type? = nil, completion: @escaping OnDataResult) -> Bool {
        var headers: HTTPHeaders = [
            "Accept": "application/json",
            "X-Key": Device.ID.data(using: String.Encoding.utf8)!.base64EncodedString()
        ]
        let _URL = "\(url)\(url.suffix(1) != "/" ? "/" : "")\(method)"
        if let _userName = DataController.userName, let _password = DataController.password {
            headers.add(HTTPHeader(name: "Authorization", value: "Basic \(String(format: "%@:%@", _userName, _password).data(using: String.Encoding.utf8)!.base64EncodedString())"))
        }
        let _data = TestRequestDataParams(method: method, params: params)

        guard let _encoded = (try? JSONEncoder().encode(_data)) else {
            completion(.errorText("JSON encode error".localized), nil)
            return false
        }
        if DEBUG_PRINT {
            print("SEND: \(_URL)\n\(String(data: _encoded, encoding: .utf8)!)")
        }
        AF.request(
            _URL,
            method: .post,
            parameters: _data,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .response { response in
            if DEBUG_PRINT {
                if let _data = response.data {
                    print("RESPONSE: \(_URL)\n\(String(data: _data, encoding: .utf8)!)")
                } else {
                    print("RESPONSE: \(_URL)\n\("Data empty".localized)")
                }
            }
            switch response.result {
            case .success:
                guard let _data = response.data else {
                    completion(DataResult.errorText("Data empty".localized), nil)
                    return
                }
                let _result: ResponseDataResult = try! JSONDecoder().decode(ResponseDataResult.self, from: _data)
                if _result.header.code >= 0 {
                    if let _json = try! JSONSerialization.jsonObject(with: _data, options: []) as? [String:AnyObject], let _body = _json["body"] as? NSDictionary, let _data = try? JSONSerialization.data(withJSONObject: _body) {
                        if let _ = dataType {
//                            let _data1 = T.init(data: _body)
//                            print(_data1)
//                            let _obj = try? JSONDecoder().decode(T.self, from: _data)
                            if let _obj = try? JSONDecoder().decode(T.self, from: _data) {
                                completion(DataResult.success, _obj)
                            } else {
                                completion(DataResult.errorText("Data empty".localized), nil)
                            }
                        } else {
                            completion(DataResult.success, _data)
                        }
                    } else {
                        completion(DataResult.errorText("Error data body".localized), nil)
                    }
                } else {
                    completion(DataResult.errorText(_result.header.message), nil)
                }
            case let .failure(error): completion(.errorText(error.localizedDescription), nil)
            }
        }
        return true
    }
}
