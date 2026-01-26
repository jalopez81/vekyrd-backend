export const extractHtml = (htmlString) => {
	let htmlContent = htmlString.replace(/```html\n|```/g, '');
	htmlContent = htmlContent.replace(/\n/g, '');
	return htmlContent;
};
