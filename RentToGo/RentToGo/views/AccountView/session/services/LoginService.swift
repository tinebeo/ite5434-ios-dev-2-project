import Combine
import Foundation
import FirebaseAuth

protocol LoginService{

    func login(with credentials: LoginCredentials)->AnyPublisher<Void,Error>

}

final class LoginServiceImp:LoginService{
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error> {

        Deferred{
            Future{ Promise in
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email, password: credentials.password){ res,error in

                        if let err = error{

                            Promise(.failure(err))
                        }else{

                            Promise(.success(()))
                        }

                    }



            }

        }.receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }




}
