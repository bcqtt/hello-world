package com.gionee.baserom.search.dao;

import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.AppVersionExample;
import com.gionee.baserom.search.pojo.SysDictionary;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AppVersionMapper {
    
    
    
    /*********************
     * 以下为手动加入的方法
     *********************/

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int countByExample(AppVersionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int deleteByExample(AppVersionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer vid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int insert(AppVersion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int insertSelective(AppVersion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	List<AppVersion> selectByExample(AppVersionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	AppVersion selectByPrimaryKey(Integer vid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") AppVersion record, @Param("example") AppVersionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") AppVersion record, @Param("example") AppVersionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(AppVersion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table app_version
	 * @mbggenerated
	 */
	int updateByPrimaryKey(AppVersion record);

	/**
     * 查询分页信息
     * @param map
     * @return
     */
	List<AppVersion> queryByPage(Map<String, Object> map);

	List<AppVersion> selectByIds(Map<String, Object> map);

	List<AppVersion> selectAllVersion();

	int queryVersionEntranceCount();
	List<AppVersion> queryVersionEntranceList(Map<String, Object> map);

	List<AppVersion> queryAllVersion();

	AppVersion selectVersionEntranceByVid(Integer appVersionId);

}