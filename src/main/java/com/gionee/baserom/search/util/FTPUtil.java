package com.gionee.baserom.search.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import sun.net.ftp.FtpClient;
import sun.net.ftp.FtpProtocolException;

public class FTPUtil {
	
	private static String host = "121.40.98.221";
	private static int port = 34543;
	private static String username="liuyb";
	private static String password="VwHx3/93c2";

	/**
	 * 连接FTP服务器
	 * @param url
	 * @param port
	 * @param username
	 * @param password
	 * @return
	 */
	public static FtpClient connectFTP(String host, int port, String username, String password) {  
        //创建ftp  
        FtpClient ftp = null;  
        try {  
            //创建地址  
            SocketAddress addr = new InetSocketAddress(host, port);  
            //连接  
            ftp = FtpClient.create();  
            ftp.connect(addr);  
            //登陆  
            ftp.login(username, password.toCharArray());  
            ftp.setBinaryType();  
        } catch (FtpProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return ftp;  
    }  
	
	/**
	 * 往FTP服务器上传文件
	 * @param localFile
	 * @param ftpFile
	 * @param ftp
	 */
	public static void upload(String localFile, String ftpFile, FtpClient ftp) {  
        OutputStream os = null;  
        FileInputStream fis = null;  
        try {  
            // 将ftp文件加入输出流中。输出到ftp上  
            os = ftp.putFileStream(ftpFile);  
            File file = new File(localFile);  
  
            // 创建一个缓冲区  
            fis = new FileInputStream(file);  
            byte[] bytes = new byte[1024];  
            int c;  
            while((c = fis.read(bytes)) != -1){  
                os.write(bytes, 0, c);  
            }  
        } catch (FtpProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                if(os!=null) {  
                    os.close();  
                }  
                if(fis!=null) {  
                    fis.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }
	
	/**
	 * 连接SFTP服务器
	 * @param host
	 * @param port
	 * @param username
	 * @param password
	 * @return
	 */
	public static ChannelSftp connetSftp(String host, int port, String username, String password){
		ChannelSftp sftp = null;
		try {
			JSch jsch = new JSch();
			//创建Session,并将用户名，主机地址，端口号放到session中
			Session sshSession = jsch.getSession(username,host,port);
			
			sshSession.setPassword(password);
			Properties sshConfig = new Properties();
			sshConfig.put("StrictHostKeyChecking", "no");
			sshSession.setConfig(sshConfig);
			
			sshSession.connect();
			Channel channel = sshSession.openChannel("sftp");
			channel.connect();
			
			sftp = (ChannelSftp) channel;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sftp;
	}
	
	/**
	* SFTP文件上传
	* @param directory  SFTP目录 /assets/image/search/test/
	* @param uploadFile  上传的文件
	* @param sftp SFTP连接对象
	*/
	public static void upload(String directory, String uploadFile, ChannelSftp sftp) {
		try {
			sftp.cd(directory);
			File file = new File(uploadFile);
			sftp.put(new FileInputStream(file), file.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	* SFTP文件上传
	* @param directory  SFTP目录 /assets/image/search/test/
	* @param stream  文件输入流
	* @param filename  文件名
	* @param sftp SFTP连接对象
	*/
	public static void uploadStream(String directory, FileInputStream stream, String filename,ChannelSftp sftp) {
		try {
			sftp.cd(directory);
			sftp.put(stream, filename);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ChannelSftp sftp = connetSftp(host,port,username,password);
		if(sftp!=null){
			System.out.println("成功连接SFTP服务器。");
			upload("/assets/image/search/test/","F:\\pic\\cat.jpg",sftp);
		}else{
			System.out.println("连接SFTP服务器失败......");
		}
	}
	
}
