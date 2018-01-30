package th.net.cat.epis.schedule;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.item.ItemProcessor;

public class FtpUpload implements ItemProcessor<Integer, Integer> {

    private static final Logger log = LoggerFactory.getLogger(FtpUpload.class);

    @Override
    public Integer process(final Integer data) throws Exception {
       
    	
    	System.out.println("scheuld file upload");
		int status = -1;
		String[] fileList = new String[10];//getFileList();
		//if(fileList!= null){
			 status = getFtpUpload(fileList);
		//}
		
		
		if(status==0){
			
		}else if(status == -1){
			
		}else if(status == 1){
			System.out.println("error  upload");
		}else if(status == 2){
			System.out.println("error  ftp connection or upload");

		}else if(status == 3){
			System.out.println("error  ftp close connection");

		}
		return status;
		
    }
    
    public void printMessage() {
		System.out.println("scheuld file upload");
		int status = -1;
		String[] fileList = new String[10];//getFileList();
		//if(fileList!= null){
			 status = getFtpUpload(fileList);
		//}
		
		
		if(status==0){
			
		}else if(status == -1){
			
		}else if(status == 1){
			System.out.println("error  upload");
		}else if(status == 2){
			System.out.println("error  ftp connection or upload");

		}else if(status == 3){
			System.out.println("error  ftp close connection");

		}
		
	}
	
	public String[] getFileList(){
		
		String[] fileList = null;
		String resourceFolder = "reportData/";
		try{
			
			ClassLoader classLoader = getClass().getClassLoader();
			//File file = new File(classLoader.getResource("template/phoneTemplate.csv").getFile());
			File folder = new File(classLoader.getResource(resourceFolder).getPath());
			System.out.println("resource :"+classLoader.getResource(resourceFolder).getPath());
			StringBuilder filename = new StringBuilder("");
			File[] listOfFiles = folder.listFiles();
			int timer = 0;
			String flag = "0";
			int renameTime =10;
			StringBuilder ListFile = new StringBuilder("");
			fileList = new String[listOfFiles.length];
			//sort file
		/*	Arrays.sort(listOfFiles, (f1, f2) -> {
		         if (f1.isDirectory() && !f2.isDirectory()) {
		            return -1;
		         } else if (!f1.isDirectory() && f2.isDirectory()) {
		            return 1;
		         } else {
		            return f1.compareTo(f2);
		         }
		      });*/
			//Arrays.sort(listOfFiles, (f1, f2) -> f1.compareTo(f2));
			//find file name
			    for (int i = 0; i < listOfFiles.length; i++) {
			      
			    	System.out.println("File " + listOfFiles[i].getName());
			     if(listOfFiles[i].isFile() ){
			    	 
			    	 if(StringUtils.length(ListFile.toString()) > 0){
			    		 ListFile.append(",");
			    	 }
			    	 //ListFile.append(listOfFiles[i].getName());
			    	 fileList[i] = classLoader.getResource(resourceFolder).getPath()+listOfFiles[i].getName();
			     }
			      
			  }
			    
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return fileList;
	}
	public int getFtpUpload(String[] fileName){
		String server = "10.36.10.16";
        int port = 21;
        String user = "epis_user";
        String pass = "password021166615";
        String path ="/home/epis_user/offline_data/";
        String pathUpload = "/home/epis_user/offline_data/inprocess/";
        FTPClient ftpClient = new FTPClient();
        InputStream inputStream = null;
        int status = 1;
        String fileLocalHost = "err3.txt";
        if(fileName.length > 0)
        try {
 
            ftpClient.connect(server, port);
            ftpClient.login(user, pass);
            ftpClient.enterLocalPassiveMode();
            
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            boolean done = false;
            
            // APPROACH #1: uploads first file using an InputStream
            File firstLocalFile = new File("E:\\"+fileLocalHost);
           /* System.out.println("start upload");
            for(int i = 0;i<fileName.length;i++){
            	
            	File firstLocalFile = new File(fileName[i]);
	            //String firstRemoteFile = "Projects.zip";
*/	            inputStream = new FileInputStream(firstLocalFile);
	 
	            //System.out.println("fileName"+fileName[i]);
	            //server path , file inputstrea
            if(firstLocalFile.exists())
	            done = ftpClient.storeFile(pathUpload+fileLocalHost, inputStream);
	           // boolean done = ftpClient.storeFile("/home/epis_user/offline_data/inprocess/err.txt", inputStream);

	            System.out.println("upload status "+done);
/*	            if(done){
	            	
	            	File currentFile = new File(firstLocalFile.getPath(),fileName[i]);
	                boolean deletestatus = currentFile.delete();
		            System.out.println("delete status "+deletestatus);

	            }
            }
            */
            
            
            System.out.println("end upload");
 
        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
            status = 2;
        } finally {
            try {
            	if(inputStream!= null) inputStream.close();
                if (ftpClient.isConnected()) {
                	
                	System.out.println("close ftp");
                    ftpClient.logout();
                    ftpClient.disconnect();
                    status = 0;
                }
            } catch (IOException ex) {
            	System.out.println("close ftp");
                ex.printStackTrace();
                status = 3;
            }
        }
        return status;
	}

}
