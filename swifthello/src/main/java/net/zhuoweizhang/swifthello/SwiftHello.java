package net.zhuoweizhang.swifthello;

import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;
import android.widget.TextView;

import com.jh.SwiftHello.Listener;
import com.jh.SwiftHello.Responder;

public class SwiftHello extends Activity implements Responder {

    Listener listener;
    Handler mainHandler;

    /** Called when the activity is first created. */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        loadNativeDependencies();
        listener = bind( this );
        listener.processText("World");
        mainHandler = new Handler(SwiftApp.getContext().getMainLooper());
    }

    private static void loadNativeDependencies() {
        // Load libraries
        System.loadLibrary("swifthello");
    }

    /** Implemented in src/main/swift/Sources/main.swift */

    native Listener bind( Responder self );

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

    public void debug( String msg ) {
        System.out.println( "Swift: "+msg );
    }

}
