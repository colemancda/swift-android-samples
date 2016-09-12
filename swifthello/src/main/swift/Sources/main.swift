
import java_swift
import Foundation
import Dispatch

// link back to Java side of Application
var responder: SwiftHello_ResponderForward!

// one-off call to bind the Java and Swift sections of app
@_silgen_name("Java_net_zhuoweizhang_swifthello_SwiftHello_bind")
public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
    // required when using Java from Dispatch
    DispatchGroup.threadCleanupCallback = JNI_DetachCurrentThread
    // This Swift instance forwards to Java through JNI
    responder = SwiftHello_ResponderForward( javaObject: __self )
    // This Swift instance receives native calls from Java
    return ListenerImpl().javaObject
}

class ListenerImpl: SwiftHello_ListenerBase {

    // incoming from Java
    override func processNumber( number: Double ) {
        // outgoing back to Java
        responder.processedNumber( number+42.0 )
    }

    // incoming from Java activity
    override func processText( text: String? ) {
        processText( text!, initial: true )
    }

    static var thread = 0

    func processText( _ text: String, initial: Bool ) {
        var out = [String]()
        for _ in 0..<10 {
            out.append( "Hello "+text+"!" )
        }
        let regexp = try! RegularExpression(pattern:"(\\w+)", options:[])
        let url = URL( string: "http://www.bbc.co.uk/news" )!
        do {
            NSLog( "Fetch" )
            let input = try NSString( contentsOf: url,
                                      encoding: String.Encoding.utf8.rawValue )
            NSLog( "Match" )
            for match in regexp.matches(in: String(describing: input), options: [],
                                        range: NSMakeRange(0,input.length) ) {
                                            out.append( ""+input.substring(with:match.range) )
            }
            NSLog( "Display" )
            // outgoing back to Java
            responder.processedText( out.joined(separator:", ") )
            NSLog( "Done" )
        }
        catch ( let e ) {
            responder.processedText( "Error" )
        }
        if initial {
            ListenerImpl.thread += 1
            let background = ListenerImpl.thread
            DispatchQueue.global().async {
                for i in 1..<10000 {
                    sleep(20)
                    // outgoing back to Java
                    responder.debug( "Process \(background)/\(i)" )
                    self.processText("World #\(i)", initial: false)
                }
            }
        }
    }
    
}
