//
//  AppDelegate.swift
//  Calculator
//
//  Created by Clarette Terrasi on 20/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

// PASOS A SEGUIR:
// 1. Creo la UI con botones e imagenes, el valor de cada numero lo coloco en el tag
// 2. Creo las funciones que manejaran: numberClicked, operatorClicked, cuando presiono el igual. Las conecto con la UI (Aun no tienen contenido)
// 3. Creo enums para organizar el código: Uno para organizar las currentOperation (suma, resta, multiplicación y división), Otro para organizar el calcState (cuando voy a marcar un número, cuando he marcado un número)
// 4. Establezco un estado inicial para calcState y para currentOperation que serían .enteringNum y .nothing respectivamente (vacío). Creo variables para ello
// 5. Realizo la lógica de numberClicked. Necesito crear una nueva función updateDisplay que se ejecutará en numberClicked y se encarga de controlar lo numeros que presiono
// 6. Realizo la lógica de operatorClicked. Establezco un calcState inicial en el que ya he marcado un número. Establezco un switch-case donde hago switch sobre el sender.tag (el tag asignado en 1. a cada boton de la UI), y cada case representa un operador de los almacenados en currentOperation (enum)
// 7. Realizo la lógica de equalsClicked. Aseguro que si no tengo valores, retorna nada. Realizo una lógica para cada operación en la que convierto los valores de String a Double para poder realizar operaciones con ellos

//TO-DO
// [X] Solucionar el bug de pintado de datos (se duplica el firstValue)
// [ ] Agregar funcionalidad de decimales
// [ ] Agregar paréntesis
// [ ] Agregar opción de borrar dígitos
// [ ] Agregar opción de eliminar operación completa
// [X] Github

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

