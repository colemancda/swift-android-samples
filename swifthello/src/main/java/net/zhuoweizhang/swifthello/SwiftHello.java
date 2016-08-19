package net.zhuoweizhang.swifthello;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

import com.jh.SwiftHelloListener;
import com.jh.SwiftHelloResponder;

public class SwiftHello extends Activity implements SwiftHelloResponder
{
	static SwiftHelloListener listener;

	/** Called when the activity is first created. */
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		loadNativeDependencies();
		listener = bind( this );		
		listener.processText("World");
	}

	public void processedNumber( double number ) {
		TextView myText = (TextView) findViewById(R.id.mytext);
		myText.setText("Result of swift return42() function is "+ number);
	}

	public void processedText( String text ) {
		TextView myText = (TextView) findViewById(R.id.mytext);
		myText.setText("Processed text: "+ text);
	}

	private static void loadNativeDependencies() {
		// Load libraries
		// Libc++
		//System.loadLibrary("c++_shared");
		// Libicu
		//System.loadLibrary("icudata");
		//System.loadLibrary("icui18n");
		//System.loadLibrary("icuuc");
		// Swift
		//System.loadLibrary("swiftCore");
		//System.loadLibrary("swiftGlibc");
		// Our library
		System.loadLibrary("swifthello");
	}

	/** Implemented in swiftproject/Source/main.swift. */

	native SwiftHelloListener bind( SwiftHelloResponder self );
}
