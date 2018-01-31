package br.com.alura.owasp.retrofit;

import java.io.IOException;

import org.springframework.stereotype.Component;

@Component
public class GoogleWebClient {
    private static final String SECRET = "6LdCYkMUAAAAADkETjiQ7VQZun1wwyZDR3VQuK6O";

    public boolean verifica(String recaptcha) {
    	boolean success = false;
        try {
        	success = (new RetrofitInicializador())
        			.getGoogleService().enviaToken(SECRET, recaptcha)
        			.execute()
        			.body().isSuccess();			
		} catch (IOException e) {
			e.printStackTrace();
		}         
        return success;
    }
}
