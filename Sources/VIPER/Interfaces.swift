//
//  Interfaces.swift
//  VIPER
//
//  Created by Tibor Bödecs on 2019. 05. 16..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

// MARK: - basic viper protocols

public protocol ModuleInterface {
    
}

public protocol RouterInterface: class {
    
}

public protocol PresenterInterface: class {
    
}

public protocol InteractorInterface: class {
    
}

public protocol ViewInterface: class {
    
}

public protocol EntityInterface {
    
}

// MARK: - "i/o" transitions

public protocol RouterPresenterInterface {
    
}

public protocol InteractorPresenterInterface {
    
}

public protocol PresenterRouterInterface {
    
}

public protocol PresenterInteractorInterface {
    
}

public protocol PresenterViewInterface {
    
}

public protocol ViewPresenterInterface {
    
}

// MARK: - generic interfaces

public protocol GenericRouterInterface: RouterInterface &
                                        RouterPresenterInterface {
    associatedtype PresenterRouter
    
    var presenter: PresenterRouter! { get set }
}

public protocol GenericInteractorInterface: InteractorInterface &
                                            InteractorPresenterInterface {
    associatedtype PresenterInteractor
    
    var presenter: PresenterInteractor! { get set }
}

public protocol GenericPresenterInterface: PresenterInterface &
                                           PresenterRouterInterface &
                                           PresenterInteractorInterface &
                                           PresenterViewInterface
{
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    associatedtype ViewPresenter
    
    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
    var view: ViewPresenter! { get set }
}

public protocol GenericViewInterface: ViewInterface &
                                      ViewPresenterInterface {
    associatedtype PresenterView
    
    var presenter: PresenterView! { get set }
}


public protocol GenericModuleInterface: ModuleInterface {
    associatedtype View where View: GenericViewInterface
    associatedtype Presenter where Presenter: GenericPresenterInterface
    associatedtype Router where Router: GenericRouterInterface
    associatedtype Interactor where Interactor: GenericInteractorInterface
    
    func compose(view: View, presenter: Presenter, router: Router, interactor: Interactor)
}

public extension GenericModuleInterface {

    /**
        Composes the VIPER module
     
        This method will set all the required pointers
     */
    func compose(view: View, presenter: Presenter, router: Router, interactor: Interactor) {
        view.presenter = (presenter as! Self.View.PresenterView)
        
        presenter.view = (view as! Self.Presenter.ViewPresenter)
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
