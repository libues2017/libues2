<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.io.*" %> 
<html> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registro de productos</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
    <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
  	
  	<script>
      function validar()
      {
    	  var area = document.getElementById('codigoarea').value;
    	  if (area == 0)
    	  {
    		  alert('Seleccione un Area');  
    	  } 	  
      }
      
      function validar2()
      {
    	  var codigo = document.getElementById('codigoproveedor').value;
    	  if (codigo == 0)
    	  {
    		  alert('Seleccione un Proveedor');  
    	  } 	  
      }
      
      function validar3()
      {
    	  var nombre = document.getElementById('nombreProducto').value;
    	  if (nombre == '')
    	  {
    		  alert('Digite un Nombre de Producto');  
    	  } 	  
      }
      
      function validar4()
      {
    	  var tipo = document.getElementById('codTipoProducto').value;
    	  if (tipo == 0)
    	  {
    		  alert('Seleccione el Tipo de Producto');  
    	  } 	  
      }
    </script>
  	
</head>
 <%
					// Quiero la fecha actual para ponerla por defecto 
					String fecha="";
                    String sAhora = "";
					
						if(session.getAttribute("fecha")!=null){
					             fecha=session.getAttribute("fecha").toString();
						}
                              
                     if(fecha==""){
                    	  
                    	Calendar ahora = Calendar.getInstance();
     					int anyo = ahora.get(Calendar.YEAR);
     					int mes = ahora.get(Calendar.MONTH) +1; 
     					int dia = ahora.get(Calendar.DAY_OF_MONTH);
     					
     					if (mes < 10) {
     					sAhora = anyo + "-0" + mes;
     					} else {
     					sAhora = anyo + "-" + mes;
     					}
     					if (dia < 10) {
     					sAhora += "-0" + dia;
     					} else {
     					sAhora += "-"+dia;
     					} 
                    	 
                     }
                     
                     else{
                    	 
                    	 sAhora=fecha;
                     }
%>
<body >
   <div class="row"><%@include file="page_head_2.jsp" %></div>
   <div class="container">
    
    <div class="row col-md-12">
		<c:choose>
			<c:when test="${edit}">    
	    		<div class="well lead" align="center">ACTUALIZAR PRODUCTO</div>
	    	</c:when>
	    	<c:otherwise>
	    		<div class="well lead" align="center">CREAR NUEVO PRODUCTO</div>
	    	</c:otherwise>
	    </c:choose>
	    <form:form method="POST" modelAttribute="producto" class="form-horizontal">
		    <form:input type="hidden" path="codigoProducto" id="codigoProducto"/>
		    
		    <div class="panel-group">
		    	<div class="panel panel-success">
		    		<div class="form-group row">
		    			<div class="panel-body">
					    	<div class="row">
					        	<div class="form-group col-md-12" style="display:none ">
					            	<label class="col-md-3 control-lable" for="correlativo">Codigo de producto:</label>
					                <div class="col-md-7">
					                	<form:input type="text" path="correlativo" id="correlativo" class="form-control input-sm"/>
					                	<div class="has-error">
					                		<form:errors path="correlativo" class="help-inline"/>
					                	</div>
					                </div>
					            </div>
					    	</div>
		             
					   		<div class="col-xs-4">
			                	<label class="form-control" for="area">Area:</label>
			                    <form:select path="area" id="codigoarea" multiple="false"  class="form-control input-sm" >
	       							<form:option value="0"  label="Seleccione un Area"/>
	       							<form:options items="${areas}"  itemValue="codigoarea" itemLabel="nombrearea"  />
	       						</form:select>
			                    <div class="has-error">
			                    	<form:errors path="area" class="help-inline"/>
			                    </div>
			           		</div>
            	
			            	<div class="col-xs-4">
			                    <label class="form-control" for="proveedor">Proveedor:</label>
			                    <form:select path="proveedor" id="codigoproveedor" multiple="false"  class="form-control input-sm" >
	       							<form:option value="0"  label="Seleccione un Proveedor"/>
	       							<form:options items="${proveedores}"  itemValue="codigoproveedor" itemLabel="nombreproveedor"  />
	       						</form:select>			           
			            	</div>
            	
			            	<div class="col-xs-4">
			                	<label class="form-control" for="proveedorAnterior">Proveedor Anterior:</label>			                 
			                    <form:select path="proveedorAnterior" id="codigoproveedor" multiple="false"  class="form-control input-sm" >
	       							<form:option value="0"  label=" "/>
	       							<form:options items="${proveedores}"  itemValue="codigoproveedor" itemLabel="nombreproveedor"  />
	       						</form:select>		                    
			            	</div>
			            </div>
		            </div>
		            
		            <div class="form-group row">
		            	<div class="panel-body">
		            		<div class="col-xs-8">
			            		<label class="form-control" for="nombreProducto">Nombre de Producto:</label>
			                	<form:input type="text" path="nombreProducto" id="nombreProducto" maxlength="50" placeholder="Digite el Nombre del Producto" class="form-control input-sm"/>
			                	<div class="has-error">
			                		<form:errors path="nombreProducto" class="help-inline"/>
			                	</div>
		                	</div>
		                	
		                	<div class="col-xs-4">
                    			<label class="form-control" for="tipoProducto">Tipo de Producto:</label>
                        		<form:select path="tipoProducto" id="codTipoProducto" multiple="false"  class="form-control input-sm" >
	       							<form:option value="0"  label="Seleccione Tipo Producto"/>
	       							<form:options items="${tipoproductos}"  itemValue="codTipoProducto" itemLabel="tipoProducto"  />
	       						</form:select>               		
            				</div>
		                	
		            	</div>
		            	
		            	<div class="panel-body">
                			<div class="col-xs-4">
                    			<label class="form-control" for="autores">Autores / Marca:</label>
                        		<form:select path="autores" id="codigoautor" items="${autores}"  itemValue="codigoautor" multiple="true"  class="form-control input-sm" />
	       							
	       					  
                			</div>
                		
                			<div class="col-xs-4">
                    			<label class="form-control" for="editorial">Editorial:</label>
                        		<form:select path="editorial" id="codigoeditorial" multiple="false"  class="form-control input-sm" >
	       							<form:option value="0"  label="Seleccione Editorial"/>
	       							<form:options items="${editoriales}" multiple="false" itemValue="codigoeditorial" itemLabel="nombre"  />
	       						</form:select>                        		                        		                     		
                			</div>
                			
                			<div class="col-xs-4">
                    			<label class="form-control" for="unidadMedida">Unidad de Medida:</label>
                        		<!--<form:input type="text" path="unidadMedida" id="unidadMedida" class="form-control input-sm"/>-->
                        		<SELECT name="unidadMedida" id="unidadMedida" class="form-control input-sm">
										<OPTION VALUE="">Selecciona la Unidad de Medida</OPTION>
										<OPTION VALUE="C/U">Unidad</OPTION>
										<OPTION VALUE="HJA">Hoja</OPTION>
										<OPTION VALUE="PQT">Paquete</OPTION>
										<OPTION VALUE="CJA">Caja</OPTION>							
										<OPTION VALUE="RMA">Resma</OPTION>
										<OPTION VALUE="EST">Estuche</OPTION>
										<OPTION VALUE="RLL">Rollo</OPTION>
										<OPTION VALUE="PLG">Pliego</OPTION>
										<OPTION VALUE="JGO">Juego</OPTION>
										<OPTION VALUE="YDA">Yarda</OPTION>					
								</SELECT>
                        		<div class="has-error">
                            		<form:errors path="unidadMedida" class="help-inline"/>
                       	 		</div>
               				</div>        	
		            	</div>
		            	
		            	<div class="panel-body">
		            	<c:choose>
							<c:when test="${edit}">		            	
		            		<div class="col-xs-4">
		            			<label class="form-control" for="existencia">Existencias:</label>
		                		<form:input type="text" min="0" path="existencia" id="existencia" maxlength="11" placeholder="Digite la Cantidad de Producto" class="form-control input-sm"/>
		                    	<div class="has-error">
		                    		<form:errors path="existencia" class="help-inline"/>
		                    	</div>
		            		</div>
		            		</c:when>
	    					<c:otherwise>
	    					<div class="col-xs-4">
		            			<label class="form-control" for="existencia">Existencias:</label>
		                		<form:input type="text" min="0" path="existencia" id="existencia" maxlength="11" placeholder="Digite la Cantidad de Producto" class="form-control input-sm" value="0"/>
		                    	<div class="has-error">
		                    		<form:errors path="existencia" class="help-inline"/>
		                    	</div>
		            		</div>
	    					</c:otherwise>
	    				</c:choose>
		            		<div class="col-xs-4">
		            			<label class="form-control" for="existencia">Unidad Minima:</label>
		                		<form:input type="number" min="0" path="unidadMinima" id="unidadMinima" placeholder="Digite la Cantidad de Minima del Producto" 
		                		class="form-control input-sm" value="1"/>
		                    	<!-- 
		                    	<div class="has-error">
		                    		<form:errors path="unidadMinima" class="help-inline"/>
		                    	</div>
		                    	-->
		                	</div>
		                	
		                	<div class="col-xs-4">
		            			<label class="form-control" for="isbn">ISBN:</label>
		                		<form:input type="text" path="isbn" id="isbn" maxlength="20" placeholder="Digite el Codigo ISBN del Producto" class="form-control input-sm"/>
		                    	<div class="has-error">
		                   			<form:errors path="isbn" class="help-inline"/>
		                    	</div>		                		
		            		</div>
		            	</div>
		            	
		            	<div class="panel-body">
                			<div class="col-xs-4">
                				<label class="form-control" for="fechaCreacion">Fecha de Creaci�n:</label>               		
                    			<form:input type="date" class="form-control imput-sm" path="fechaCreacion" id="fechaCreacion" placeholder="Digite la Fecha de la Creacion de Producto" value="<%=sAhora %>"/>
                    			<div class="has-error">
                    				<form:errors path="fechaCreacion" class="help-inline"/>
                    			</div>
                			</div>
                			
                			<c:choose>
							<c:when test="${edit}">                			              			
		        			<div class="col-xs-4">
		            			<label class="form-control" for="precio">Precio: $</label>		                		
		                		<form:input type="text" min="0" path="precio" id="precio" class="form-control input-sm" placeholder="Digite Costo (##)"/>
		                    </div>
		                    </c:when>
	    					<c:otherwise>
	    					<div class="col-xs-4">
		            			<label class="form-control" for="precio">Precio: $</label>		                		
		                		<form:input type="text" min="0" path="precio" id="precio" class="form-control input-sm" value="0"/>
		                    </div>
	    					</c:otherwise>
	    					</c:choose>
	    					
		                	
		                	<div class="col-xs-4" style="display:none ">
		            			<label class="form-control" for="precio">MARCADO</label>		                		
		                		<form:input type="text"  path="marcado" id="marcado" class="form-control input-sm" value='1' />		                    	
		                	</div>
		                	<div class="col-xs-4" style="display:none ">
		            			<label class="form-control" for="precio">CANTIDAD ETIQUETAS</label>		                		
		                		<form:input type="text"  path="cantidadetiquetar" id="cantidadetiquetar" class="form-control input-sm" value='0' />		                    	
		                	</div>
		                	<c:choose>
							<c:when test="${edit}"> 		                	
		        			<div class="col-xs-4">
		            			<label class="form-control" for="costounitario">Costo Unitario: $</label>
		                		<form:input type="text" min="0" path="costounitario" id="costounitario" class="form-control input-sm" placeholder="Digite Costo (##)"/>
		                    </div>
		                     </c:when>
	    					<c:otherwise>
	    					<div class="col-xs-4">
		            			<label class="form-control" for="costounitario">Costo Unitario: $</label>
		                		<form:input type="text" min="0" path="costounitario" id="costounitario" class="form-control input-sm" value='0'/>
		                    </div>
	    					</c:otherwise>
	    					</c:choose>            	
		            	</div>
		            	
		            	<div class="panel-body">		            			
		        			<div class="col-xs-4">
                    			<label class="form-control" for="especificoGastos">Especif�co de Gastos:</label>
                        		<!--<form:input type="text" path="especificoGastos" id="especificoGastos" class="form-control input-sm"/>-->
                        		<SELECT name="especificoGastos" id="especificoGastos" class="form-control input-sm">
										<OPTION VALUE="">Seleccione el Especif�co de Gastos</OPTION>
										<OPTION VALUE="54101">54101 Productos Alimenticios Para Personas</OPTION>
										<OPTION VALUE="54102">54102 Productos Alimenticios Para Animales</OPTION>
										<OPTION VALUE="54103">54103 Productos Agropecuarios y Forestales</OPTION>
										<OPTION VALUE="54104">54104 Productos Textiles y Vestuarios</OPTION>
										<OPTION VALUE="54105">54105 Productos de Papel y Cart�n</OPTION>
										<OPTION VALUE="54106">54106 Productos de Cuero y Caucho</OPTION>							
										<OPTION VALUE="54107">54107 Producto Qu�micos</OPTION>
										<OPTION VALUE="54108">54108 Productos Farmac�uticos y Medicinales</OPTION>
										<OPTION VALUE="54109">54109 Llantas y Neum�ticos</OPTION>
										<OPTION VALUE="54110">54110 Combustibles y Lubricantes</OPTION>
										<OPTION VALUE="54111">54111 Minerales no Met�licos y Productos Derivados</OPTION>
										<OPTION VALUE="54112">54112 Minerales Met�licos y Productos Derivados</OPTION>	
										<OPTION VALUE="54113">54113 Material e Instrumental de Laboratorio y Uso Medico</OPTION>
										<OPTION VALUE="54114">54114 Material de Oficina</OPTION>
										<OPTION VALUE="54115">54115 Material Inform�tico</OPTION>
										<OPTION VALUE="54116">54116 Libros, textos, �tiles de Ense�anza y Publicaciones</OPTION>
										<OPTION VALUE="54117">54117 Materiales de defensa y Seguridad Publica</OPTION>
										<OPTION VALUE="54118">54118 Herramientas, repuestos y Accesorios</OPTION>
										<OPTION VALUE="54119">54119 Materiales El�ctricos</OPTION>
										<OPTION VALUE="54199">54199 Bienes de Uso y Consumo Diversos</OPTION>				
								</SELECT>
                        		<div class="has-error">
                            		<form:errors path="especificoGastos" class="help-inline"/>
                       	 		</div>             	
               				</div>
               				              		
		        			<div class="col-xs-4">
		            			<label class="form-control" for="pais">Pais:</label>					              	
		                		<!--<form:input type="text" path="pais" id="pais" class="form-control input-sm"/>-->
		                		<select name="pais" id="pais" class="form-control input-sm">
									<option value="AF">Afganist�n</option>
									<option value="AL">Albania</option>
									<option value="DE">Alemania</option>
									<option value="AD">Andorra</option>
									<option value="AO">Angola</option>
									<option value="AI">Anguilla</option>
									<option value="AQ">Ant�rtida</option>
									<option value="AG">Antigua y Barbuda</option>
									<option value="AN">Antillas Holandesas</option>
									<option value="SA">Arabia Saud�</option>
									<option value="DZ">Argelia</option>
									<option value="AR">Argentina</option>
									<option value="AM">Armenia</option>
									<option value="AW">Aruba</option>
									<option value="AU">Australia</option>
									<option value="AT">Austria</option>
									<option value="AZ">Azerbaiy�n</option>
									<option value="BS">Bahamas</option>
									<option value="BH">Bahrein</option>
									<option value="BD">Bangladesh</option>
									<option value="BB">Barbados</option>
									<option value="BE">B�lgica</option>
									<option value="BZ">Belice</option>
									<option value="BJ">Benin</option>
									<option value="BM">Bermudas</option>
									<option value="BY">Bielorrusia</option>
									<option value="MM">Birmania</option>
									<option value="BO">Bolivia</option>
									<option value="BA">Bosnia y Herzegovina</option>
									<option value="BW">Botswana</option>
									<option value="BR">Brasil</option>
									<option value="BN">Brunei</option>
									<option value="BG">Bulgaria</option>
									<option value="BF">Burkina Faso</option>
									<option value="BI">Burundi</option>
									<option value="BT">But�n</option>
									<option value="CV">Cabo Verde</option>
									<option value="KH">Camboya</option>
									<option value="CM">Camer�n</option>
									<option value="CA">Canad�</option>
									<option value="TD">Chad</option>
									<option value="CL">Chile</option>
									<option value="CN">China</option>
									<option value="CY">Chipre</option>
									<option value="VA">Ciudad del Vaticano (Santa Sede)</option>
									<option value="CO">Colombia</option>
									<option value="KM">Comores</option>
									<option value="CG">Congo</option>
									<option value="CD">Congo, Rep�blica Democr�tica del</option>
									<option value="KR">Corea</option>
									<option value="KP">Corea del Norte</option>
									<option value="CI">Costa de Marf�l</option>
									<option value="CR">Costa Rica</option>
									<option value="HR">Croacia (Hrvatska)</option>
									<option value="CU">Cuba</option>
									<option value="DK">Dinamarca</option>
									<option value="DJ">Djibouti</option>
									<option value="DM">Dominica</option>
									<option value="EC">Ecuador</option>
									<option value="EG">Egipto</option>
									<option value="SV" selected>El Salvador</option>
									<option value="AE">Emiratos �rabes Unidos</option>
									<option value="ER">Eritrea</option>
									<option value="SI">Eslovenia</option>
									<option value="ES">Espa�a</option>
									<option value="US">Estados Unidos</option>
									<option value="EE">Estonia</option>
									<option value="ET">Etiop�a</option>
									<option value="FJ">Fiji</option>
									<option value="PH">Filipinas</option>
									<option value="FI">Finlandia</option>
									<option value="FR">Francia</option>
									<option value="GA">Gab�n</option>
									<option value="GM">Gambia</option>
									<option value="GE">Georgia</option>
									<option value="GH">Ghana</option>
									<option value="GI">Gibraltar</option>
									<option value="GD">Granada</option>
									<option value="GR">Grecia</option>
									<option value="GL">Groenlandia</option>
									<option value="GP">Guadalupe</option>
									<option value="GU">Guam</option>
									<option value="GT">Guatemala</option>
									<option value="GY">Guayana</option>
									<option value="GF">Guayana Francesa</option>
									<option value="GN">Guinea</option>
									<option value="GQ">Guinea Ecuatorial</option>
									<option value="GW">Guinea-Bissau</option>
									<option value="HT">Hait�</option>
									<option value="HN">Honduras</option>
									<option value="HU">Hungr�a</option>
									<option value="IN">India</option>
									<option value="ID">Indonesia</option>
									<option value="IQ">Irak</option>
									<option value="IR">Ir�n</option>
									<option value="IE">Irlanda</option>
									<option value="BV">Isla Bouvet</option>
									<option value="CX">Isla de Christmas</option>
									<option value="IS">Islandia</option>
									<option value="KY">Islas Caim�n</option>
									<option value="CK">Islas Cook</option>
									<option value="CC">Islas de Cocos o Keeling</option>
									<option value="FO">Islas Faroe</option>
									<option value="HM">Islas Heard y McDonald</option>
									<option value="FK">Islas Malvinas</option>
									<option value="MP">Islas Marianas del Norte</option>
									<option value="MH">Islas Marshall</option>
									<option value="UM">Islas menores de Estados Unidos</option>
									<option value="PW">Islas Palau</option>
									<option value="SB">Islas Salom�n</option>
									<option value="SJ">Islas Svalbard y Jan Mayen</option>
									<option value="TK">Islas Tokelau</option>
									<option value="TC">Islas Turks y Caicos</option>
									<option value="VI">Islas V�rgenes (EEUU)</option>
									<option value="VG">Islas V�rgenes (Reino Unido)</option>
									<option value="WF">Islas Wallis y Futuna</option>
									<option value="IL">Israel</option>
									<option value="IT">Italia</option>
									<option value="JM">Jamaica</option>
									<option value="JP">Jap�n</option>
									<option value="JO">Jordania</option>
									<option value="KZ">Kazajist�n</option>
									<option value="KE">Kenia</option>
									<option value="KG">Kirguizist�n</option>
									<option value="KI">Kiribati</option>
									<option value="KW">Kuwait</option>
									<option value="LA">Laos</option>
									<option value="LS">Lesotho</option>
									<option value="LV">Letonia</option>
									<option value="LB">L�bano</option>
									<option value="LR">Liberia</option>
									<option value="LY">Libia</option>
									<option value="LI">Liechtenstein</option>
									<option value="LT">Lituania</option>
									<option value="LU">Luxemburgo</option>
									<option value="MK">Macedonia, Ex-Rep�blica Yugoslava de</option>
									<option value="MG">Madagascar</option>
									<option value="MY">Malasia</option>
									<option value="MW">Malawi</option>
									<option value="MV">Maldivas</option>
									<option value="ML">Mal�</option>
									<option value="MT">Malta</option>
									<option value="MA">Marruecos</option>
									<option value="MQ">Martinica</option>
									<option value="MU">Mauricio</option>
									<option value="MR">Mauritania</option>
									<option value="YT">Mayotte</option>
									<option value="MX">M�xico</option>
									<option value="FM">Micronesia</option>
									<option value="MD">Moldavia</option>
									<option value="MC">M�naco</option>
									<option value="MN">Mongolia</option>
									<option value="MS">Montserrat</option>
									<option value="MZ">Mozambique</option>
									<option value="NA">Namibia</option>
									<option value="NR">Nauru</option>
									<option value="NP">Nepal</option>
									<option value="NI">Nicaragua</option>
									<option value="NE">N�ger</option>
									<option value="NG">Nigeria</option>
									<option value="NU">Niue</option>
									<option value="NF">Norfolk</option>
									<option value="NO">Noruega</option>
									<option value="NC">Nueva Caledonia</option>
									<option value="NZ">Nueva Zelanda</option>
									<option value="OM">Om�n</option>
									<option value="NL">Pa�ses Bajos</option>
									<option value="PA">Panam�</option>
									<option value="PG">Pap�a Nueva Guinea</option>
									<option value="PK">Paquist�n</option>
									<option value="PY">Paraguay</option>
									<option value="PE">Per�</option>
									<option value="PN">Pitcairn</option>
									<option value="PF">Polinesia Francesa</option>
									<option value="PL">Polonia</option>
									<option value="PT">Portugal</option>
									<option value="PR">Puerto Rico</option>
									<option value="QA">Qatar</option>
									<option value="UK">Reino Unido</option>
									<option value="CF">Rep�blica Centroafricana</option>
									<option value="CZ">Rep�blica Checa</option>
									<option value="ZA">Rep�blica de Sud�frica</option>
									<option value="DO">Rep�blica Dominicana</option>
									<option value="SK">Rep�blica Eslovaca</option>
									<option value="RE">Reuni�n</option>
									<option value="RW">Ruanda</option>
									<option value="RO">Rumania</option>
									<option value="RU">Rusia</option>
									<option value="EH">Sahara Occidental</option>
									<option value="KN">Saint Kitts y Nevis</option>
									<option value="WS">Samoa</option>
									<option value="AS">Samoa Americana</option>
									<option value="SM">San Marino</option>
									<option value="VC">San Vicente y Granadinas</option>
									<option value="SH">Santa Helena</option>
									<option value="LC">Santa Luc�a</option>
									<option value="ST">Santo Tom� y Pr�ncipe</option>
									<option value="SN">Senegal</option>
									<option value="SC">Seychelles</option>
									<option value="SL">Sierra Leona</option>
									<option value="SG">Singapur</option>
									<option value="SY">Siria</option>
									<option value="SO">Somalia</option>
									<option value="LK">Sri Lanka</option>
									<option value="PM">St Pierre y Miquelon</option>
									<option value="SZ">Suazilandia</option>
									<option value="SD">Sud�n</option>
									<option value="SE">Suecia</option>
									<option value="CH">Suiza</option>
									<option value="SR">Surinam</option>
									<option value="TH">Tailandia</option>
									<option value="TW">Taiw�n</option>
									<option value="TZ">Tanzania</option>
									<option value="TJ">Tayikist�n</option>
									<option value="TF">Territorios franceses del Sur</option>
									<option value="TP">Timor Oriental</option>
									<option value="TG">Togo</option>
									<option value="TO">Tonga</option>
									<option value="TT">Trinidad y Tobago</option>
									<option value="TN">T�nez</option>
									<option value="TM">Turkmenist�n</option>
									<option value="TR">Turqu�a</option>
									<option value="TV">Tuvalu</option>
									<option value="UA">Ucrania</option>
									<option value="UG">Uganda</option>
									<option value="UY">Uruguay</option>
									<option value="UZ">Uzbekist�n</option>
									<option value="VU">Vanuatu</option>
									<option value="VE">Venezuela</option>
									<option value="VN">Vietnam</option>
									<option value="YE">Yemen</option>
									<option value="YU">Yugoslavia</option>
									<option value="ZM">Zambia</option>
									<option value="ZW">Zimbabue</option>
								</select>
		                		<div class="has-error">
		                			<form:errors path="pais" class="help-inline"/>
		                		</div>
		            		</div>
		            				            		
                			<div class="col-xs-4">
                    			<label class="form-control" for="consignacion">Consignaci�n:</label>
                        		<!--<form:input type="text" path="consignacion" id="consignacion" class="form-control input-sm"/>-->
                        		<SELECT name="consignacion" id="consignacion" class="form-control input-sm">
									<OPTION VALUE="si">S�</OPTION>
									<OPTION VALUE="no">No</OPTION>							
								</SELECT>
                        		<div class="has-error">
                            		<form:errors path="consignacion" class="help-inline"/>
                        		</div>                   	
                			</div>
            			</div>
            			
            			<div class="panel-body">
							<div class="col-xs-6">
								<label class="form-control" for="location">Subir Portada:</label>
								<form:input type="file" path="location" id="location" class="form-control input-sm"/>
								<div class="has-error">
									<form:errors path="location" class="help-inline"/>
								</div>
							</div>
							
							<div class="col-xs-6">
								<label class="form-control" for="locationc">Subir Contraportada:</label>
								<form:input type="file" path="locationc" id="locationc" class="form-control input-sm"/>
								<div class="has-error">
									<form:errors path="locationc" class="help-inline"/>
								</div>
							</div>
						</div>
            		</div>		            				            	
		          </div>		            			            			            		
		       </div>
		            
	            
            		        
		         <div class="row">
		        	<div class="form-group col-md-12" style="display:none ">
		            	<label class="col-md-3 control-lable" for="existencia">Sala:</label>
		                <div class="col-md-7">
		                	<form:input type="text" path="sala" id="sala"  class="form-control input-sm" value="0"/>		                    		                   
		                </div>
		                
		            </div>
		        </div>
		                         	        		        		        		            		     		         		          		       	        		                    	            	            	           	            	           	          	            													     
		        <div class="row">
		             <div class="form-actions floatRight" align="center">
		                  <c:choose>
		                      <c:when test="${edit}">
		                          <input type="submit" value="Actualizar Producto" class="btn btn-primary btn-sm" onclick="alert('Se actualizo el producto')"/> |||
		                          <a href="<c:url value='/producto-list' />" class="btn btn-primary btn-sm">Cancelar</a>
		                      </c:when>
		                      <c:otherwise>
		                          <input type="submit" value="Registrar Producto" class="btn btn-primary btn-sm" onclick="validar(); validar2(); validar3(); validar4();"/> |||
		                          <a href="<c:url value='/producto-list' />" class="btn btn-primary btn-sm">Cancelar</a>
		                      </c:otherwise>
		                  </c:choose>
		             </div>
		        </div>
		        
		</form:form>
	   </div>
    </div>
<div class="row"><%@include file="foot.jsp" %></div>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>