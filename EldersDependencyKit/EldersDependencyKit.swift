//
//  EldersDependencyKit.swift
//  EldersDependencyKit
//
//  Created by Svetlomir Zhelev on 8/8/23.
//

public protocol Injectable {}

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}

@propertyWrapper
public struct InjectByKey<T> {
    public var wrappedValue: T
    
    public init(key: String) {
        self.wrappedValue = DependencyContainer.resolve(key: key)
    }
}

public class DependencyContainer {
    
    private var dependencies = [String: AnyObject]()
    private static var shared = DependencyContainer()
    
    public static func register<T>(_ dependency: T) {
        
        shared.register(dependency)
    }
    
    public static func register<T>(_ dependency: T, key: String) {
        
        shared.register(dependency, key: key)
    }
    
    public static func resolve<T>() -> T {
        
        shared.resolve()
    }
    
    public static func resolve<T>(key: String) -> T {
        
        shared.resolve(key: key)
    }
    
    private func register<T>(_ dependency: T) {
        
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }
    
    private func register<T>(_ dependency: T, key: String) {
        
        dependencies[key] = dependency as AnyObject
    }
    
    public static func deregister<T>(_ dependency: T) {
        shared.deregister(dependency)
    }
    
    public static func deregister(key: String) {
        shared.deregister(key: key)
    }
    
    private func deregister<T>(_ dependency: T) {
        
        let key = String(describing: T.self)
        dependencies.removeValue(forKey: key)
    }
    
    private func deregister(key: String) {
        
        dependencies.removeValue(forKey: key)
    }
    
    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T
        
        assert(dependency != nil, "No dependency found")
        
        return dependency!
    }
    
    private func resolve<T>(key: String) -> T {
        let dependency = dependencies[key] as? T
        
        assert(dependency != nil, "No dependency found")
        
        return dependency!
    }
}

