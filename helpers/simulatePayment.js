export const simulatePayment = async (cardDetails) => {
	const { number, expiry, cvc } = cardDetails;

	const paymentSuccess = true;


	if (number && expiry && cvc) {
		await new Promise((resolve) => setTimeout(resolve, 2000));
		return paymentSuccess;
	}
}
