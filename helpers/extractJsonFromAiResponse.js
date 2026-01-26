export const extractJsonFromAiResponse = (apiResponse) => {
	try {
		const content = apiResponse.choices[0].message.content;
		const jsonString = content.replace(/```json\n|```/g, '');
		const jsonData = JSON.parse(jsonString);

		return jsonData;
	} catch (error) {
		console.error('Invalid JSON:', error);
		return [];
	}
};
