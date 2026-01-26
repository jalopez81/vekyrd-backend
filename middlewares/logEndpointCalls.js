import chalk from 'chalk';

let logsCounter = 0;

const logEndpointCalls = () => (req, res, next) => {
	const { method, url, body } = req;

	logsCounter++;

	if (logsCounter % 100 === 0) {
		console.clear();
	}

	console.log();
	console.log(`------------------------- ${chalk.gray(logsCounter)} ----------------------------`)
	console.log(`${chalk.yellow.bold(method)} ${chalk.green(url)}`)
	if (res.statusCode >= 400) {
		console.log(chalk.red('Status:'), res.statusCode);
	} else {
		console.log(chalk.green('Status:'), res.statusCode);
	}
	(Object.keys(body).length > 0) && console.log(chalk.blue('Body:'), body);
	next();
};

export default logEndpointCalls;

