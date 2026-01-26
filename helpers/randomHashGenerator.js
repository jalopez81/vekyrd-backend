export const randomHashGenerator = () => {
	const orderId = Math.random().toString(36).substring(2, 3) + Math.random().toString(36).substring(2, 13);
	return orderId;
};