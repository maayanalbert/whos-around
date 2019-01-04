//
//  AppDelegate.swift
//  whos-around
//
//  Created by Maayan Albert on 1/3/19.
//  Copyright © 2019 Maayan Albert. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  static let geoCoder = CLGeocoder()
  let locationManager = CLLocationManager()
  let username = "malbert"
  let viewController = ViewController()
  
  /* Create a region centered on desired location,
   choose a radius for the region (in meters)
   choose a unique identifier for that region */
  let geofenceRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(37.33233141, -122.0312186),
                                        radius: 100,
                                        identifier: "Studio")
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    locationManager.requestAlwaysAuthorization()
    
    /////////////////////////////////////
    
    // Your coordinates go here (lat, lon)
    let geofenceRegionCenter = CLLocationCoordinate2DMake(37.3228276, -122.0327804)
    
    /* Create a region centered on desired location,
     choose a radius for the region (in meters)
     choose a unique identifier for that region */
    let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter,
                                          radius: 0.5,
                                          identifier: "Studio")
    
    geofenceRegion.notifyOnEntry = true
    geofenceRegion.notifyOnExit = true
    
    
    locationManager.startMonitoring(for: geofenceRegion)
    locationManager.delegate = self
    
    ////////////////////////////////////////
    
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

extension AppDelegate: CLLocationManagerDelegate {
  // called when user Exits a monitored region
  func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
    if region is CLCircularRegion {
      // Do what you want if this information
      self.handleExitEvent(forRegion: region)
    }
  }
  
  // called when user Enters a monitored region
  func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
    if region is CLCircularRegion {
      // Do what you want if this information
      self.handleEnterEvent(forRegion: region)
    }
  }
  
  func handleExitEvent(forRegion region: CLRegion!) {
//    let message = username + " isn't in " + region.identifier
    print("exited")
    print(NSDate().timeIntervalSince1970)
//    viewController.changeLocationStatusLabel(to: message)
  }
  
  func handleEnterEvent(forRegion region: CLRegion!){
//    let message = username + " is in " + region.identifier
    print("entered")
    print(NSDate().timeIntervalSince1970)
//    viewController.changeLocationStatusLabel(to: message)
  }
}
