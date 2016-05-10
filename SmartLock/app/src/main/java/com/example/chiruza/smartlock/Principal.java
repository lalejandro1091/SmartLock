package com.example.chiruza.smartlock;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Principal extends AppCompatActivity implements View.OnClickListener {
    Button btnpu, btnlu;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_principal);
        btnpu = (Button) findViewById(R.id.btnp);
        btnlu = (Button) findViewById(R.id.btnl);

        btnpu.setOnClickListener(this);
        btnlu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent nuevoform = new Intent(Principal.this, Luces.class);
                startActivity(nuevoform);
                finish();
            }
        });
    }

    @Override
    public void onClick(View v) {
        Intent nuevoform = new Intent(Principal.this, Navegador.class);
        startActivity(nuevoform);
        finish();
    }
}
