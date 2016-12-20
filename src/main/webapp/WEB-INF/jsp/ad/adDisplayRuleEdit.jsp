<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageContent">
	<form method="post" action="adRule/saveAdRule?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDoneFather)">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>广告位：</label>
				<input name="adPosition" class="required" type="text" size="44" style="width:230px;" value="${r.adPosition}" />
			</p>
			<p>
				<label>广告形式：</label>
				<select id="dicId" name="dicId" class="combox" >
					<c:forEach var="dic" items="${dicList}">
						<option value="${dic.id}" <c:if test="${dic.id == r.dicId}">selected="selected"</c:if> >${dic.dicValue}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>最小权重值：</label>
				<input name="minWeight" class="required" type="text" size="44" style="width:230px;" value="${r.minWeight}" />
			</p>
			<p>
				<label>最大权重值：</label>
				<input name="maxWeight" class="required" type="text" size="44" style="width:230px;" value="${r.maxWeight}" />
			</p>
			<input type="hidden" name="id" value="${r.id}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

