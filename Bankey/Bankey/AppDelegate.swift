//
//  AppDelegate.swift
//  Bankey
//
//  Created by Eugenio Leal on 02/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let loginViewController = LoginViewController()
  let onboardingContainerViewController = OnboardingContainerViewController()
  let dummyViewController = DummyViewController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    loginViewController.delegate = self
    onboardingContainerViewController.delegate = self
    dummyViewController.logoutDelegate = self
    window?.rootViewController = loginViewController
    return true
  }
}

extension AppDelegate: LoginViewControllerDelegate {
  func didLogin() {
    print("foo - Did Login")
//    if LocalState.hasOnboarded {
//      setRootViewController(dummyViewController)
//    } else {
            setRootViewController(onboardingContainerViewController)
//    }
  }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
  func didFinishOnboarding() {
    print("foo - Did finish onboarding")
    LocalState.hasOnboarded = true
    setRootViewController(dummyViewController)
  }
  
}

extension AppDelegate: LogoutDelegate {
  func didLogout() {
    setRootViewController(loginViewController)
  }
}

extension AppDelegate { // smooth transition animation
  func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
      guard animated, let window = self.window else {
          self.window?.rootViewController = vc
          self.window?.makeKeyAndVisible()
          return
      }

      window.rootViewController = vc
      window.makeKeyAndVisible()
      UIView.transition(with: window,
                        duration: 0.3,
                        options: .transitionCrossDissolve,
                        animations: nil,
                        completion: nil)
  }
}
