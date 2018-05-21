<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librer�a UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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


<script type="text/javascript">

	function producto(){
	
		var nombre = [];
		var bodega = [];
		var sala = [];
		var precio = [];
		var costo = [];
		
		var Id = document.getElementById("codigoproducto").value;
	
		<c:forEach items="${producto}" var="current" >
		
		  if( ${current.correlativo} == Id) {
		    	 		  
		      nombre.push("${current.nombreProducto}");
		      document.getElementById('nombreproducto').value = nombre;
		      
		      bodega.push("${current.existencia}");
   		      document.getElementById('bodega').value = bodega;
   		      
   		      sala.push("${current.sala}");
		      document.getElementById('sala').value = sala;
   		      
		      costo.push("${current.costounitario}");
		      document.getElementById('costo').value = costo;
		      
		      precio.push("${current.precio}");
		      document.getElementById('precio').value = precio;
		    }
		</c:forEach>              		
      return true;					
		alert();
     }
    
</script>

<script>
$( function() {
	var sessionId1 = [];
	
	<c:forEach items="${producto}" var="current">								
	sessionId1.push("${current.correlativo}");						
	</c:forEach>					    
	
	$( "#codigoproducto" ).autocomplete({
	// source: availableTags
	source: sessionId1
	});
} );
</script>

<script>
function validar2() {
	var destino1 = document.getElementById("destino").value;
	var sala1 = parseInt(document.getElementById("sala").value);
	var bodega1 = parseInt(document.getElementById("bodega").value);
	var cantidad1 = parseInt(document.getElementById("cantidad").value);	
	var precio=document.getElementById('precio').value;
	
	
	if(destino1 == 'SALA')
    {
		if(bodega1 < cantidad1){
			alert('No hay suficiente producto en BODEGA');
		}
		else {
			var subtotal = document.getElementById('subtotal').value=parseFloat(precio)*(parseInt(cantidad1));
			$("#agrega").focus();
		}
    }
	else
		if(sala1 < cantidad1){
			alert('No hay suficiente producto en SALA');
		}
		else {
			var subtotal = document.getElementById('subtotal').value=parseFloat(precio)*(parseInt(cantidad1));
			$("#agrega").focus();
		}
}
</script>

<script>
	// Focus = Changes the background color of input to yellow
	function focusF() {
	    document.getElementById("destino").style.background = "#E3ECEF";	    
	}
	function focusF1() {
		document.getElementById("codigoproducto").style.background = "#E3ECEF";
	}
	function focusF2() {
		document.getElementById("cantidad").style.background = "#E3ECEF";
	}
	
	// No focus = Changes the background color of input to red
	function blurF() {
	    document.getElementById("destino").style.background = "#DBE1E3";
	}
	function blurF1() {
		document.getElementById("codigoproducto").style.background = "#DBE1E3";
	}
	function blurF2() {
		document.getElementById("cantidad").style.background = "#DBE1E3";
	}
</script>

<script>
function cambiar(){
	var Elt = document.getElementById("codigoproducto").value;	
	
		if(Elt != null)
        {
        	$("#cantidad").focus();
        	}
}

function validar1(){
	var cod = document.getElementById("codigoproducto").value;	
	
		if(cod == '')
        {
			alert('Digite un c�digo de producto para realizar la requisicion');
       	}		
}
</script>
</head>

<body>

	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">MODIFICAR REQUISICI�N</div>
		<form:form method="POST" name="req" modelAttribute="detallerequisicion" class="form-horizontal">
		<form:input type="hidden" path="codigodetalle" id="codigodetalle" />

		<div class="col-xs-2" style="display:none">	
			<label class="form-control" for="codigo">Estado:</label>						
			<input type="text" id="estado" class="form-control input-sm" value="1" />
		</div>

		<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-3" style="display:none">
						<label class="form-control" for="nombr">Documento #:</label>
						<form:input type="text" path="codigorequisicion" id="codigorequisicion" maxlength="11" class="form-control input-sm" value='<%=session.getAttribute("codigoreq")%>' />
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Documento #:</label>
						<input type="text" class="form-control input-sm" value='<%=session.getAttribute("codigoreq")%>' disabled="disabled" />
						</div>
						<div class="col-xs-3" style="display:none">
						<label class="form-control" for="nombr">Mover productos a:</label>
						<input type="text" name="destino" id="destino" class="form-control input-sm"  onfocus="focusF()" onblur="blurF()" value ='${destino}'>
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Mover productos a:</label>
						<input type="text" name="destino" id="destino" class="form-control input-sm"  onfocus="focusF()" onblur="blurF()" value ='${destino}' disabled="disabled">
						</div>
						<div class="col-xs-3" style="display:none">			
						<label class="form-control" for="nombr">Fecha:</label>
						<input type="date" id="fecharequisicion" name="fecharequisicion" class="form-control input-sm" value ='${fechareq}' />
						</div>
						<div class="col-xs-3">			
						<label class="form-control" for="nombr">Fecha:</label>
						<input type="date" id="fecharequisicion" name="fecharequisicion" class="form-control input-sm" value ='${fechareq}'  disabled="disabled"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel panel-success">				
			<div class="panel-heading">INGRESO. Informaci�n del producto. (CODIGO Y CANTIDAD)</div>		
				<div class="panel-body">
					<div class="form-group row">
						<div class="col-xs-2">
						<label class="form-control" for="tags">C�digo:</label>
						<form:input type="number" path="codigoproducto" id="codigoproducto"  maxlength="11" placeholder="DIGITAR (9999)" class="form-control input-sm" onfocus="focusF1()"
									onchange='producto(); cambiar();' onkeypress='producto();' title="Digitar codigo del producto, solo n�meros"  onblur="blurF1()" />
						</div>
						<div class="col-xs-6">
						<label class="form-control" for="nombr">T�tulo:</label>
						<form:input type="text" path="nombreproducto" id="nombreproducto"  maxlength="50" placeholder="NOMBRE DEL PRODUCTO" class="form-control input-sm" title="Se llena automaticamente" />
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">En Bodega:</label>
						<form:input type="number" path="bodega" id="bodega" maxlength="11" placeholder="EXISTENCIA" class="form-control input-sm" title="Se llena automaticamente" />							
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">En Sala:</label>
						<form:input type="number" path="sala" id="sala" maxlength="11" placeholder="EXISTENCIA" class="form-control input-sm" title="Se llena automaticamente"/>							
						</div>
					</div>					
				
					<div class="form-group row">
						<div class="col-xs-3">
						<label class="form-control" for="costo">Costo $:</label>
						<form:input type="text" path="costo" id="costo" placeholder="COSTO DEL PRODUCTO" class="form-control input-sm" title="Se llena automaticamente" />							
						</div>						
						<div class="col-xs-3">
						<label class="form-control" for="precio">Precio $:</label>
						<form:input type="text" path="precio" id="precio" placeholder="PRECIO DEL PRODUCTO" class="form-control input-sm" title="Se llena automaticamente"/>							
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Cantidad a mover:</label>
						<form:input type="number" path="cantidad" id="cantidad" maxlength="11" placeholder="DIGITAR (9999)" class="form-control input-sm" onchange="validar2();" 
									title="Digitar cantidad a mover, solo n�meros" onfocus="focusF2()" onblur="blurF2()" autocomplete="off" min="1" />
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Subtotal $:</label>
						<form:input type="text" path="subtotal" id="subtotal" placeholder="SE CALCULA AUTOMATICAMENTE" class="form-control input-sm" 
									title="Se llena automaticamente" />							
			 			</div>
			 		</div>
			 	</div>
			 	<div class="form-group row" align="center">			 		
			 <!--		<button type="button" class="btn btn-primary btn-sm" data-toggle="collapse"  onclick="validar1();" data-target="#agrega">COMPROBAR</button>	 -->		 		
				 	<input type="button" value="AGREGAR" id="agrega" class="btn btn-primary btn-sm" onclick="req.submit();"  /> 							
					<a href="<c:url value='/requisicion-list' />"  class="btn btn-primary btn-sm" >CANCELAR</a>					
				</div>
			</div>
		</div>
		<p class="thick" align="center">DETALLE DE LOS PRODUCTOS</p>
 		<table class="table table-striped ">
				<thead>
		    		<tr class="success">
		    				<th>�TEM</th>		    			
			      			<th>C�digo</th>
			      			<th>T�tulo</th>	      			
			      			<th>Cant.</th>
			      			<th>Costo</th>
			      			<th>Precio</th>
			      			<th>Subtotal</th>			      			
			      			<th>ELIMINAR</th>	
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
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO')">
                            <td><a href="<c:url value='/delete-detallerequisicion-${requisiciones.codigodetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                        </tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>
				
			<div class="row" align="right">
                <div class="form-group col-md-12">
                    <label class="col-md-10 control-lable" for="total">TOTAL:</label>
                    <div class="col-md-2">
                    <input type="text" id="total" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" 
                    		value='$ ${total}' disabled="disabled"/>                           
                    </div>
                </div>
            </div>	
		        
		<div class="well lead" align="center">
			<a href="<c:url value='/guardar-update' />" class="btn btn-primary btn-sm" >GUARDAR REQUISICI�N</a>
		</div>
	</form:form>
</div>

	

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>   
<!--  
pages:
http://formvalidation.io/examples/changing-success-error-colors/
http://www.um.es/docencia/barzana/DAWEB/Desarrollo-de-aplicaciones-web-teoria-formularios-ejemplo-1.html
-->
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>