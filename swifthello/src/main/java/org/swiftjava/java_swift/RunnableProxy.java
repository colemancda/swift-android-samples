
/// generated by: genswift.java 'java/lang|java/util|java/sql|java/awt|javax/swing' ///

/// interface java.lang.Runnable ///

package org.swiftjava.java_swift;

@SuppressWarnings("JniMissingFunction")
public class RunnableProxy implements java.lang.Runnable {

    // address of proxy object
    long __swiftObject;

    RunnableProxy( long __swiftObject ) {
        this.__swiftObject = __swiftObject;
    }

    /// public abstract void java.lang.Runnable.run()

    public native void __run( long __swiftObject );

    public void run() {
        __run( __swiftObject  );
    }

    public native void __finalize( long __swiftObject );

    public void finalize() {
        __finalize( __swiftObject );
    }

}
