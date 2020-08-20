//
//  BaseNavigationController.swift
//  SwiftUIKit
//
//  Created by Destiny on 2018/1/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController:UINavigationController{
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
         self.navigationBar.barTintColor = UIColor.white
    }
    
     
        func setupLayout() {
            
            guard let interactionGes = interactivePopGestureRecognizer else { return }
            guard let targetView = interactionGes.view else { return }
            guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else { return }
            guard let internalTarget = internalTargets.first?.value(forKey: "target") else { return }
            let action = Selector(("handleNavigationTransition:"))
            
            let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
            fullScreenGesture.delegate = self
            targetView.addGestureRecognizer(fullScreenGesture)
            interactionGes.isEnabled = false
        }
        // push 隐藏标签栏
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            if viewControllers.count > 0 { viewController.hidesBottomBarWhenPushed = true }
            super.pushViewController(viewController, animated: animated)
        }

    }
    extension BaseNavigationController: UIGestureRecognizerDelegate {
        
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
            guard let ges = gestureRecognizer as? UIPanGestureRecognizer else { return true }
            if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
                || disablePopGesture {
                return false
            }
            return viewControllers.count != 1;
        }
}

extension BaseNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
}

// 枚举
enum LBUNavigationBarStyle {
    case theme
    case clear
    case white
}

extension UINavigationController {
    
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style: LBUNavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
        }
        
        
    }
}


