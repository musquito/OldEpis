package th.net.cat.epis.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

public class FtpUtil {

	public int uploadJson(){
		BigDecimal vatRate = new BigDecimal(7);
		BigDecimal vatDivide = vatRate.add(new BigDecimal(100));
		BigDecimal data = new BigDecimal(7).divide(new BigDecimal(107) , 5, RoundingMode.HALF_UP);//.divide( vatDivide);// .add(new BigDecimal(7)));//.setScale(2, RoundingMode.HALF_UP)   ;
		//new BigDecimal(100).add(
		  String server = "10.36.10.16";
	        int port = 21;
	        String user = "epis_user";
	        String pass = "password021166615";
	        String path ="/home/epis_user/offline_data/";
	        FTPClient ftpClient = new FTPClient();
	        try {
	 
	            ftpClient.connect(server, port);
	            ftpClient.login(user, pass);
	            ftpClient.enterLocalPassiveMode();
	            
	            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
	 
	            // APPROACH #1: uploads first file using an InputStream
	            File firstLocalFile = new File("E:\\err.txt");
	 
	            //String firstRemoteFile = "Projects.zip";
	            InputStream inputStream = new FileInputStream(firstLocalFile);
	 
	            System.out.println("Start uploading first file");
	            //server path , file inputstrea
	            boolean done = ftpClient.storeFile("/home/epis_user/offline_data/inprocess/err.txt", inputStream);
	            inputStream.close();
	            if (done) {
	                System.out.println("The first file is uploaded successfully.");
	            }
	 
	        } catch (IOException ex) {
	            System.out.println("Error: " + ex.getMessage());
	            ex.printStackTrace();
	        } finally {
	            try {
	                if (ftpClient.isConnected()) {
	                	
	                	System.out.println("close ftp");
	                    ftpClient.logout();
	                    ftpClient.disconnect();
	                }
	            } catch (IOException ex) {
	            	System.out.println("close ftp");
	                ex.printStackTrace();
	            }
	        }
			return 0;
	}
}
