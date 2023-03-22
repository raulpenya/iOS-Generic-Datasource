# iOS-Generic-Datasource
Light weight generic datasource that fits in every project. 

The GenericNetworkingDataSource is an interface that helps you to make networking requests and to handle every network error or decoding error. It offers the possibility of make a request using `await/async` or `Combine` (so far). These methods are implemented using URLSession and URLRequest:
  - `await/async` method:
  ```
  func request<T, Q>(with session: Session, resource: Resource<T, Q>?) async throws -> Q
  ```
  - `Combine` method:
  ```
  func request<T, Q>(with session: Session, resource: Resource<T, Q>?) -> AnyPublisher<Q, Error>
  ```
  
  ...
