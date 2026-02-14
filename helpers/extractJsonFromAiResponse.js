export const extractJsonFromAiResponse = (jsonStr) => {
	try {		
		const jsonString = jsonStr.replace(/```json\n|```/g, '');
		const jsonData = JSON.parse(jsonString);

		return jsonData;
	} catch (error) {
		console.error('Invalid JSON:', error);
		return [];
	}
};
