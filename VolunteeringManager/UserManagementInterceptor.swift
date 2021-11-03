//
//  UserManagementInterceptor.swift
//  VolunteeringManager
//
//  Created by Judy Guo on 10/21/21.
//

import Foundation

import Apollo

class UserManagementInterceptor: ApolloInterceptor {
    
    enum UserError: Error {
        case noUserLoggedIn
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
    
            Network.shared.apollo.fetch(query: LoginQuery(userName:userName , password:password)) { result in
                
              switch result {
              case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                  firstName = graphQLResult.data?.login?.firstName ?? "Wrong name"
                  lastName = graphQLResult.data?.login?.lastName ?? "Wrong name"
              case .failure(let error):
                print("Failure! Error: \(error)")
              }
            
        }
       
        // Call an async method to renew the token
       /* UserManager.shared.renewToken { [weak self] tokenRenewResult in
            guard let self = self else {
                return
            }
            
            switch tokenRenewResult {
            case .failure(let error):
                // Pass the token renewal error up the chain, and do
                // not proceed further. Note that you could also wrap this in a
                // `UserError` if you want.
                chain.handleErrorAsync(error,
                                       request: request,
                                       response: response,
                                       completion: completion)
            case .success(let token):
                // Renewing worked! Add the token and move on
                self.addTokenAndProceed(token,
                                        to: request,
                                        chain: chain,
                                        response: response,
                                        completion: completion)
            }

    }*/
        }
}
 
