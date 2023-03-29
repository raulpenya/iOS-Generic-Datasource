# iOS-Generic-Datasource
Light weight generic datasource that fits in every project. 

## GenericNetworkingDataSource
The GenericNetworkingDataSource is an interface that helps you to make networking requests and to handle every network error or decoding error. 
It offers the possibility of make a request using `await/async` or `Combine` (so far). These methods are implemented using URLSession and URLRequest:
  - `await/async` method:
  ```
  func request<T, Q>(with session: Session, resource: Resource<T, Q>?) async throws -> Q
  ```
  - `Combine` method:
  ```
  func request<T, Q>(with session: Session, resource: Resource<T, Q>?) -> AnyPublisher<Q, Error>
  ```
  
This methods receive as a parameter `Session`, which is a protocol implemented by `URLSession`:
```
protocol Session {
    typealias RequestResponse = URLSession.DataTaskPublisher.Output
    func data(for url: URLRequest) async throws -> (Data, URLResponse)
    func executeTaskPublisher(for request: URLRequest) -> AnyPublisher<RequestResponse, URLError>
}

extension URLSession: Session {
    func data(for url: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: url, delegate: nil)
    }
    func executeTaskPublisher(for request: URLRequest) -> AnyPublisher<RequestResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
```
And a struct called `Resource`:
```
struct Resource<T: Decodable, Q> {
    let request: URLRequest
    let transform: (T) -> Q
}
```
This struct defines the generic parameters T & G. 
T is the type of the value to decode, so it has to implement Decodable. 
Q is the type of the value that the method will return after execute `transform` closure. 
The `transform` closure gives the flexibility to process the data received from the request and return a finest entity.
It has also the `URLRequest` that the method has to execute.


### Helpers
This project also provides some protocols and enums to help with the implementation of the URLRequest.

#### Api
The `Api` protocol is an interface to easily implement custom URLRequests.
```
protocol Api {
    var method: HTTPMethod { get }
    var url: String { get }
    var headerParams: [String: Any] { get }
    var bodyParams: Any { get }
    var useCache: Bool { get }
    func asURLRequest() throws -> URLRequest
}
```
#### HTTPMethod
The `HTTPMethod` enum is an enumeration of the main HTTP methods supported by URLRequest.
```
enum HTTPMethod: String, Equatable, Hashable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
```
#### DataSourceErrors
The `DataSourceErrors` enum is an enumeration of the errors throw by the `GenericNetworkingDataSource`.
```
public enum DataSourceErrors: Int, Error {
    case networkingRequestError = -1
    case instanceException = 800
    case castHTTPURLResponseException = 801
    case requestException = 802
    case apiURLException = 803
    ...
}
```

## GenericCoreDataDataSource
(coming soon)
