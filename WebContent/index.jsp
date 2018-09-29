<%@page import="com.sun.glass.ui.CommonDialogs.Type"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="hellow.Persona"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to this site</title>
</head>
<body>
	<h1>Hello World!..</h1>
	<%
		Persona persona1 = new Persona("César Augusto", "Cervantes Camargo");
		persona1.setDireccion("CR 104 # 75 87");
		persona1.setCorreo("pruebas@pruebas.com");
		persona1.setTelefono("+57 5 3333333");
		Persona persona2 = new Persona("Jhonatan Alberto", "Consuegra Lara");
		persona2.setDireccion("CR 42D # 80A 94 ");
		persona2.setCorreo("eljohn25@hotmail.com");
		persona2.setTelefono("+57 5 3509509");
		Persona persona3 = new Persona("William Alberto", "Pareja Navarro");
		persona3.setDireccion("CR 46 # 105 87");
		persona3.setCorreo("wpareja@pruebas.com");
		persona3.setTelefono("+57 5 3339999999");
		Persona persona4 = new Persona("Victor Manuel", "Peralta Martinez");
		persona4.setDireccion("CL 106 # 84 254 Torre 1 Apto 501");
		persona4.setCorreo("elvictor@pruebas.com");
		persona4.setTelefono("+57 5 654789");
		ArrayList<Persona> listado = new ArrayList<Persona>();
		listado.add(persona1);
		listado.add(persona2);
		listado.add(persona3);
		listado.add(persona4);
	%>
	<table border="1">
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Direción</th>
				<th>Correo</th>
				<th>Telefono</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Persona persona : listado) {
					out.print("<tr>");
					out.print("<td>" + persona.getNombreCompleto() + "</td>");
					out.print("<td>" + persona.getDireccion() + "</td>");
			%><td><%=persona.getCorreo()%></td>
			<%
				
			%><td><%=persona.getTelefono()%></td>
			<%
				out.print("</tr>");
				}
			%>
		</tbody>
	</table>

</body>
</html>