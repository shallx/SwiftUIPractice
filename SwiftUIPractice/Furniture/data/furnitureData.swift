import Foundation

struct Furniture: Identifiable, Hashable {
    var id : Int
    var image : String
    var title : String
    var price : String
}

// 2D array For Grid FUnction....

var furnitures = [
    [
    Furniture(id: 0, image: "r11", title: "Wood Frame", price: "$1200"),
    Furniture(id: 1, image: "r12", title: "Yellow Armchair", price: "$600"),
    ],
    
    [
    Furniture(id: 2, image: "r21", title: "Modern Armchair", price: "$240"),
    Furniture(id: 3, image: "r22", title: "IKEA Ingolf", price: "$1500")
    ],
    
    [
    Furniture(id: 4, image: "r31", title: "Yellow Wheel", price: "$2200"),
    Furniture(id: 5, image: "r32", title: "Scandinavin", price: "$1650")
    ]
]
