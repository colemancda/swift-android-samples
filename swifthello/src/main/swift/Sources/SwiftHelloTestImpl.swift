
import java_swift
import Foundation

public class SwiftTestListener: SwiftHelloTest_TestListenerBase {

    override public func booleanMethod( arg0: Bool ) -> Bool {
        return arg0
    }

    override public func booleanArrayMethod( arg0: [Bool]? ) -> [Bool]? {
        return arg0
    }

    override public func boolean2dArrayMethod( arg0: [[Bool]]? ) -> [[Bool]]? {
        return arg0
    }

    override public func byteMethod( arg0: Int8 ) -> Int8 {
        return arg0
    }

    override public func byteArrayMethod( arg0: [Int8]? ) -> [Int8]? {
        return arg0
    }

    override public func byte2dArrayMethod( arg0: [[Int8]]? ) -> [[Int8]]? {
        return arg0
    }

    override public func charMethod( arg0: UInt16 ) -> UInt16 {
        return arg0
    }

    override public func charArrayMethod( arg0: [UInt16]? ) -> [UInt16]? {
        return arg0
    }

    override public func char2dArrayMethod( arg0: [[UInt16]]? ) -> [[UInt16]]? {
        return arg0
    }

    override public func shortMethod( arg0: Int16 ) -> Int16 {
        return arg0
    }

    override public func shortArrayMethod( arg0: [Int16]? ) -> [Int16]? {
        return arg0
    }

    override public func short2dArrayMethod( arg0: [[Int16]]? ) -> [[Int16]]? {
        return arg0
    }

    override public func intMethod( arg0: Int ) -> Int {
        return arg0
    }

    override public func intArrayMethod( arg0: [Int32]? ) -> [Int32]? {
        return arg0
    }

    override public func int2dArrayMethod( arg0: [[Int32]]? ) -> [[Int32]]? {
        return arg0
    }

    override public func longMethod( arg0: Int64 ) -> Int64 {
        return arg0
    }

    override public func longArrayMethod( arg0: [Int64]? ) -> [Int64]? {
        return arg0
    }

    override public func long2dArrayMethod( arg0: [[Int64]]? ) -> [[Int64]]? {
        return arg0
    }

    override public func floatMethod( arg0: Float ) -> Float {
        return arg0
    }

    override public func floatArrayMethod( arg0: [Float]? ) -> [Float]? {
        return arg0
    }

    override public func float2dArrayMethod( arg0: [[Float]]? ) -> [[Float]]? {
        return arg0
    }

    override public func doubleMethod( arg0: Double ) -> Double {
        return arg0
    }

    override public func doubleArrayMethod( arg0: [Double]? ) -> [Double]? {
        return arg0
    }

    override public func double2dArrayMethod( arg0: [[Double]]? ) -> [[Double]]? {
        return arg0
    }

    override public func StringMethod( arg0: String? ) -> String? {
        return arg0
    }

    override public func StringArrayMethod( arg0: [String]? ) -> [String]? {
        return arg0
    }

    override public func String2dArrayMethod( arg0: [[String]]? ) -> [[String]]? {
        return arg0
    }

}

public class SwiftTestResponder {

    static var tcount = 0

    public func respond( to responder: SwiftHelloTest_TestListener ) {
        SwiftTestResponder.tcount += 1
        NSLog("Testing \(SwiftTestResponder.tcount)...")

        if true {
            let reference: Bool = true
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.booleanMethod( reference )
            if response != reference {
                NSLog("Bool: \(response) != \(reference)")
            }
            let responseArray = responder.booleanArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Bool: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.boolean2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Int8 = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.byteMethod( reference )
            if response != reference {
                NSLog("Int8: \(response) != \(reference)")
            }
            let responseArray = responder.byteArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Int8: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.byte2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: UInt16 = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.charMethod( reference )
            if response != reference {
                NSLog("UInt16: \(response) != \(reference)")
            }
            let responseArray = responder.charArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("UInt16: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.char2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Int16 = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.shortMethod( reference )
            if response != reference {
                NSLog("Int16: \(response) != \(reference)")
            }
            let responseArray = responder.shortArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Int16: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.short2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Int = 123
            let referenceArray = [Int32(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.intMethod( reference )
            if response != reference {
                NSLog("Int: \(response) != \(reference)")
            }
            let responseArray = responder.intArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Int: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.int2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Int64 = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.longMethod( reference )
            if response != reference {
                NSLog("Int64: \(response) != \(reference)")
            }
            let responseArray = responder.longArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Int64: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.long2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Float = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.floatMethod( reference )
            if response != reference {
                NSLog("Float: \(response) != \(reference)")
            }
            let responseArray = responder.floatArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Float: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.float2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: Double = 123
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.doubleMethod( reference )
            if response != reference {
                NSLog("Double: \(response) != \(reference)")
            }
            let responseArray = responder.doubleArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("Double: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.double2dArrayMethod( reference2dArray )
        }

        if true {
            let reference: String = "123"
            let referenceArray = [(reference)]
            //let reference2dArray = [referenceArray]

            let response = responder.StringMethod( reference )
            if response != reference {
                NSLog("String: \(response) != \(reference)")
            }
            let responseArray = responder.StringArrayMethod( referenceArray )!
            if responseArray != referenceArray {
                NSLog("String: \(responseArray) != \(referenceArray)")
            }
            //_ = responder.String2dArrayMethod( reference2dArray )
        }

    }

}
