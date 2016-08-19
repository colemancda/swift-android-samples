
import java_swift

var responder: SwiftHelloResponderForward!

class ListenerImpl: SwiftHelloListenerBase {

	override func processNumber( number: Double ) {
		responder.processedNumber( number+42.0 )
	}

	override func processText( text: String? ) {
		var out = String()
		for _ in 0..<100 {
			out += "Hello "+text!+"! "
		}
		responder.processedText( out )
	}

}	

@_silgen_name("Java_net_zhuoweizhang_swifthello_SwiftHello_bind")
public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
	responder = SwiftHelloResponderForward( javaObject: __self )
	return ListenerImpl().javaObject
}

