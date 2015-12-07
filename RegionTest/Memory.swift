import Foundation
import CoreLocation

class Memory {

    var memoryName: String!
    let location: CLLocationCoordinate2D!

    var region: CLCircularRegion {
        return CLCircularRegion(center: location, radius: 10, identifier: memoryName)
    }
    
    init(memoryName: String, location: CLLocationCoordinate2D) {
        self.memoryName = memoryName
        self.location = location
    }
    
}


func buildMemories() -> [Memory] {
    
    var memories = [Memory]()
    
    let memory1 = Memory(memoryName: "Bournemouth Pier", location: CLLocationCoordinate2D(latitude: 50.715608, longitude: -1.843059))
    memories.append(memory1)
    
    let memory2 = Memory(memoryName: "Boscombe precinct", location: CLLocationCoordinate2D(latitude: 50.726334, longitude: -1.840591))
    memories.append(memory2)
    
    let memory3 = Memory(memoryName: "Boscombe Garden", location: CLLocationCoordinate2D(latitude: 50.724704, longitude: -1.846492))
    memories.append(memory3)
    
    let memory4 = Memory(memoryName: "Boscombe Pier", location: CLLocationCoordinate2D(latitude: 50.719391, longitude: -1.843059))
    memories.append(memory4)
    
    let memory5 = Memory(memoryName: "East Overcliff", location: CLLocationCoordinate2D(latitude: 50.718609, longitude: -1.860096))
    memories.append(memory5)
    
    let memory6 = Memory(memoryName: "Art Museum", location: CLLocationCoordinate2D(latitude: 50.717545, longitude: -1.870633))
    memories.append(memory6)
    
    
    
    return memories
}



