package com.example.chiruza.smartlock;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.kosalgeek.genasync12.AsyncResponse;
import com.kosalgeek.genasync12.PostResponseAsyncTask;

public class Luces extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_luces);
        Button btn1 = (Button) findViewById(R.id.btn1);
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url1 = "http://luces.tunesources.com/php/apagarLuz1.php";
                PostResponseAsyncTask task1 = new PostResponseAsyncTask(Luces.this, new AsyncResponse() {
                    @Override
                    public void processFinish(String s) {
                        s = s.substring(0, 2);
                        Toast.makeText(Luces.this, s, Toast.LENGTH_LONG).show();

                    }
                });
                task1.execute(url1);
            }
        });
        Button btn2 = (Button) findViewById(R.id.btn2);
        btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url1 = "http://luces.tunesource.com/php/prenderLuz1.php";
                PostResponseAsyncTask task2 = new PostResponseAsyncTask(Luces.this, new AsyncResponse() {
                    @Override
                    public void processFinish(String s) {
                        s = s.substring(0, 2);
                        Toast.makeText(Luces.this, s, Toast.LENGTH_LONG).show();
                    }
                });
                task2.execute(url1);
            }
        });
        Button btn3 = (Button) findViewById(R.id.btn3);
        btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url1 = "http://luces.tunesource.com/php/prenderLuz2.php";
                PostResponseAsyncTask task2 = new PostResponseAsyncTask(Luces.this, new AsyncResponse() {
                    @Override
                    public void processFinish(String s) {
                        s = s.substring(0, 2);
                        Toast.makeText(Luces.this, s, Toast.LENGTH_LONG).show();
                    }
                });
                task2.execute(url1);
            }
        });
        Button btn4 = (Button) findViewById(R.id.btn4);
        btn4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url1 = "http://luces.tunesource.com/php/prenderLuz2.php";
                PostResponseAsyncTask task2 = new PostResponseAsyncTask(Luces.this, new AsyncResponse() {
                    @Override
                    public void processFinish(String s) {
                        s = s.substring(0, 2);
                        Toast.makeText(Luces.this, s, Toast.LENGTH_LONG).show();
                    }
                });
                task2.execute(url1);
            }
        });
    }
}
