<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Requisici�n Detalle</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>

<style>
		p.normal {
    		font-weight: normal;
		}

		p.light {
    		font-weight: lighter;
		}

		p.thick {
    		font-weight: bold;
		}

		p.thicker {
    		font-weight: 900;
		}
	</style>
	
	<Style>
		.control-label {
			text-align: left;
		}
		
		invalid {
			border: 2px solid #ff0000;
		}
	</Style>

</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp" %></div>	
	<div class="container">        
	<div class="row">		
	<div class="panel panel-default">
  				<!-- Default panel contents-->
  				<div class="panel-heading"><h3>REQUISICI�N: ${requisicion.codigorequisicion}</h3></div>
  				<p></p>
  				<div class="panel-body">
					<div class="col-md-3"></div>
					<div class="col-md-6" align="center">
						<table class="table table-striped" >
							<tbody>
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<tr>
	       								<th scope="row">Requisici�n N�mero:</th>
	       								<td>${requisicion.codigorequisicion}</td>
	      							</tr>
      							</sec:authorize>
								<tr>
       								<th scope="row">Destino:</th>
       								<td>${requisicion.destino}</td>
      							</tr>
      							<tr>
       								<th scope="row">Fecha:</th>
       								<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${requisicion.fecha}"/></td>
      							</tr>
      							<tr>
       								<th scope="row">Total:</th>
       								<td>$ ${requisicion.total}</td>
      							</tr>
      						</tbody>
      					</table>
    
  					</div>
  					
  					
  				</div>
  				<p class="thick" align="center">DETALLE DE LOS PRODUCTOS</p>
 				<table class="table table-striped ">
					<thead>
			    		<tr class="success">
			    			<th>�TEM</th>		    			
				      		<th>C�digo</th>
				      		<th>T�tulo</th>	      			
				      		<th>Cantidad</th>
				      		<th>Costo</th>
				      		<th>Precio</th>
				      		<th>Subtotal</th>			      				
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<c:set var="contador" value="${0}" /> 
					    <c:forEach items="${req1}" var="requisiciones" >
					    	<tr class="info">				    		
			    	            <c:set var = "salary" scope = "session" value = "${2000*2}"/>
			    	            <c:if test = "${salary > 2000}">
			    	                <c:set var="contador" value="${contador + 1}" />    	                
			    	                <td>${contador}</td>
					    			<td>${requisiciones.codigoproducto}</td>
					    			<td>${requisiciones.nombreproducto}</td>
					    			<td>${requisiciones.cantidad}</td>
					    		    <td>$ ${requisiciones.costo}</td>
					    			<td>$ ${requisiciones.precio}</td>
					    			<td>$ ${requisiciones.subtotal}</td>
					    							    							    			 			
					    		</c:if>	
	                        </tr>
					  	</c:forEach>
			    	</tbody>
	    		</table>
			</div>
	<form class="form-horizontal" role="form" action="<c:url value="/repo_requisiciones" />" target="_blank">

            <div class="form-group">

            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Imprimir Requisici�n</button>
                    <a class="btn btn-danger" href="<c:url value="/requisicion-list" />" role="button">Lista de Requisiciones</a>
                </div>

				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="Requisicion.jasper" name="nombre"/>
            </div>
	</form>		
	</div>
	
	
	
	<!-- 
	<div class="form-group">
	    <div class="col-sm-offset-6 col-sm-10">
	    	<button type="submit" class="btn btn-primary">Imprimir Transferencia</button>
			<a href="<c:url value='/transferencia-list' />" class="btn btn-primary"> Regresar</a>
			<input type="hidden" value="${loggedinuser}" name="usuario"/>
			<input type="hidden" value="Factura.jasper" name="nombre"/>
		</div>
	</div>
	-->
</div>	
<div class="row"><%@include file="foot.jsp" %></div>	
</body>
</html>