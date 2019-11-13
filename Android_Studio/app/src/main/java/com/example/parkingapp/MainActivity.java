package com.example.parkingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


import org.w3c.dom.Text;

/*
            The clickme button fetches the data from the URL that holds the json
            maybe use this to w/ the creation of a virtual class to run different
            actions(functions in the main activity and then with thier own individual
            threads
 */


public class MainActivity extends AppCompatActivity {
    // Used to load the 'native-lib' library on application startup.
//    static {
//        System.loadLibrary("native-lib");
//    }
    Button click;
    public static TextView data;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        click = (Button) findViewById(R.id.clickme);
        data = (TextView) findViewById(R.id.fetcheddata);


        //now whenever a button(the button bellow "clickme" is clicked we want it to perform a task
        click.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {




                fetchData process = new fetchData();
                process.execute();
            }
        });


    }

    //public native String stringFromJNI();
}















//public class MainActivity extends AppCompatActivity {
//
//    // Used to load the 'native-lib' library on application startup.
//    static {
//        System.loadLibrary("native-lib");
//    }
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        // Example of a call to a native method
//        TextView tv = findViewById(R.id.sample_text);
//        tv.setText(stringFromJNI());
//    }
//
//    /**
//     * A native method that is implemented by the 'native-lib' native library,
//     * which is packaged with this application.
//     */
//    public native String stringFromJNI();
//}
