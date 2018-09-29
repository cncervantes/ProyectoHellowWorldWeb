<%@page import="com.sun.glass.ui.CommonDialogs.Type"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hellow.Conexion"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to this site</title>
</head>
<body>
	<h1>Hello World!..+ Conexión era una bd remota asi que si no hay datos busque su propia bd</h1>
	<%
		Conexion conexion = new Conexion();
		if(conexion.abrirConexion()){	
			String salida = conexion.consultar("Select * From Users");
			out.print(salida);
			out.print("</br>");
			out.print("</br>");
			out.print("</br>");			
			salida = conexion.consultar("SHOW FULL TABLES");
			out.print(salida);
			out.print("</br>");
			out.print("</br>");
			out.print("</br>");
			salida = conexion.consultar("Show Tables");
			out.print(salida);
			out.print("</br>");
			out.print("</br>");
			out.print("</br>");
			salida = conexion.consultar("Desc Users");
			out.print(salida);			
			conexion.cerrarConexion();
		}
	%>	

</body>
</html>