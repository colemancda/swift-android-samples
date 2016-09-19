package net.zhuoweizhang.swifthello;

import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;
import android.widget.TextView;

import com.jh.SwiftHello.Listener;
import com.jh.SwiftHello.Responder;
import com.jh.SwiftHelloTest.TestListener;
import com.jh.SwiftHelloTest.TestResponderImpl;

public class SwiftHello extends Activity implements Responder {

    static Listener listener;
    Handler mainHandler;

    private static void loadNativeDependencies() {
        // Load libraries
        System.loadLibrary("swifthello");
    }

    /** Called when the activity is first created. */
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        mainHandler = new Handler(SwiftApp.getContext().getMainLooper());
        setContentView(R.layout.main);
        loadNativeDependencies();
        listener = bind( this );
        //	for ( int i=0; i<1000 ; i++ )
        listener.processText("World");
    }

    public void processedNumber( double number ) {
        TextView myText = (TextView) findViewById(R.id.mytext);
        myText.setText("Result of swift return42() function is "+ number);
    }

    public void processedText( final String text ) {
        runOnUiThread( new Runnable() {
            public void run() {
                TextView myText = (TextView) findViewById(R.id.mytext);
                myText.setText("Processed text: "+text);
            }
        } );
    }

    public String [] debug( String msg ) {
        System.out.println( "Swift: "+msg );
        return new String [] {"!"+msg, msg+"!"};
    }

    public TestListener testResponder() {
        return new TestResponderImpl();
    }

    /** Implemented in swiftproject/Source/main.swift. */

    native Listener bind( Responder self );
}
