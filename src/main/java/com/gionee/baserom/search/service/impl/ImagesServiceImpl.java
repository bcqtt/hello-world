package com.gionee.baserom.search.service.impl;

import java.io.FileInputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.pojo.Images;
import com.gionee.baserom.search.pojo.ImagesExample;
import com.gionee.baserom.search.pojo.ImagesExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IImagesService;
import com.gionee.baserom.search.util.FTPUtil;
import com.gionee.baserom.search.util.HttpUtil;
import com.gionee.baserom.search.util.PropertiesUtils;
import com.gionee.baserom.search.util.StringHelper;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.SftpException;

@Service("imagesService")
public class ImagesServiceImpl implements IImagesService {
	private final Logger logger = LoggerFactory.getLogger(ImagesServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ImagesMapper imagesMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveImages(String resKey,String editType,MultipartFile[] images,int type) {
		int n=0;
		if(editType.equals("add")){
			String host = PropertiesUtils.getPropertieByKey("sftp_host");
			int port = Integer.parseInt(PropertiesUtils.getPropertieByKey("sftp_port"));
			String username = PropertiesUtils.getPropertieByKey("sftp_username");
			String password = PropertiesUtils.getPropertieByKey("sftp_password");
			String domain = PropertiesUtils.getPropertieByKey("sftp_domain");
			String directory = PropertiesUtils.getPropertieByKey("sftp_directory");
			
			ChannelSftp sftp = FTPUtil.connetSftp(host,port,username,password);
			for(int i = 0;i < images.length;i++){
	            if(!images[i].isEmpty()){  
	                try {
	                	String imgPath = "";
	                	String filename = "";
	                	FileInputStream stream = (FileInputStream) images[i].getInputStream();
	                	String newDirectory = "";
	                	if(!sftp.isClosed()){
	                		if(type==32){  //id为32的字典数据(导航)
	                			filename = StringHelper.getUUID() + "@" + images[i].getOriginalFilename();
	                			imgPath = domain+"icon/" +filename;
	                			newDirectory = directory + "icon/";
	                		}else{
	                			filename = StringHelper.getUUID() + "@" + images[i].getOriginalFilename()+"_640x300.jpg";
	                			imgPath = domain+"ad/" +filename;
	                			newDirectory = directory + "ad/";
	                		}
	                		FTPUtil.uploadStream(newDirectory, stream, filename, sftp);
	                		logger.info("上传文件---------->" + filename);
	                	}
	                	
	                	Images img = new Images();
	                	img.setImgPath(imgPath);
	                	img.setFileName(filename);
	                	img.setType(type); //字典类型:images_type
	                	img.setUploadDate(new Date());
	                	
	                	n += imagesMapper.insert(img);
	                	logger.info("保存图片信息-->" + imgPath);
	                } catch (Exception e) {  
	                	//日志中记录异常信息
	                	StringBuffer sb = new StringBuffer();  
	                    StackTraceElement[] stackArray = e.getStackTrace();  
	                    for (int m = 0; m < stackArray.length; n++) {  
	                        StackTraceElement element = stackArray[m];  
	                        sb.append(element.toString() + "\n");  
	                    }  
	                	logger.error("上传文件出错" + e.getMessage() + "\n" + sb.toString());
	                }  
	            }  
	        }
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		
		//刷新DNION缓存
		refreshDnionCache();
		
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}
	
	/**
	 * 刷新DNION缓存
	 */
	private void refreshDnionCache(){
		String dnion_api = PropertiesUtils.getPropertieByKey("dnion_api");
		String dnion_username = PropertiesUtils.getPropertieByKey("dnion_username");
		String dnion_password = PropertiesUtils.getPropertieByKey("dnion_password");
		String dnion_refresh_url = PropertiesUtils.getPropertieByKey("dnion_refresh_url");
		String dnion_url_type = PropertiesUtils.getPropertieByKey("dnion_url_type");
		String refresh_url = dnion_api+"?username=" + dnion_username + "&password=" + dnion_password 
				+ "&url=" + dnion_refresh_url + "&type=" + dnion_url_type;
		String result = HttpUtil.sendGet(refresh_url, "utf-8");
		
		logger.info("执行刷新-->" + refresh_url);
		logger.info("DNION缓存刷新情况-->" + result);
	}
	
	@Override
	public DwzAjaxObject saveImagesInfo(String resKey, String editType, Images images) {
		int n = this.imagesMapper.updateByPrimaryKey(images);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<Images> queryPage(Page<Images> page,int type) {
		ImagesExample example = new ImagesExample();
		Criteria criteria = example.createCriteria();
		if(type!=-1){
			criteria.andTypeEqualTo(type);
		}
		int totalCount = imagesMapper.countByExample(example);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		map.put("type", type);
		List<Images> list = imagesMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public Images selectByExample(Images images) {
		ImagesExample example = new ImagesExample();
		Criteria criteria = example.createCriteria();
		if(images.getId() != null){
			criteria.andIdEqualTo(images.getId());
		}
		List<Images> list = this.imagesMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(Images img) {
		return this.imagesMapper.updateByPrimaryKey(img);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteImages(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		
		String host = PropertiesUtils.getPropertieByKey("sftp_host");
		int port = Integer.parseInt(PropertiesUtils.getPropertieByKey("sftp_port"));
		String username = PropertiesUtils.getPropertieByKey("sftp_username");
		String password = PropertiesUtils.getPropertieByKey("sftp_password");
		String directory = PropertiesUtils.getPropertieByKey("sftp_directory");
		
		ChannelSftp sftp = FTPUtil.connetSftp(host,port,username,password);
		
		for(int i=0; i<idArray.length; i++ ){
			Images img = imagesMapper.selectByPrimaryKey(Integer.parseInt(idArray[i]));
			String imgName = img.getImgPath().substring(img.getImgPath().lastIndexOf("/")+1);
			if(img.getIsRef()!=null && img.getIsRef()==1){
				continue;
			}
			
			String newDirectory = "";
			if(img.getType()==32){  //id为32的字典数据
    			newDirectory = directory + "icon/";
    		}else{
    			newDirectory = directory + "ad/";
    		}
			try {
				sftp.cd(newDirectory);
				sftp.rm(imgName);
			} catch (SftpException e) {
				logger.error(e.getMessage());
				return new DwzAjaxObject("300", "操作失败！");
			}
			
			n += imagesMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		
		//刷新DNION缓存
		refreshDnionCache();
		
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！注意：被引用的图片不能删除。" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

}
