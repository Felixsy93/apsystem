package db;

import java.io.BufferedReader; 
import java.io.DataOutputStream; 
import java.io.InputStreamReader; 
import java.net.HttpURLConnection; 
import java.net.URL; 
import javax.net.ssl.HttpsURLConnection; 

public class HttpConnection { 

	private final String USER_AGENT = "Visit_Interface"; 
	
	private String responseData = "";
	private String returnData = "";
	private BufferedReader br = null;
	private StringBuffer sb = null;

	public static void main(String[] args) throws Exception { 

	} 

	// HTTP GET request 
	public String sendGet(String targetUrl) throws Exception { 
		
		URL url = new URL(targetUrl); 
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		
		con.setRequestMethod("GET"); // optional default is GET
		con.setRequestProperty("User-Agent", USER_AGENT); // add request header 
		
		int responseCode = con.getResponseCode(); 
		
		//http 요청 후 응답 받은 데이터를 버퍼에 쌓는다
		br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));	
		sb = new StringBuffer();	       
		while ((responseData = br.readLine()) != null) {
			sb.append(responseData); //StringBuffer에 응답받은 데이터 순차적으로 저장 실시
		}
		returnData = sb.toString(); 
		
		// print result 
		//System.out.println("HTTP 응답 코드 : " + responseCode); 
		//System.out.println("return : " + returnData); 
		
		return returnData;
		
	} 


	// HTTP POST request 
	public String sendPost(String targetUrl, String parameters) throws Exception { 
		
		URL url = new URL(targetUrl); 
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
		con.setRequestMethod("POST"); // HTTP POST 메소드 설정 
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setDoOutput(true); // POST 파라미터 전달을 위한 설정 

		// Send post request 
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(parameters);
		wr.flush();
		wr.close(); 
		
		int responseCode = con.getResponseCode(); 

		//http 요청 후 응답 받은 데이터를 버퍼에 쌓는다
		br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));	
		sb = new StringBuffer();	       
		while ((responseData = br.readLine()) != null) {
			sb.append(responseData); //StringBuffer에 응답받은 데이터 순차적으로 저장 실시
		}
		returnData = sb.toString(); 
		
		// print result 
		//System.out.println("HTTP 응답 코드 : " + responseCode); 
		//System.out.println("return : " + returnData); 
		
		return returnData;
		
	}

}
