package net.zhuoweizhang.swifthello;

import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;
import android.widget.TextView;
import android.content.Context;
import java.io.*;

import com.johnholdsworth.bindings.SwiftHelloBinding.Listener;
import com.johnholdsworth.bindings.SwiftHelloBinding.Responder;

import com.johnholdsworth.bindings.SwiftHelloTypes.TextListener;
import com.johnholdsworth.bindings.SwiftHelloTypes.ListenerMap;
import com.johnholdsworth.bindings.SwiftHelloTypes.ListenerMapList;

import com.johnholdsworth.bindings.SwiftHelloTest.TestListener;
import com.johnholdsworth.bindings.SwiftHelloTest.SwiftTestListener;

public class SwiftHello extends Activity implements Responder {

    static Listener listener;

    private static void loadNativeDependencies() {
        // Load libraries
        System.loadLibrary("swifthello");
    }

    /** Implemented in src/main/swift/Sources/main.swift */

    @SuppressWarnings("JniMissingFunction")
    native Listener bind( Responder self );

    /** Called when the activity is first created. */
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        loadNativeDependencies();
        listener = bind( this );
        Context context = SwiftApp.getApplication().getApplicationContext();
        String cacheDir = context.getCacheDir().getPath();
        String pemfile = cacheDir + "/cacert.pem";
        InputStream pemStream = SwiftApp.getApplication().getResources().openRawResource(R.raw.cacert);
        copyResource(pemStream, pemfile);
        listener.setCacheDir(cacheDir);
        TestListener tester = listener.testResponder(2);
        for ( int i=0; i<100 ; i++ ) {
            new SwiftTestListener().respond( tester );
        }
        listener.processText("World");
    }

    private void copyResource( InputStream in, String to ) {
        try {
            OutputStream out = new FileOutputStream( to );
            byte[] buffer = new byte[16*1024];
            int len;
            while ((len = in.read(buffer)) != -1)
                out.write(buffer, 0, len);
            out.close();
            in.close();
        }
        catch (IOException e) {
            e.printStackTrace();
            System.out.println(""+e);
        }
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

    public void processedTextListener(TextListener text) {
        processedText( text.getText() );
    }

    public void processedTextListenerArray(TextListener text[]) {
        processedText( text[0].getText() );
    }

    public void processedTextListener2dArray(TextListener text[][]) {
        processedText( text[0][0].getText() );
    }

    public void processMap(ListenerMap map) {
        listener.processedMap( map );
    }

    public void processMapList(ListenerMapList map) {
        listener.processedMapList( map );
    }

   public String [] debug( String msg ) {
        System.out.println( "Swift: "+msg );
        return new String [] {"!"+msg, msg+"!"};
    }

    public TestListener testResponder( int loopback ) {
        SwiftTestListener test = new SwiftTestListener();
        if ( loopback > 0 ) {
            test.loopback = listener.testResponder( loopback - 1 );
        }
        return test;
    }
}
