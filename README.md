# iOS-Generic-Datasource (WIP)
Light weight generic datasource that fits in every project

- Generic networking datasource using URLSession and URLRequest.
  - `await/async` method:
  ```
  func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) async throws -> Q
  ```
  - Combine method:
  ```
  func request<T, Q>(with session: URLSession, resource: Resource<T, Q>) -> AnyPublisher<Q, Error>
  ```
  
  ...
