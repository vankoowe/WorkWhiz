//
//  SignUpViewModel.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 23.04.24.
//

import Combine
import Foundation

enum PasswordStrength {
    case veryWeak
    case weak
    case reasonable
    case strong
    case veryStrong
}

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var userName = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    @Published var isValid = false
    @Published var usernameMessage = ""
    @Published var passwordMessage = ""

    @MainActor
    var successfulRegister: Event?

    var signInSelected: Event?
    var goBack: Event

    private var cancellableSet: Set<AnyCancellable> = []

    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                input.count >= 3
            }
            .eraseToAnyPublisher()
    }

    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                password == ""
            }
            .eraseToAnyPublisher()
    }

    private var arePasswordEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $confirmPassword)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { password, confirmPassword in
                password == confirmPassword
            }
            .eraseToAnyPublisher()
    }

    private func calculatePasswordStrength(_ password: String) -> PasswordStrength {
        let passwordLength = password.count
        if passwordLength >= 8 {
            return .reasonable
        } else if passwordLength >= 6 {
            return .weak
        } else {
            return .veryWeak
        }
    }

    private var passwordStrengthPublisher: AnyPublisher<PasswordStrength, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                self.calculatePasswordStrength(input)
            }
            .eraseToAnyPublisher()
    }

    private var isPasswordStrongEnoughPublisher: AnyPublisher<Bool, Never> {
        passwordStrengthPublisher
            .map { strength in
                strength == .reasonable || strength == .strong || strength == .veryStrong
            }
            .eraseToAnyPublisher()
    }

    enum PasswordCheck {
        case valid
        case empty
        case noMatch
        case notStrongEnough
    }

    private var isPasswordValidPublisher: AnyPublisher<PasswordCheck, Never> {
        Publishers.CombineLatest3(isPasswordEmptyPublisher, arePasswordEqualPublisher, isPasswordStrongEnoughPublisher)
            .map { passwordIsEmpty, passwordsAreEqual, passwordIsStrongEnough in
                if passwordIsEmpty {
                    return .empty
                } else if !passwordsAreEqual {
                    return .noMatch
                } else if !passwordIsStrongEnough {
                    return .notStrongEnough
                } else {
                    return .valid
                }
            }
            .eraseToAnyPublisher()
    }

    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValidPublisher, isPasswordValidPublisher)
            .map { userNameIsValid, passwordIsValid in
                userNameIsValid && (passwordIsValid == .valid)
            }
            .eraseToAnyPublisher()
    }

    init(goBack: @escaping Event) {
        self.goBack = goBack

        isUsernameValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                valid ? "" : "User name must have at least 3 characters"
            }
            .assign(to: \.usernameMessage, on: self)
            .store(in: &cancellableSet)

        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .empty:
                    return "Password must not be empty"
                case .noMatch:
                    return "Passwords don't match"
                case .notStrongEnough:
                    return "Password not strong enough"
                default:
                    return ""
                }
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)

        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}
