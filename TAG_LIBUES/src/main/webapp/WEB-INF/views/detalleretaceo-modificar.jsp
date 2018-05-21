<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
					// Quiero la fecha actual para ponerla por defecto 
					String fecha="";
                    String sAhora = "";                   
					
						if(request.getAttribute("fecharetaceo")!=null){
					           //  fecha=session.getAttribute("fecharetaceo").toString();							
							fecha=request.getAttribute("fecharetaceo").toString();
						}						
						//System.out.println("fecha:" + fecha+" "+session.getAttribute("utilidad"));                                 
                     if(fecha==""){
                    	  
                    	Calendar ahora = Calendar.getInstance();
     					int anyo = ahora.get(Calendar.YEAR);
     					int mes = ahora.get(Calendar.MONTH) +1; 
     					int dia = ahora.get(Calendar.DAY_OF_MONTH);     					
     					if (mes < 10) {
     					sAhora = anyo + "-0" + mes;
     					} else {	sAhora = anyo + "-" + mes; }
     					if (dia < 10) { sAhora += "-0" + dia; } 
     					else {sAhora += "-"+dia;}                     	 
                     }                     
                     else{sAhora=fecha;}
%>

 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Librer�a UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
    <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 	
	<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>


    <link href="<c:url value='/static/js/jquery-3.1.1.min.js' />" rel="stylesheet"></link>
	   	<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
	   	
	   	
			  <Style>
						h1.hidden {
                        visibility: hidden;
                          }
						  
			   </Style>
			    <Style>
			    .control-label{
			    	text-align: left;
			    	}
			    </Style>
			   
				  <script>	
				  
				  function validaFloat(campo)
				  {
					  
					 numero=document.getElementById("utilidad").value;					  
					  
				    if (!/^([0-9])*[.]?[0-9]*$/.test(numero) ){
				     //alert("El valor " + campo + " no es un n�mero");
				    
				    	    $("#glypcn"+campo).remove();
		                   // $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
		                   // $('#'+campo).parent().children('span').text("no es un numero").show();
		                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                            return false;
				    }                     
                    
                    else{
	        				$("#glypcn"+campo).remove();
	        				$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
	        				$('#'+campo).parent().children('span').hide();
	        				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
	        				return true;
        				}
				  }
				  
				  			  
				  
							function addIt(campo) {
							
								/*
								Aqu� se detallan las siglas de las variables utilizadas en el c�lculo: 
 
										Cantidad de Productos en existencia = PEX 
										Cantidad de Productos de entrada = PE 
										Costo Productos en Existencia = CPEX
										Costo Productos de entrada = CPE
										Costo Promedio Unitario = CPU
										Precio de Venta = PV 
										Total de Costo = TC
										Total de Art�culos = TA  
										precio de venta anterior=PVA										
										La f�rmula para el c�lculo del costo promedio es la siguiente: 										 
										TC = (PEX*CPEX) +(PE*CPE) 
										TA = PEX+PE 
                                        CPU=TC/TA 
										PV=CPU+(CPU*0.20). 
																		
								*/
								
								 numero=document.getElementById(campo).value;
								 // campo="costoproducto";
								  
								    if (!/^([0-9])*[.]?[0-9]*$/.test(numero) ){
								     //alert("El valor " + campo + " no es un n�mero");
								    
								    	    $("#glypcn"+campo).remove();
						                    $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
						                    $('#'+campo).parent().children('span').text("no es un numero").show();
						                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
				                            return false;
								    }  
				                    
				                    
				                    else{
					        				$("#glypcn"+campo).remove();
					        				$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
					        				$('#'+campo).parent().children('span').hide();
					        				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
					        				
				        				
								    
								
								var existencia = 0;
	                            var costoexistencia = 0.0;
	                            var precioventa = 0.0;
								var Id=document.getElementById("codigoproducto").value;
								var PEX; 
								var CPEX;		
								var CPU;
							    var PV;
							    var TC;
							    var TA;
							    var PE;
							    var CPE;
							    var PVA;
								
							 <c:forEach items="${producto}" var="current">	
	 			              		    if(${current.correlativo}==Id)	
	 			   	 			        {
						                    existencia=${current.existencia};//2
						              		costoexistencia=${current.costounitario};//2
						              		precioventa=${current.precio};
						              		PVA=parseFloat(precioventa);//2.4
						              		PEX=parseInt(existencia);//2
						              		//PEX=existencia;
						              		CPEX=parseFloat(costoexistencia);//2
						              		//PVA=parseFloat(precio);			              		
				              		    }
		              		   </c:forEach>
		              		   
		              		  // alert(PEX);
		              	        var cantidad=document.getElementById('cantidadproducto').value;//2
							    PE=parseInt(cantidad);
							    var costo=document.getElementById('costoproducto').value;//2
							    CPE=parseFloat(costo);
		              		
		              		   if(PEX==0){
		              			  // alert();
		              			   CPEX=CPE;   
		              			 //PEX=1;
		              			}
		              		
		              		   
		              			 TC = (PEX*CPEX) +(PE*CPE) ;//(2*2) + (2*2)=8
								 TA = PEX+PE ;//2+2=4	
								 
                                 CPU=TC/TA; //8/4                             
                                 
           					  var utilidad=document.getElementById("utilidad").value;
           					  var utilidad1=0.0;
           					      utilidad1= parseInt(utilidad)/100;
           					  
           					 // alert(PVA);
								 PV=parseFloat(CPU)+(parseFloat(CPU)*utilidad1);  //
		              			   
								  var costoproducto = document.getElementById('costoproducto').value;
								  var cantidad=document.getElementById('cantidadproducto').value;								
								  var cla2 = document.getElementById('precioproducto').value=PV;								
								  var cla3 = document.getElementById('subtotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
								  var cla4 = document.getElementById('existenciaanterior').value=PEX;
								  var cla5 = document.getElementById('costounitarioanterior').value=CPEX;
								  var cla6 = document.getElementById('precioanterior').value=PVA;
								  //alert(PV);
								  
								 /* return true;
								  alert();	*/								  
								  
								  return true;
							  
			              	}//fin else	
								    
							}	    
	
                </script>
                
                 <script type="text/javascript">
                 
                        function label(){
						
                        	var Id=document.getElementById("codigoproducto").value;
                            var sessionId = [];
                            var nombre = [];
                            var costo=[];
                        	
              		<c:forEach items="${producto}" var="current">
              		
              		    if(${current.correlativo} == Id){
              		    	
              		     nombre.push("${current.nombreProducto}");
              		     costo.push("${current.costounitario}");
              		     document.getElementById('nombreprod').value = nombre;
              		   document.getElementById('costoactual').value = costo;
              		   sessionId.push("${current.existencia}");
              		   document.getElementById('existencia').value =${current.existencia}+${current.sala};
              		   //document.getElementById('existencia').value =sessionId;
              		   
              		     
              		    }
              		</c:forEach>
              		
                      return true;
					  alert();			  
                        	
				     }
                       
                function label2(){
    				
              		var sessionId = [];
              		var Id=document.getElementById("codigoproveedor").value;
                	
			    		<c:forEach items="${proveedor}" var="current">
			    		
						  if(${current.codigoproveedor}==Id){
			    		    	 		  
			    		      sessionId.push("${current.nombreproveedor}");
			    		      document.getElementById('proveedor').value =sessionId;
			    		     
			    		    }
			    		</c:forEach>              		
                      return true;					
						alert();
				     }
                
                function sesion(){
    				
					var codigofacturaproveedor=document.getElementById("codigofacturaproveedor").value;
					/*var m = ${fecharetaceo};
					alert(m);
					var fecharetaceo=m;*/
					var fecharetaceo=document.getElementById("fecharetaceo").value;
					var fechafacturaproveedor=document.getElementById("fechafacturaproveedor").value;
					var utilidad = document.getElementById('utilidad').value;
					
					
					 <c:set var="contador" value="${0}" />
						 var m = <%=sAhora %>;
						//	alert(m);
					 
					
					var fecha="f";
					var fecha1="f1";
					var cfp="cfp";
					var uti1="uti";
					
					sessionStorage[fecha]=fecharetaceo;
					sessionStorage[fecha1]=fechafacturaproveedor;
					sessionStorage[cfp]=codigofacturaproveedor;
					sessionStorage[uti1]=utilidad;
				     }
                     
                 </script>
                 
                  <script>
                               $( function() {					  
									   var p;
									   var p1;
									  
										for(var i=0;i<sessionStorage.length;i++){
						                var producto=sessionStorage.key("f");
						                p=sessionStorage.getItem('f');
						                p1=sessionStorage.getItem('f1');
						                p3=sessionStorage.getItem('cfp');	
						                p4=sessionStorage.getItem('uti');
										}
									  // document.getElementById("fecharetaceo").value=p;
									   //document.getElementById("fechafacturaproveedor").value=p1;
									 //  document.getElementById("codigofacturaproveedor").value=p3;
									 //  document.getElementById("utilidad").value=p4;
					    
					           } );
					                  
                  </script>                 
					
					  <script>
								  $( function() {								  
								    var miArray=new Array();
								    var sessionId = [];								    
								    <c:forEach items="${proveedor}" var="current">										
									  sessionId.push("${current.codigoproveedor}");								
									</c:forEach>	
								    $( "#codigoproveedor" ).autocomplete({								  
								    	source: sessionId
								    });
								  } );
					  </script>
					  				  
				<script>
					 		
					  $( function() {
						  
						   
						    var sessionId1 = [];						    
						    <c:forEach items="${producto}" var="current">								
							  sessionId1.push("${current.correlativo}");						
							</c:forEach>					    
						    
						    $( "#codigoproducto" ).autocomplete({
						     /// source: availableTags
						    	source: sessionId1
						    });
						  } );
					  
					  </script>

					<script>
					function cambiar1(){
						var codigo1 = document.getElementById("codigofacturaproveedor").value;	
							if(codigo1 != null){
					        	$("#codigoproveedor").focus();
							}
					}
					function cambiar2(){	
						var codigo3 = document.getElementById("codigoproveedor").value;	
							if(codigo3 != null) {
					        	$("#codigoproducto").focus();
					        }
					}
					function cambiar3(){	
						var codigo2 = document.getElementById("codigoproducto").value;	
							if(codigo2 != null) {
					        	$("#costoproducto").focus();
					        }
					}
					function cambiar4(){	
						var costo = document.getElementById("costoproducto").value;		
							if(costo != null) {
					        	$("#cantidadproducto").focus();
					        }
					}
					function cambiar5(){		
						var cantidad = document.getElementById("cantidadproducto").value;	
							if(cantidad != null) {
					        	$("#agregar").focus();
					        }
					}
					
					
					
					
					
					</script>
					
					<script type="text/javascript">
					
					
					
					
					
					</script>

</head>


	
<body >

	 	  
<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">


	  <div class="well lead" align="center">Modificar Retaceo</div>
        <form:form method="POST" name="retaceo" modelAttribute="detalleretaceo"  class="form-horizontal"   >
            <form:input type="hidden" path="codigodetalleretaceo" id="codigodetalleretaceo"/>             
             
      <div class="panel-group">
      	<div class="panel panel-default">
			<div class="form-group row">		
				<div class="panel-body">
					<div class="col-xs-3">      
					<label class="form-control" for="nombr">Documento #:</label>					
					<form:input type="text" path="codigoretaceo" id="codigoretaceo" class="form-control input-sm" value='<%=request.getAttribute("codigoretaceo").toString()%>'/>   
					</div>
					<div class="col-xs-3">				                  
					<label class="form-control" for="nombr">Fecha Retaceo:</label>
					<input type="date"  name="fecharetaceo" id="fecharetaceo" class="form-control input-sm"  value="<%=sAhora %>" /> 
					</div>
					<div class="col-xs-3">
					<label class="form-control" for="utilidad" >Utilidad: </label>
                    <form:input type="number" min="0" path="utilidad" id="utilidad" name="utilidad" class="form-control input-sm" value='<%=request.getAttribute("utilidad").toString()%>' />
                    </div>
				</div>
			</div>
		</div>
		
		<div class="panel panel-success">	
			<div class="form-group row">
				<div class="panel-body">
					<div class="col-xs-3">				             
						<label class="form-control" for="nombr">C�digo Factura:</label>
						
						<input type="text" id="codigofacturaproveedor" 
						onchange='cambiar1();'  placeholder="DIGITE" class="form-control input-sm" value='${codigofacturaproveedor}' /> 
						
						
						
						
					</div>
					<div class="col-xs-3">
						<label class="form-control" for="nombr">Fecha Factura:</label>
						
						
						<input type="date"  id="fechafacturaproveedor" name="fechafacturaproveedor" 
						class="form-control input-sm" value='${fechafacturaproveedor}' /> 
						                        
					</div>
					<div class="col-xs-2">
						<label class="form-control" for="tags">C�d Proveedor:</label>
						  
						  
						<input type="number"  id="codigoproveedor" placeholder="DIGITE" class="form-control input-sm" 
						onchange='label2(); cambiar2();'  value='<%=request.getAttribute("codigoproveedor").toString()%>'/> 
						
					</div>
					<div class="col-xs-4">
						<label class="form-control" for="proveedor">Nombre Proveedor:</label>
						<input type="text" id="proveedor" placeholder="AUTOMATICO" class="form-control input-sm" value='<%=request.getAttribute("nombreproveedor").toString()%>'/>					                     
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="panel-body">
					<div class="col-xs-3">
				        <label class="form-control" for="tags">C�digo Producto:</label>
	                    <form:input type="text" path="codigoproducto" id="codigoproducto"  placeholder="DIGITE"  class="form-control input-sm" onchange='label(); cambiar3();'   />      
                    </div>
                    <div class="col-xs-5"> 
	                    <label class="form-control" for="nombr">Nombre Producto:</label>
						<input type="text" id="nombreprod" placeholder="AUTOMATICO" class="form-control input-sm"  />
					</div>
					<div class="col-xs-2">
						<label class="form-control" for="existencia">Existencia:</label>
						<input type="number"  id="existencia" placeholder="AUTOMATICO" class="form-control input-sm"   />      
                    </div>
                    <div class="col-xs-2">
						<label class="form-control" for="costoactual">Costo Actual:</label>
						<input type="text"  id="costoactual" placeholder="AUTOMATICO" class="form-control input-sm"  />      
                    </div>
				</div>
			</div>
			<div class="form-group row">
				<div class="panel-body">
					<div class="col-xs-3">
	                    <label class="form-control" for="nombr">Costo Producto: $</label>
	                    <form:input type="text" path="costoproducto" id="costoproducto" class="form-control input-sm" onchange="addIt('costoproducto'); cambiar4();" placeholder="DIGITE"/>
                    </div>
                    <div class="col-xs-2">
	                    <label class="form-control" for="nombr">Cantidad:</label>
	                    <form:input type="number" min="1" path="cantidadproducto" id="cantidadproducto" placeholder="DIGITE" class="form-control input-sm" onchange="addIt('cantidadproducto'); cambiar5();"/>
                    </div>
                    <div class="col-xs-3">
	                    <label class="form-control" for="nombr">Precio Producto: $</label>
	                    <form:input type="text" path="precioproducto" id="precioproducto" placeholder="AUTOMATICO" class="form-control input-sm"  />
                    </div>
				
					<div class="col-xs-3" style="display:none">
                    <label class="col-md-3 control-lable" for="nombr" >EXISTENCIA ANTERIOR</label>
                    <form:input type="text" path="existenciaanterior" id="existenciaanterior" class="form-control input-sm"   />
                    </div>
                    <div class="col-xs-3" style="display:none">
                    <label class="col-md-3 control-lable" for="nombr" >Costo ANTERIOR</label>
                    <form:input type="text" path="costounitarioanterior" id="costounitarioanterior" class="form-control input-sm"  />
                    </div>
                    <div class="col-xs-3" style="display:none">
                    <label class="col-md-3 control-lable" for="nombr" >Precio ANTERIOR</label>
                    <form:input type="text" path="precioanterior" id="precioanterior" class="form-control input-sm"   />
                    </div>
                    <div class="col-xs-3" style="display:none">
                    <label class="col-md-3 control-lable" for="nombr" >subtotal</label>
                    <form:input type="text" path="subtotal" id="subtotal" class="form-control input-sm"  />
                    </div>				
					
            	    <c:choose>
                        <c:when test="${edit}">
                        <div class="col-xs-2">
                            <input type="submit" value="AGREGAR"  onclick="confirmar"  class="btn btn-primary btn-sm"/>
                        </div>
                       	<div class="col-xs-2">
                            <a href="<c:url value='/detalleretaceo-list' />" class="btn btn-primary btn-sm">CANCELAR</a>
                        </div>
                        </c:when>
                        
                        <c:otherwise>
                        <div class="col-xs-2">
                            <input type="button" value="AGREGAR" id="agregar" class="btn btn-primary btn-sm" onkeypress="retaceo.submit()" onclick="retaceo.submit()"  />
                       	</div>
                       	<div class="col-xs-2">
                            <a href="<c:url value='/detalleretaceo-list' />" class="btn btn-primary btn-sm"  id="click-me"  >CANCELAR</a>
                    	</div>    
                    	
                    	 
                    	                	
                        </c:otherwise>
                    </c:choose>
                    
       			</div>
       		</div>
                <%--=session.getAttribute("mySessionAttribute")--%>
       </div>
	</div>       
               <table class="table table-striped ">
				<thead>
		    		<tr class="success">		   
		    		        <th>�TEM</th> 			
			      			<th>C�digo Producto</th>			      			      			
			      			<th>Cantidad</th>
			      			<th>Costo $</th>
			      			<th>Precio $</th>
			      			<th>Subtotal $</th>
			      			<th>ELIMINAR</th>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      <c:set var="contador" value="${0}" />
				    	<c:forEach items="${retaceo2}" var="retaceos" >
				    		<tr class="info">				    		
				    	 <c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	           <c:if test = "${salary > 2000}">
		    	                <c:set var="contador" value="${contador + 1}" />	
		    	                <td>${contador}</td>
				    			<td>${retaceos.codigoproducto}</td>				    			
				    			<td>${retaceos.cantidadproducto}</td>
				    		    <td>$ ${retaceos.costoproducto}</td>
				    			<td>$ ${retaceos.precioproducto}</td>
				    			<td>$ ${retaceos.subtotal}</td>	
				    					    			
				    		</c:if>
				    				
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-detalleRetaceoupdate-${retaceos.codigodetalleretaceo}-${retaceos.codigoproducto}' />"  class="btn btn-danger custom-width" >Eliminar</a></td>
                        
                       
                        </sec:authorize>
                        </tr>
				    	 </c:forEach>
				    	 
				    	 <tr class="alert alert-success lead">
						    	        
						    			<td></td>
						    			<td></td>
						    		    <td></td>
						    			<td></td>
						    			<td>Total</td>
						    	        <td >
		                                   $ 
		                                 
         <fmt:formatNumber value = "${total}" />
		                                </td>
		                                <td></td>
                         </tr>
		    	</tbody>
	    </table>   
      
		
	    <div class="well lead" align="center">	
			<a href="<c:url value='/finalizar-update' />" class="btn btn-primary btn-sm">Guardar Retaceo</a>
		</div>
	   
	
	</form:form>
        
</div>
 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      
 
            
</body>


</html>

