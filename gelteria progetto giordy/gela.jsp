<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Gelateria</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>Gelateria</h1>
	<p>Benvenuti alla nostra gelateria! Scegli il tuo gusto preferito e quantità, poi clicca sul pulsante "Aggiungi all'ordine". Puoi rimuovere l'ultimo gelato dall'ordine cliccando sul pulsante "Rimuovi ultimo gelato".</p>
	<form action="gelateria.jsp" method="post">
		<label for="flavor">Gusto:</label>
		<select id="flavor" name="flavor">
			<option value="Cioccolato">Cioccolato</option>
			<option value="Vaniglia">Vaniglia</option>
			<option value="Fragola">Fragola</option>
			<option value="Limone">Limone</option>
			<option value="Pistacchio">Pistacchio</option>
		</select>
		<br>
		<label for="quantity">Quantità:</label>
		<input type="number" id="quantity" name="quantity" value="1">
		<br>
		<button type="submit" name="action" value="add">Aggiungi all'ordine</button>
		<button type="submit" name="action" value="remove">Rimuovi ultimo gelato</button>
	</form>
	<h2>Ordine:</h2>
	<ul id="order-list">
		<%
			// Controlla se l'ordine è stato inizializzato
			if (session.getAttribute("order") == null) {
				session.setAttribute("order", new java.util.ArrayList<String>());
			}
			
			// Aggiungi o rimuovi il gelato dall'ordine a seconda dell'azione selezionata dall'utente
			String action = request.getParameter("action");
			if (action != null) {
				java.util.ArrayList<String> order = (java.util.ArrayList<String>) session.getAttribute("order");
				if (action.equals("add")) {
					String flavor = request.getParameter("flavor");
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					String item = quantity + " x " + flavor + " gelato";
					order.add(item);
				} else if (action.equals("remove")) {
					if (!order.isEmpty()) {
						order.remove(order.size() - 1);
					}
				}
			}
			
			// Stampa la lista dell'ordine
			java.util.ArrayList<String> order = (java.util.ArrayList<String>) session.getAttribute("order");
			for (String item : order) {
				out.println("<li>" + item + "</li>");
			}
		%>
	</ul>
</body>
</html>
