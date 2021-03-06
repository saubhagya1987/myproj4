<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

 <!-- start title -->
	<div class="title_top">        
        <div class="container-fluid">
        	<div class="row-fluid">
                <div class="span6 title_h2">
                    <h2> 
                    <spring:message var="title" code="access.denied.title"></spring:message>
					<c:out value="${title }"></c:out>
				</h2>
                </div>
                <div class="span6">
                </div>
            </div>
        </div>
    </div>
    <!-- and title -->
    <div class="container-fluid">
    	<!-- start search -->
    	<div class="row-fluid">
            <div class="span12">
            	<c:if test="${not empty message }">
					<spring:message var="msg" code="${message }"></spring:message>
					<h3><c:out value="${msg }"></c:out></h3>
					
				</c:if>
            </div>
        </div>
     </div>

