import UIKit

protocol ActionDelegate: AnyObject {
    func labelOption(label: String)
}

class Actions{
    weak var delegate: ActionDelegate?
    
//    func firstOption(){
//        if delegate == nil {
//            print("ta nil zzzzzzzz")
//        }
//        delegate?.labelOption(label: "Renan")
//    }
//    
//    func secondOption(){
//        delegate?.labelOption(label: "Chumiga")
//    }
    
    func thirdOption(){
        delegate?.labelOption(label: "Rafa")
    }
}
