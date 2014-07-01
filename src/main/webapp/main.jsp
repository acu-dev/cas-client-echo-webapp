<%--
Copyright (c) 2014, Abilene Christian University
All rights reserved.
 
Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:
 
    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of Abilene Christian University nor the names of its
      contributors may be used to endorse or promote products derived from this
      software without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Map" %>
<%@ page import="org.jasig.cas.client.validation.Assertion" %>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal" %>
<%@ page import="org.jasig.cas.client.util.AbstractCasFilter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%= config.getInitParameter("title") %></title>
</head>
<body>

<%
	Assertion assertion = (Assertion) request.getAttribute(AbstractCasFilter.CONST_CAS_ASSERTION);
%>
	<c:choose>
		<c:when test="assertion == null">
			<h3>Assertion was null.  Check you settings.  Perhaps the log as well.</h3>
		</c:when>
		<c:otherwise>
			<% AttributePrincipal principal = assertion.getPrincipal(); %>
			
			<h3>Principal</h3>
			<p><%= principal %></p>
			
			<% Map<String, Object> attributes = principal.getAttributes(); %>
			
			<h3>Attributes</h3>
			<c:choose>
				<c:when test="<%=attributes == null%>">
					<p>null</p>
				</c:when>
				<c:when test="<%=attributes.isEmpty()%>">
					<p>empty</p>
				</c:when>
				<c:otherwise>
					<ul>
						<c:forEach var="item" items="<%=attributes.entrySet()%>">
							<li>
								${item.key}=${item.value}
							</li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>


</body>
</html>