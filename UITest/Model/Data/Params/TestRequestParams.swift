import Foundation

// MARK: - ******* UserRequestParams *******
class TestRequestParams: CustomRequestParams {
    enum CodingKeys: String, CodingKey {
        case value1
        case value2
        case value3
    }
    private var _params: CustomRequestParams?

    var value1: String
    var value2: String
    var value3: String
    var params: CustomRequestParams? {
        get {
            return self.getParams()
        }
        set {
            self.setParams(newValue)
        }
    }
    init(value1: String, value2: String, value3: String) {
        self.value1 = value1
        self.value2 = value2
        self.value3 = value3
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.value1, forKey: .value1)
        try container.encode(self.value2, forKey: .value2)
        try container.encode(self.value3, forKey: .value3)
    }
    
    open func getParams() -> CustomRequestParams? {
        return self._params
    }
    open func setParams(_ newValue: CustomRequestParams?) {
        self._params = newValue
    }
}
// MARK: - ******* UserRequestData *******
class TestRequestDataParams: CustomRequestData {
    enum CodingKeys: String, CodingKey {
        case bundle = "bundleID"
        case device = "deviceId"
        case method
        case params
    }

    init(method: String, params: CustomRequestParams?) {
        super.init(method: method)
        self.params = params
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.bundleID, forKey: .bundle)
        try container.encode(self.deviceId, forKey: .device)
        try container.encode(self.method, forKey: .method)
        try container.encode(self.getParams(TestRequestParams.self), forKey: .params)
    }
}
