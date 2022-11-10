package network;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TcpServer {
	public static void main(String[] args) throws Exception {

		int severPort=8765;
		int voc=0;
		int cons=0;
		int carsp=0;
		String clientMsg = "";

		try {
			// Creazione del socket sul server e ascolto sulla porta
			ServerSocket serverSocket = new ServerSocket(severPort);
			System.out.println("Server: in ascolto sulla porta " + severPort);
			
			// Attesa della connessione con il client
			Socket clientSocket = serverSocket.accept();
			
			// Create input and output streams to read/write data
			DataInputStream inStream = new DataInputStream(clientSocket.getInputStream());
			DataOutputStream outStream = new DataOutputStream(clientSocket.getOutputStream());
			
			// Scambio di dati tra client e server
			while(!clientMsg.equals("quit")) {
				//Lettura dato da stream di rete
				clientMsg = inStream.readUTF();
				System.out.println("Server: ricevuto messaggio " + clientMsg );
			
				voc=0;
				cons=0;
				carsp=0;
			
				System.out.println("La lunghezza del messaggio: " + clientMsg.length() + " caratteri");
				for(int i=0; i<clientMsg.length(); i++)
				{
					if(clientMsg.charAt(i)==('a')||clientMsg.charAt(i)==('e')||clientMsg.charAt(i)==('i')||clientMsg.charAt(i)==('o')||clientMsg.charAt(i)==('u'))
						voc++;
					else if(clientMsg.charAt(i)==('!')||clientMsg.charAt(i)==(' ')||clientMsg.charAt(i)==('?')||clientMsg.charAt(i)==(':')||clientMsg.charAt(i)==(';')||clientMsg.charAt(i)==(','))
						carsp++;
			
						else
							cons++;
				}
			
			
			
				System.out.println("\nServer: vocali " + voc);
				System.out.println("Server: consonanti " + cons);
				System.out.println("Server: caratteri speciali " + carsp);
			
				//Invio dati su stream di rete
				outStream.writeUTF("Echo from server : "         + clientMsg);
				outStream.flush();
				System.out.println("Server: invio messaggio "    + clientMsg );
			
				if(cons==voc)
				{
					System.out.println("Spegnimento del server in corso... ");
					clientMsg="quit";
				}
			}
			
			
			// Close resources
			serverSocket.close();
			clientSocket.close();
			inStream.close();
			outStream.close();
			
		} catch (Exception e) {
			System.out.println(e);
			}
			
	}
}
			
