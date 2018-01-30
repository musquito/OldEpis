//package th.net.cat.epis.schedule;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//
//import org.apache.commons.net.ftp.FTP;
//import org.apache.commons.net.ftp.FTPClient;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//@Component
//public class ScheduleObjToJson {
//
//	@Value("${jdbc.epis.driver}")
//	String jdbcEpisDriver;
//	@Value("${ftp.upload.ip}")
//	String ftpIp;
//	@Value("${ftp.upload.port}")
//	String ftpPort;
//	@Value("${ftp.upload.user}")
//	String ftpUser;
//	@Value("${ftp.upload.pass}")
//	String ftpPass;
//	@Value("${ftp.upload.path}")
//	String ftpPath;
//
////	@Scheduled(fixedRate = 5000)
//	// @Scheduled(initialDelay=20000, fixedRate=5000)
//	// @Scheduled(cron="*0/5 * * * * *")
//	public void printMessage() {
//		System.out.println("scheuld file upload");
//		int status = -1;
//		String[] fileList = getFileList();
//		if (fileList != null) {
//			status = getFtpUpload(fileList);
//		}
//
//		if (status == 0) {
//
//		} else if (status == -1) {
//
//		} else if (status == 1) {
//			System.out.println("error  upload");
//		} else if (status == 2) {
//			System.out.println("error  ftp connection or upload");
//
//		} else if (status == 3) {
//			System.out.println("error  ftp close connection");
//
//		}
//		System.out.println("end schedule");
//	}
//
//	public String[] getFileList() {
//
//		String[] fileList = null;
//		String resourceFolder = "reportData/";
//		try {
//
//			ClassLoader classLoader = getClass().getClassLoader();
//			File folder = new File(classLoader.getResource(resourceFolder).getPath());
//			System.out.println("resource :" + classLoader.getResource(resourceFolder).getPath());
//			StringBuilder filename = new StringBuilder("");
//			File[] listOfFiles = folder.listFiles();
//
//			fileList = new String[listOfFiles.length];
//
//			for (int i = 0; i < listOfFiles.length; i++) {
//
//				System.out.println("File " + listOfFiles[i].getName());
//				if (listOfFiles[i].isFile()) {
//					fileList[i] = classLoader.getResource(resourceFolder).getPath() + listOfFiles[i].getName();
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return fileList;
//	}
//
//	public int getFtpUpload(String[] fileName) {
//
//		FTPClient ftpClient = new FTPClient();
//		InputStream inputStream = null;
//		int status = 1;
//		if (fileName.length > 0)
//			try {
//
//				ftpClient.connect(ftpIp, Integer.valueOf(ftpPort));
//				ftpClient.login(ftpUser, ftpPass);
//				ftpClient.enterLocalPassiveMode();
//
//				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
//				boolean done = false;
//
//				// APPROACH #1: uploads first file using an InputStream
//
//				System.out.println("start upload");
//				for (int i = 0; i < fileName.length; i++) {
//
//					File firstLocalFile = new File(fileName[i]);
//					// String firstRemoteFile = "Projects.zip";
//					inputStream = new FileInputStream(firstLocalFile);
//
//					System.out.println("fileName" + firstLocalFile.getName());
//
//					// server path , file inputstrea
//
//					if (firstLocalFile.exists()) {
//						done = ftpClient.storeFile(ftpPath + firstLocalFile.getName(), inputStream);
//						System.out.println("upload status " + done);
//						if (done) {
//							inputStream.close();
//
//							if (firstLocalFile.delete()) {
//								System.out.println(firstLocalFile.getName() + " delete success");
//							} else {
//								System.out.println("Delete failed.");
//							}
//
//						}
//					}
//				}
//
//				System.out.println("end upload");
//
//			} catch (IOException ex) {
//				System.out.println("Error: " + ex.getMessage());
//				ex.printStackTrace();
//				status = 2;
//			} finally {
//				try {
//					if (inputStream != null)
//						inputStream.close();
//					if (ftpClient.isConnected()) {
//
//						System.out.println("close ftp");
//						ftpClient.logout();
//						ftpClient.disconnect();
//						status = 0;
//					}
//				} catch (IOException ex) {
//					System.out.println("close ftp");
//					ex.printStackTrace();
//					status = 3;
//				}
//			}
//		return status;
//	}
//}
