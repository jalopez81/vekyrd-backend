const getErrorHtml = (statusCode, message) => {
	return `
		<html>
			<head>
				<title>Error ${statusCode}</title>
			</head>
			<body>
				<h1>Error ${statusCode}</h1>
				<p>${message}</p>

				<style>
					body {
						font-family: sans-serif;
						text-align: center;
					}
						
					h1 {
						color: gray;
						font-size: 40px;
					}

					p {
						color: red;
						font-size: 20px;
					}
				</style>
			</body>
		</html>
	`;
};

export default getErrorHtml;