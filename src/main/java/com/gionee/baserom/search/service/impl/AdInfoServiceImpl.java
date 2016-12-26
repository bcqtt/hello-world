package com.gionee.baserom.search.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AdBehaviorTodoMapper;
import com.gionee.baserom.search.dao.AdInfoMapper;
import com.gionee.baserom.search.dao.AdKeywordMapper;
import com.gionee.baserom.search.dao.AppVersionMapper;
import com.gionee.baserom.search.dao.SysDictionaryMapper;
import com.gionee.baserom.search.pojo.AdBehaviorTodo;
import com.gionee.baserom.search.pojo.AdBehaviorTodoExample;
import com.gionee.baserom.search.pojo.AdInfo;
import com.gionee.baserom.search.pojo.AdInfoExample;
import com.gionee.baserom.search.pojo.AdInfoExample.Criteria;
import com.gionee.baserom.search.pojo.AdKeyword;
import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.service.IAdInfoService;
import com.gionee.baserom.search.util.StringHelper;
import com.mysql.fabric.xmlrpc.base.Array;

import jxl.Sheet;
import jxl.SheetSettings;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableCell;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableHyperlink;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

@Service("adInfoService")
public class AdInfoServiceImpl implements IAdInfoService {
	private final Logger logger = LoggerFactory.getLogger(AdInfoServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdInfoMapper adInfoMapper;
	
	@Resource
	private AdKeywordMapper adKeywordMapper;
	@Resource
	private SysDictionaryMapper sysDictionaryMapper;
	
	@Resource
	private AppVersionMapper appVersionMapper;
	
	@Resource
	private AdBehaviorTodoMapper adBehaviorTodoMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdInfo(String resKey,String editType,AdInfo ai,AdBehaviorTodo abt) {
		int n=0;
		abt.setAdId(ai.getId());
		abt.setAdBehaviorId(ai.getAdBehaviorId());
		if(editType.equals("add")){
			n = adInfoMapper.insert(ai);
			adBehaviorTodoMapper.insert(abt);
			logger.info("保存广告信息-->" + ai.getAdTittle());
		}else if(editType.equals("update")){
			n = this.adInfoMapper.updateByPrimaryKey(ai);
			
			AdBehaviorTodoExample example = new AdBehaviorTodoExample();
			com.gionee.baserom.search.pojo.AdBehaviorTodoExample.Criteria criteria = example.createCriteria();
			criteria.andAdIdEqualTo(ai.getId());
			criteria.andAdBehaviorIdEqualTo(ai.getAdBehaviorId());
			List<AdBehaviorTodo> l = adBehaviorTodoMapper.selectByExample(example);
			if(l.size()>0){
				//修改
				abt.setId(l.get(0).getId());
				adBehaviorTodoMapper.updateByExample(abt, example);
			}else{
				//插入
				adBehaviorTodoMapper.insert(abt);
			}
			
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		if(n>0){
			ajaxObj = DwzAjaxObject.getAjaxResult("200", "操作成功！" ,resKey, "", "");
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
	public Page<AdInfo> queryPage(Page<AdInfo> page,AdInfo ai,String searchType,String resKey) {
		if(ai.getAdRuleId()!=null && ai.getAdRuleId()==-1){
			ai.setAdRuleId(null);
		}
		int totalCount = 0;	
		List<AdInfo> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		map.put("ai",ai);
		if(searchType == null){
			totalCount = adInfoMapper.queryTotalCount(map);
			list = adInfoMapper.queryByPage(map);
		}else{
			map.put("resKey", resKey);
			totalCount = adInfoMapper.queryTotalCountOfPuttingMag(map);
			list = adInfoMapper.queryByPageOfPuttingMag(map);
		}
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdInfo selectByExample(AdInfo ai) {
		AdInfoExample example = new AdInfoExample();
		Criteria criteria = example.createCriteria();
		if(ai.getId() != null){
			criteria.andIdEqualTo(ai.getId());
		}
		List<AdInfo> list = this.adInfoMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AdInfo ai) {
		return this.adInfoMapper.updateByPrimaryKey(ai);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAdInfo(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			int adId = Integer.parseInt(idArray[i]);
			AdInfo ai = adInfoMapper.selectByPrimaryKey(adId);
			
			//删除广告行为信息
			adBehaviorTodoMapper.deleteAdBehaviorTodo(adId,ai.getAdBehaviorId());
			//删除广告图片
			String filePath = System.getProperty("searchWeb.root") + ai.getAdImagePath();
			File file = new File(filePath);
			file.delete();
			
			//删除广告信息
			n += this.adInfoMapper.deleteByPrimaryKey(adId);
			
		}
		if(n>0){
			ajaxObj = DwzAjaxObject.getAjaxResult("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	@Override
	public String exportAdInfo(AdInfo ai,String resKey,String basePath) throws IOException, BiffException, WriteException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resKey", resKey);
		map.put("export", "export");
		map.put("ai", ai);
		
		String targetFileName = "";
		String sheetName = "";
		if(resKey.equals("puttingAdInformation")){
			sheetName = "投放中";
			targetFileName = "投放中广告信息列表-" + StringHelper.getYMD();
		}else{
			sheetName = "投放完";
			targetFileName = "投放完广告信息列表-" + StringHelper.getYMD();
		}
		
		String path=System.getProperty("searchWeb.root") + "/templet/" + targetFileName + ".xls";
		File file = new File(System.getProperty("searchWeb.root") + "/templet/" + "ad_putting_information.xls");
		Workbook wb = Workbook.getWorkbook(file);
        WritableWorkbook workbook = Workbook.createWorkbook(new File(path),wb); 
        WritableSheet sheet = workbook.getSheet(0); 
        SheetSettings ss = sheet.getSettings();
        ss.setVerticalFreeze(2);  
        sheet.setName(sheetName);
        
        
        //标题样式
        WritableFont font1 =new WritableFont(WritableFont.createFont("微软雅黑"), 14 ,WritableFont.BOLD);
        WritableCellFormat wcf = new WritableCellFormat(font1);
        wcf.setAlignment(Alignment.CENTRE);  //平行居中
        wcf.setVerticalAlignment(VerticalAlignment.CENTRE); //垂直居中
        Label titleLabel = new Label( 0 , 0 , targetFileName ,wcf);
        sheet.addCell(titleLabel);
        sheet.setRowView(0, 600);
        
        sheet.mergeCells( 0 , 0 , 12 , 0 ); // 合并单元格  
        
        //内容样式
        WritableFont font2 =new WritableFont(WritableFont.createFont("微软雅黑"), 12 ,WritableFont.NO_BOLD);
        WritableCellFormat wcf2 = new WritableCellFormat(font2);
        wcf2.setAlignment(Alignment.LEFT);
        
        List<AdInfo> list = adInfoMapper.queryByPageOfPuttingMag(map);
        for (int i = 0; i < list.size(); i++) {
        	AdInfo ad = list.get(i);
        	Label label0 = new Label( 0 , 2+i , ad.getAdTittle(),wcf2);
        	Label label1 = new Label( 1 , 2+i , ad.getCpName(),wcf2);
        	Label label2 = new Label( 2 , 2+i , ad.getRule().getAdPosition(),wcf2);
        	Label label3 = new Label( 3 , 2+i , ad.getClassify().getCname(),wcf2);
        	Label label4 = new Label( 4 , 2+i , StringHelper.dateToString(ad.getStartTime()),wcf2);
        	Label label5 = new Label( 5 , 2+i , StringHelper.dateToString(ad.getEndTime()),wcf2);
        	Label label6 = new Label( 6 , 2+i , ad.getWeight().toString(),wcf2);
        	Label label7 = new Label( 7 , 2+i , ad.getUnitPrice().toString(),wcf2);
        	Label label8 = new Label( 8 , 2+i , ad.getBillingTypeObj().getDicValue(),wcf2);
        	
        	List<AdKeyword> keyList = adKeywordMapper.getSelectedKeyword(Arrays.asList(ad.getKeyword().split(",")));
        	String keyWord = "";
        	for(int ii=0; ii<keyList.size();ii++){
        		if(ii==keyList.size()-1){
        			keyWord += keyList.get(ii).getKeyword();
        		}else{
        			keyWord += keyList.get(ii).getKeyword() + ",";
        		}
        	}
        	Label label9 = new Label( 9 , 2+i , keyWord,wcf2);
        	
        	List<SysDictionary> dicList = sysDictionaryMapper.queryByDicKeyMechineType();
        	String dicStr = "";
        	for(int n=0; n < dicList.size(); n++){
        		if(n==dicList.size()-1){
        			dicStr += dicList.get(n).getDicValue();
        		}else{
        			dicStr += dicList.get(n).getDicValue() + ",";
        		}
        	}
        	
        	Map<String, Object> argsmap = new HashMap<String, Object>();
        	argsmap.put("ids", ad.getVersion().split(","));
        	List<AppVersion> dicList2 = appVersionMapper.selectByIds(argsmap);
        	Label label10 = new Label( 10 , 2+i , dicStr,wcf2);
        	dicStr = "";
        	for(int m=0; m < dicList2.size(); m++){
        		if(m == dicList2.size()-1){
        			dicStr += dicList2.get(m).getVersion();
        		}else{
        			dicStr += dicList2.get(m).getVersion() + "/";
        		}
        	}
        	Label label11 = new Label( 11 , 2+i , dicStr,wcf2);
        	
        	Label label12 = new Label( 12 , 2+i , basePath + ad.getAdImagePath(),wcf2);
        	WritableHyperlink link = new WritableHyperlink(12, 2+i, new URL(basePath + ad.getAdImagePath()));  
            sheet.addHyperlink(link);
            
            sheet.addCell(label0);
            sheet.addCell(label1);
            sheet.addCell(label2);
            sheet.addCell(label3);
            sheet.addCell(label4);
            sheet.addCell(label5);
            sheet.addCell(label6);
            sheet.addCell(label7);
            sheet.addCell(label8);
            sheet.addCell(label9);
            sheet.addCell(label10);
            sheet.addCell(label11);
            sheet.addCell(label12);
		}
        
        workbook.write();
        wb.close();
        workbook.close();
        
        return path;
		
	}

}
