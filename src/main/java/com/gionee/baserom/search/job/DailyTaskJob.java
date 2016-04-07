package com.gionee.baserom.search.job;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gionee.baserom.search.service.ISearchService;
import com.gionee.baserom.search.util.ApplicationHelper;

public class DailyTaskJob {

    private final Logger logger = LoggerFactory.getLogger(DailyTaskJob.class);
    IDataExtract dataExtract;

    @Resource
    private ISearchService searchService; 
    
    public void execute() {
        try {
            String getSourceCode = searchService.getUseredSourceCode();
            dataExtract = (IDataExtract) ApplicationHelper.getApplicationContext().getBean(getSourceCode);
            logger.info(dataExtract.toString()+"["+dataExtract.hashCode()+"]");
            dataExtract.execute();
        } catch (Exception e) {
            logger.error("DailyTaskJob execute() Exception", e);
        }
    }

}
