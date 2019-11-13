package com.example.parking3;

import android.os.AsyncTask;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.Buffer;

public class fetchData extends AsyncTask<Void, Void, Void> {
    String data = "";

    @Override
    protected Void doInBackground(Void... voids) {//background thread

        try {
            URL url = new URL("https://api.myjson.com/bins/edena");

            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            //now we need to create a buffer reader to read from the input stream(url.open...)
            InputStream inputStream = httpURLConnection.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

            String line = "";
            while (line != null)
            {
                line = bufferedReader.readLine(); //reads each line of the json file
                data +=  line;
            }


        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void onPostExecute(Void aVoid) {//UI thread
        super.onPostExecute(aVoid);

        MainActivity.data.setText(this.data);


    }


}

