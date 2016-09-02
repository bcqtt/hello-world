package com.gionee.baserom.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.pojo.Rosters;
import com.gionee.baserom.search.service.IRostersService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("getRosters")
public class ApiGetDataController {
	protected static Logger logger = Logger.getLogger(ApiGetDataController.class);
	private String jsonResult = "";
	
	@Resource
	IRostersService rostersService;
	
	@RequestMapping(value="/{u}",method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public void getRosters(@PathVariable String u, HttpServletResponse response){
		List<Rosters> list = rostersService.getRosters(u,0);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		jsonResult = JSONObject.toJSONString(map);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value="/{u}/{v}",method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public void getRosters(@PathVariable String u, @PathVariable int v,HttpServletResponse response){
		List<Rosters> list = rostersService.getRosters(u,v);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		if(list.size()>0){
			map.put("version", v);
		}
		jsonResult = JSONObject.toJSONString(map);
		StringHelper.outputJsonString(jsonResult, response);
	}

}
