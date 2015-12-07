import UIKit
import MapKit
import CoreLocation

protocol DetailViewControlerDelegate {
    func stateChange()
}

class DetailViewControler: UIViewController {

    var delegate: DetailViewControlerDelegate?
    var memory: String!
    
    override func viewDidLoad() {
        print (memory)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.stateChange()
    }
    

}


