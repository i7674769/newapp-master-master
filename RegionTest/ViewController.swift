//
//  ViewController.swift
//  RegionTest
//
//  Created by Rebecca Hughes (i7674769) on 26/10/2015.
//  Copyright © 2015 Rebecca Hughes (i7674769). All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON
import AudioToolbox


class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var alert: UIAlertController?
    
    var displayingInfo = false
    var memoryArray = buildMemories()
    
    var foundMemory: String?
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        for memory in memoryArray {
            locationManager.startMonitoringForRegion(memory.region)
        }
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destinationViewController as! DetailViewControler
            vc.delegate = self
            vc.memory = foundMemory
            
            
        }
    }
    
    

}

extension ViewController: DetailViewControlerDelegate {
    func stateChange() {
        displayingInfo = false
    }
}


extension ViewController: CLLocationManagerDelegate {
   
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        if !displayingInfo {
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            self.displayingInfo = true
            alert = UIAlertController(title: "New memeories found!", message: "You've unlocked '\(region.identifier)' ", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "View", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                self.foundMemory = region.identifier
                self.performSegueWithIdentifier("showDetail", sender: self)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (UIAlertAction) -> Void in
                self.displayingInfo = false
            }
            alert!.addAction(cancelAction)
            alert!.addAction(alertAction)
            presentViewController(alert!, animated: true, completion: nil)
        }


    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        if displayingInfo {
            alert?.dismissViewControllerAnimated(true, completion: nil)
            displayingInfo = false
        }
        
    }

}

