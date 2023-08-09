//
//  EldersDependencyKit.swift
//  EldersDependencyKit
//
//  Created by Svetlomir Zhelev on 8/8/23.
//


public protocol Injectable {}

class DependencyContainer {
    
    private var dependencies = [String: AnyObject]()
    private static var shared = DependencyContainer()
    
    static func register<T>(_ dependency: T) {
        
        shared.register(dependency)
    }
    
    static func resolve<T>() -> T {
        
        shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }
    
    static func deregister<T>(_ dependency: T) {
        shared.deregister(dependency)
    }
    
    private func deregister<T>(_ dependency: T) {
        
        let key = String(describing: T.self)
        dependencies.removeValue(forKey: key)
    }
    
    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T
        
        assert(dependency != nil, "No dependency found")
        
        return dependency!
    }
}

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}

