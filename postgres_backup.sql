--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-30 23:25:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4906 (class 1262 OID 16407)
-- Name: vekyrd-ecommerce-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "vekyrd-ecommerce-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "vekyrd-ecommerce-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='vekyrd-ecommerce-db'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4883 (class 0 OID 24609)
-- Dependencies: 218
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, quantity, user_id, created_at, updated_at, order_id, total_price) FROM stdin;
581	14	1	3	2024-12-29 20:09:57.81219	2024-12-29 20:09:57.81219	3	10.49
582	1	5	3	2024-12-29 20:09:57.815916	2024-12-29 20:09:57.815916	3	54.95
583	14	1	3	2024-12-29 20:09:58.076393	2024-12-29 20:09:58.076393	3	10.49
584	1	5	3	2024-12-29 20:09:58.078704	2024-12-29 20:09:58.078704	3	54.95
585	28	1	3	2024-12-30 10:40:07.391384	2024-12-30 10:40:07.391384	152	14.49
586	9	3	3	2024-12-30 10:40:07.404757	2024-12-30 10:40:07.404757	152	44.97
587	28	1	3	2024-12-30 10:40:07.657492	2024-12-30 10:40:07.657492	152	14.49
588	9	3	3	2024-12-30 10:40:07.65987	2024-12-30 10:40:07.65987	152	44.97
589	11	2	3	2024-12-30 10:41:01.765106	2024-12-30 10:41:01.765106	153	13.98
1	1	2	7	2023-12-01 10:10:00	2023-12-01 10:20:00	1	50.00
2	2	1	7	2023-12-01 10:15:00	2023-12-01 10:25:00	1	50.00
3	2	3	7	2023-12-01 11:10:00	2023-12-01 11:20:00	2	150.00
4	3	1	7	2023-12-01 11:15:00	2023-12-01 11:25:00	2	50.00
5	3	2	3	2023-12-02 14:35:00	2023-12-02 14:45:00	3	50.00
6	4	1	4	2023-12-03 16:50:00	2023-12-03 17:00:00	4	100.00
7	4	1	4	2023-12-03 16:55:00	2023-12-03 17:05:00	4	200.00
8	5	1	5	2023-12-04 18:05:00	2023-12-04 18:15:00	5	80.00
9	6	2	6	2023-12-05 12:20:00	2023-12-05 12:30:00	6	120.00
10	6	1	7	2023-12-06 10:35:00	2023-12-06 10:45:00	7	220.00
11	6	1	8	2023-12-07 14:55:00	2023-12-07 15:05:00	8	45.00
12	7	1	7	2023-12-08 17:30:00	2023-12-08 17:40:00	9	400.00
13	16	3	14	2023-12-09 11:45:00	2023-12-09 11:55:00	10	95.00
14	11	2	14	2023-12-10 15:25:00	2023-12-10 15:35:00	11	180.00
15	5	1	14	2023-12-11 19:10:00	2023-12-11 19:20:00	12	250.00
16	10	2	13	2023-12-12 13:15:00	2023-12-12 13:25:00	13	130.00
17	14	1	14	2023-12-13 17:00:00	2023-12-13 17:10:00	14	175.00
18	11	1	15	2023-12-14 09:50:00	2023-12-14 10:00:00	15	60.00
19	9	2	3	2023-12-02 14:40:00	2023-12-02 14:50:00	3	100.00
20	8	1	7	2023-12-06 10:40:00	2023-12-06 10:50:00	7	80.00
21	14	1	14	2023-12-10 15:30:00	2023-12-10 15:40:00	11	95.00
22	16	1	14	2023-12-13 17:05:00	2023-12-13 17:15:00	14	200.00
23	12	1	5	2023-12-04 18:10:00	2023-12-04 18:20:00	5	80.00
24	11	2	6	2023-12-05 12:25:00	2023-12-05 12:35:00	6	240.00
25	11	1	7	2023-12-08 17:35:00	2023-12-08 17:45:00	9	200.00
26	6	1	8	2023-12-07 15:00:00	2023-12-07 15:10:00	8	45.00
\.


--
-- TOC entry 4900 (class 0 OID 73813)
-- Dependencies: 235
-- Data for Name: inventory_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_history (id, date, operation_type, quantity, product_id) FROM stdin;
19	2024-12-30 10:41:01.762899	salida	2	11
20	2024-12-30 10:56:50.498348	actualizacion	9	9
21	2024-12-30 19:06:55.607105	actualizacion	8	28
\.


--
-- TOC entry 4889 (class 0 OID 40984)
-- Dependencies: 224
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity, price) FROM stdin;
100	3	14	1	10.49
101	3	1	5	10.99
102	3	14	1	10.49
103	3	1	5	10.99
104	152	28	1	14.49
105	152	9	3	14.99
106	152	28	1	14.49
107	152	9	3	14.99
108	153	11	2	6.99
\.


--
-- TOC entry 4887 (class 0 OID 32792)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, status, total_price, created_at, confirmation_number, order_hash, subtotal, shipping, taxes, payment_method) FROM stdin;
153	3	paid	208.25	2024-12-30 10:41:01.752405	4ghe23pbzbg	w2hvvp76w7ex	6.99	200.00	1.26	\N
1	7	completed	115.00	2024-12-31 03:22:20.421816	CN001	HASH001	100.00	5.00	10.00	Credit Card
2	7	completed	223.00	2024-11-17 13:16:12.956926	CN002	HASH002	200.00	8.00	15.00	PayPal
4	4	completed	335.00	2024-12-05 20:48:29.663489	CN004	HASH004	300.00	10.00	25.00	Debit Card
5	5	completed	93.00	2024-11-26 06:19:13.144809	CN005	HASH005	80.00	5.00	8.00	PayPal
8	8	pending	55.00	2024-11-26 19:08:00.631554	CN008	HASH008	45.00	5.00	5.00	Credit Card
9	7	completed	442.00	2024-11-01 11:09:30.997443	CN009	HASH009	400.00	12.00	30.00	Debit Card
10	14	completed	109.00	2024-11-21 09:33:28.75189	CN010	HASH010	95.00	6.00	8.00	PayPal
11	14	completed	204.00	2024-12-16 02:49:28.359584	CN011	HASH011	180.00	9.00	15.00	Credit Card
14	14	completed	197.00	2024-12-08 16:48:03.491761	CN014	HASH014	175.00	7.00	15.00	PayPal
6	6	cancelled	137.00	2024-03-01 06:21:09.34248	CN006	HASH006	120.00	7.00	10.00	Credit Card
7	7	completed	249.00	2024-03-29 21:37:05.851172	CN007	HASH007	220.00	9.00	20.00	PayPal
12	14	completed	280.00	2024-05-02 18:35:44.069776	CN012	HASH012	250.00	10.00	20.00	Credit Card
13	13	pending	148.00	2024-05-25 03:35:38.829929	CN013	HASH013	130.00	8.00	10.00	Debit Card
15	15	completed	70.00	2024-05-13 11:47:13.493113	CN015	HASH015	60.00	5.00	5.00	Credit Card
3	3	paid	225.35	2024-02-22 20:09:58.048463	CN003	HASH003	21.48	200.00	3.87	Credit Card
152	3	paid	234.79	2024-12-30 10:40:07.638787	g9r688hrch6	yykz5o2pq3wi	29.48	200.00	5.31	\N
\.


--
-- TOC entry 4893 (class 0 OID 65560)
-- Dependencies: 228
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_reviews (id, user_id, product_id, rating, comment, created_at) FROM stdin;
84	6	16	1	fewfwefwef	2024-12-22 10:54:57.819682
85	7	16	1	wfefwefwefew	2024-12-22 10:55:13.575461
87	8	28	1	aaaaaaaa	2024-12-22 10:56:02.737412
89	4	28	5	a	2024-12-22 10:56:55.097816
91	12	16	4	Es un producto excelente.	2024-12-23 00:00:42.288429
92	3	4	5	bwsagbliaij;olksaj	2024-12-25 00:09:47.069008
94	12	18	4	ESte producto es fantastico	2024-12-25 18:53:41.642939
83	5	16	4	wfwefqaewqfwefwefweewfwe	2024-12-22 10:53:37.773107
86	7	28	2	wfefwefwe	2024-12-22 10:55:37.175304
88	3	28	5	ffff	2024-12-22 10:56:28.858959
90	5	28	5	s	2024-12-22 10:57:22.165124
93	3	16	4	ajofewjiofwefwe	2024-12-25 01:43:35.88271
\.


--
-- TOC entry 4891 (class 0 OID 57368)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, stock, imageurl, sku, description_large, average_rating, category) FROM stdin;
28	Spray protector térmico	Spray con protección térmica avanzada	88.88	8	/img/products/spray1.jpg	SKU92f1be	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.60	otros
9	Mascarilla capilar	Mascarilla nutritiva para el cabello seco	14.99	9	/img/products/conditioner1.jpg	SKU3dc938	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	shampoo
7	Loción capilar fortalecedora	Loción para fortalecer y nutrir el cabello	15.99	0	/img/products/cream1.jpg	SKUd9e5d7	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
25	Shampoo hidratante	Shampoo intensivo hidratante para cabello seco	12.49	68	/img/products/shampoo1.jpg	SKU5599bb	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	spray
8	Gel de ducha	Gel de ducha suave con fragancia fresca	5.99	3333	/img/products/gel2.jpg	SKUf9cf12	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
11	Crema de peinar	Crema ligera para peinar y suavizar el cabello	6.99	6	/img/products/cream2.jpg	SKU81485a	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
22	Acondicionador nutritivo	Acondicionador hidratante para cabellos secos	9.49	100	/img/products/conditioner2.jpg	SKUa8027c	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
15	Gel fijador	Gel para fijar el cabello con un acabado natural	8.49	61	/img/products/gel1.jpg	SKU946128	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
23	Crema de peinar	Crema suave para peinar sin dejar residuos	7.49	16	/img/products/cream2.jpg	SKUef1038	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
19	Loción capilar fortalecedora	Fortalece el cabello desde la raíz	17.99	90	/img/products/cream1.jpg	SKUa7ed60	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
4	Spray protector térmico	Protege el cabello del daño del calor	12.99	9	/img/products/spray1.jpg	SKUf57d61	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	5.00	otros
18	Shampoo para niños	Shampoo para cabellos suaves de los niños	10.99	63	/img/products/shampoo1.jpg	SKUfb8c41	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	4.00	goteros
14	Shampoo para cabellos grasos	Shampoo control de grasa para cabellos grasos	10.49	85	/img/products/shampoo2.jpg	SKU19a58b	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
5	Champú anti-caída	Shampoo especialmente formulado para combatir la caída del cabello	13.49	88	/img/products/shampoo3.jpg	SKU4cc9e0	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	spray
27	Gel fijador	Gel fijador con brillo natural	7.49	2	/img/products/gel1.jpg	SKUcfb24a	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	goteros
24	Aceite de argán	Aceite de argán puro para un cabello brillante	21.99	88	/img/products/oil1.jpg	SKU8ceaf5	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
21	Mascarilla capilar	Mascarilla reparadora para cabello dañado	16.99	47	/img/products/conditioner1.jpg	SKU24895c	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
2	Shampoo para cabellos grasos	Shampoo para cabellos con exceso de grasa	11.49	66	/img/products/shampoo2.jpg	SKU6099de	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
26	Shampoo para cabellos grasos	Shampoo de control de grasa con menta	10.99	65	/img/products/shampoo2.jpg	SKU289ad1	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	spray
29	Champú anti-caída	Champú revitalizante para reducir la caída del cabello	13.99	2	/img/products/shampoo3.jpg	SKU6ad7db	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	1.00	goteros
17	Champú anti-caída	Champú que fortalece el cuero cabelludo	12.99	33	/img/products/shampoo3.jpg	SKU3fa2ab	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	otros
16	Spray protector térmico	Protección contra el calor de planchas y secadores	13.49	12	/img/products/spray1.jpg	SKUc3b5a8	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	2.80	otros
30	Shampoo para niños	Shampoo para niños con aloe vera y manzanilla	9.49	13	/img/products/shampoo1.jpg	SKUd9e511	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	acondicionador
1	Shampoo hidratante	Shampoo para cabellos secos	10.99	39	/img/products/shampoo1.jpg	SKUc20dfe	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	goteros
12	Aceite de argán	Aceite natural de argán para la hidratación profunda	19.99	98	/img/products/oil1.jpg	SKUc87c5a	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	shampoo
13	Shampoo hidratante	Shampoo hidratante para todo tipo de cabello	11.99	97	/img/products/shampoo1.jpg	SKU17418a	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	acondicionador
10	Acondicionador nutritivo	Acondicionador para restaurar la hidratación del cabello	8.49	9	/img/products/conditioner2.jpg	SKU8ae709	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	shampoo
3	Gel fijador	Gel para fijar el cabello con efecto fuerte	7.99	2	/img/products/gel1.jpg	SKU25c0f5	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	cremas
6	Shampoo para niños	Shampoo suave para el cabello de los niños	9.99	78	/img/products/shampoo1.jpg	SKUe2b423	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	cremas
20	Gel de ducha	Gel de ducha hidratante con aceites naturales	6.99	6	/img/products/gel2.jpg	SKUa2132b	Este shampoo hidratante está especialmente diseñado para restaurar la hidratación del cabello seco, dañado o deshidratado. Gracias a su fórmula avanzada, rica en ingredientes naturales como aceites esenciales, proteínas y extractos de plantas, proporciona una hidratación profunda y duradera desde la raíz hasta las puntas. Su acción nutritiva ayuda a suavizar la fibra capilar, reparando el daño y mejorando la textura del cabello, dejándolo más suave, brillante y manejable. Ideal para todo tipo de cabellos, especialmente aquellos que sufren de resequedad debido a factores ambientales, el uso excesivo de productos de styling o la exposición al sol y al agua salada. Al usarlo de manera regular, no solo notarás un cabello más hidratado, sino también fortalecido, con un aspecto saludable y radiante. Este shampoo es perfecto para quienes buscan una solución eficaz para combatir la falta de humedad y restaurar el equilibrio natural de su cabello. 	3.00	goteros
\.


--
-- TOC entry 4898 (class 0 OID 65600)
-- Dependencies: 233
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionnaire (id, user_id, hair_type, hair_length, scalp_condition, current_issues, goals, created_at) FROM stdin;
1	3	liso	medio	No tiene problemas	Muy reseco	volumen e hidratacion	2024-12-25 02:44:15.311216
2	3	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 03:04:32.379239
3	3	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 03:06:43.054751
4	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 10:29:24.984818
5	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 10:29:25.132841
6	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 10:34:24.505069
7	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 10:34:24.591275
8	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 11:53:29.862599
9	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 11:53:48.100276
10	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 11:54:54.135751
11	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 11:55:16.662269
12	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:05:53.789272
13	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:06:55.777953
14	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:08:00.031458
15	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:08:32.876457
16	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:10:12.054901
17	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:11:02.577453
18	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:14:17.003951
19	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:16:18.278263
20	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:18:38.350034
21	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:19:46.822247
22	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:21:08.610425
23	12	rizado	corto	saludable	pelo muy reseco	El pelo brilloso y manejable	2024-12-25 12:23:30.573269
24	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:31:21.155352
25	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:39:25.499147
26	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:43:43.47047
27	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:44:39.736651
28	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 12:52:04.250627
29	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:01:31.941699
30	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:10:10.024902
31	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:10:49.35115
32	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:12:09.119883
33	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:19:48.197972
34	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:27:19.746441
35	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:27:53.31577
36	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:28:36.069178
37	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:31:36.144569
38	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:32:19.758035
39	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:34:56.864134
40	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:47:23.768468
41	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:47:23.845858
42	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 13:48:32.653178
43	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:01:37.292287
44	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:07:04.743735
45	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:07:44.010087
46	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:08:50.751303
47	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:08:51.019888
48	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:09:13.358718
49	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:09:36.24597
50	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:10:00.782021
51	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:10:33.194071
52	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:10:50.944489
53	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:11:37.563431
54	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:11:41.147382
55	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:11:45.726494
56	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:12:02.242276
57	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:12:14.298973
58	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:13:27.819335
59	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:13:40.716672
60	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:13:59.835742
61	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:14:48.509231
62	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:15:40.942914
63	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:18:09.449315
64	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:18:50.2424
65	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:19:04.922728
66	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:19:42.221047
67	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:20:10.574017
68	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:20:10.779963
69	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:20:36.269808
70	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:21:43.851413
71	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:22:13.432577
72	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:24:54.223967
73	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:24:54.231322
74	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:27:01.772586
75	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:27:15.413179
76	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:27:28.933137
77	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:28:02.184787
78	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:31:43.589148
79	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:32:17.843829
80	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:33:45.824397
81	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:34:16.395855
82	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:34:57.395874
83	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:35:57.14365
84	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:36:09.232667
85	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:37:06.224674
86	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:37:12.839707
87	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:37:17.809124
88	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:37:24.333889
89	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:37:30.118015
90	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:39:41.514576
91	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:40:44.215473
92	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:42:17.665268
93	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:42:58.660529
94	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:43:52.203752
95	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:44:09.970281
96	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:45:08.364723
97	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:45:19.184813
98	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:45:23.76248
99	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:47:59.78039
100	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:48:11.284892
101	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:49:23.552195
102	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:49:43.898663
103	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:51:38.116859
104	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:53:30.351046
105	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:53:39.567813
106	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:53:52.817055
107	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:53:57.956022
108	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:54:26.882323
109	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 14:54:33.665513
110	12	liso	largo	saludable	necesito spray	quiero un spray para el pelo	2024-12-25 14:55:09.488355
111	12	liso	largo	saludable	necesito spray	quiero un spray para el pelo	2024-12-25 14:55:17.224719
112	12	liso	largo	saludable	necesito spray	quiero un spray para el pelo	2024-12-25 14:55:23.72642
113	12	liso	largo	saludable	el calor daña mi pelo	quiero un spray para el pelo	2024-12-25 14:56:31.922802
114	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:03:29.829722
115	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:03:46.266623
116	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:03:56.589477
179	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:49:19.183424
117	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:06:09.626815
118	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:07:50.763671
119	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:08:19.169417
120	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:09:14.981495
121	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:10:58.155163
122	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:11:05.077335
123	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:11:49.627048
124	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:11:52.729593
125	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:46:40.139083
126	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 15:47:46.338592
127	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:12:27.626689
128	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:13:57.112538
129	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:17:45.28184
130	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:18:06.469045
131	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:29:00.936519
132	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:29:47.83307
133	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:31:26.992301
134	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:32:08.086252
135	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:33:08.696929
136	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:33:53.743497
137	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:34:38.533316
138	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:34:51.77599
139	12	liso	largo	saludable	pelo muy reseco	quiero mejorar mi cabello y que se vea mas saludable	2024-12-25 16:35:40.417254
140	12	liso	largo	saludable	El calor afecta mi pelo	necesito un spray	2024-12-25 16:43:03.381903
141	12						2024-12-25 16:53:20.576044
142	12						2024-12-25 16:54:32.695221
143	12						2024-12-25 17:01:42.357144
144	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:05:26.166001
145	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:07:49.881561
146	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:08:35.641434
147	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:09:50.875159
148	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:11:33.457533
149	12	rizado	largo	saludable	resequedad por el calor	quiero ufffffggn spray para cuidarlo del calor	2024-12-25 17:25:26.299784
150	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:27:56.781312
151	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:31:25.081492
152	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:32:06.336297
153	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:33:13.154951
154	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:39:38.779726
155	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:40:45.263376
156	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:41:57.558671
157	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:44:39.48081
158	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:51:04.140616
159	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:51:36.552588
160	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 17:53:49.887839
161	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:00:42.66876
162	12	rizado	corto	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:01:13.85573
163	12	rizado	corto	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:01:26.885869
164	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:04:02.566888
165	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:21:35.972235
166	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:24:48.173903
167	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:27:34.79858
168	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:27:46.470455
169	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:28:02.522737
170	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:28:50.474653
171	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:34:22.892281
172	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:39:45.393575
173	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:41:10.049575
174	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:42:39.31387
175	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:42:55.815371
176	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:43:37.598579
177	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:44:28.990319
178	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:47:38.39465
180	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:49:36.087232
181	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:50:34.951971
182	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:50:56.531018
183	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:51:55.778974
184	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:52:38.819158
185	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:54:08.849341
186	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:54:35.296702
187	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:57:53.350142
188	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 18:58:58.26008
189	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:01:13.954264
190	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:01:23.953374
191	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:06:00.216605
192	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:06:41.765174
193	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:07:00.837349
194	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:10:16.156931
195	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:15:27.420736
196	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:15:57.599033
197	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:16:44.111158
198	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:17:41.483809
199	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:17:50.788188
200	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:18:16.694815
201	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:23:03.912907
202	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:23:13.718468
203	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:24:10.709434
204	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:24:24.631745
205	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:24:42.44297
206	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:26:29.088952
207	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:27:44.545516
208	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:29:40.985405
209	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:30:06.985179
210	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:35:04.885236
211	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:35:27.42133
212	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:35:39.303731
213	12	liso	medio	cabello graso	necesito spray	cuidarlo del calor	2024-12-25 19:36:29.403442
214	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 19:38:24.975461
215	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 22:56:45.426973
216	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 22:59:02.26733
217	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 22:59:13.954399
218	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 23:02:50.051476
219	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 23:03:15.045031
220	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-25 23:04:54.585247
221	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-26 09:37:19.997591
222	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-26 09:38:40.789835
223	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-26 09:47:34.086082
224	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-26 09:52:35.050485
225	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-27 00:11:52.868757
226	12	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-27 00:12:14.896599
227	12	liso	corto	saludable	resequedad por el calor	quiero probar distintos colores	2024-12-27 00:13:59.503013
228	12	liso	corto	saludable	resequedad por el calor	quiero probar distintos colores	2024-12-27 00:17:19.41134
229	12	liso	corto	saludable	resequedad por el calor	quiero probar distintos colores	2024-12-27 00:17:44.420739
230	12	liso	corto	saludable	resequedad por el calor	quiero probar distintos colores	2024-12-27 00:18:43.260561
231	12	rizado	largo	saludable	resequedad por el calor	quiero usar distintos colores	2024-12-27 00:19:17.129369
232	12	rizado	largo	saludable	resequedad por el calor	quiero usar distintos colores	2024-12-27 00:20:24.021179
233	12	rizado	largo	saludable	resequedad por el calor	quiero usar distintos colores	2024-12-27 00:21:03.726513
234	12	rizado	largo	saludable	resequedad por el calor	quiero usar distintos colores	2024-12-27 00:21:13.001551
235	12	rizado	largo	saludable	resequedad por el calor	quiero usar distintos colores	2024-12-27 00:21:44.016361
236	12	rizado	largo	saludable	resequedad por el calor	quiero tener el cabello mas hidratado	2024-12-27 00:22:59.539462
237	12	rizado	largo	saludable	resequedad por el calor	se me rompen las hebras	2024-12-27 00:24:13.392767
238	3	rizado	largo	saludable	resequedad por el calor	quiero cabello hidratado	2024-12-28 01:42:00.991632
239	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-28 02:13:40.329131
240	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-28 12:00:56.852646
241	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-28 12:09:09.489152
242	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-28 12:09:40.58789
243	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-30 19:10:20.597777
244	3	rizado	largo	saludable	resequedad por el calor	quiero un spray para cuidarlo del calor	2024-12-30 19:12:31.517266
\.


--
-- TOC entry 4894 (class 0 OID 65582)
-- Dependencies: 229
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role) FROM stdin;
5	administrator
5	customer
6	administrator
7	administrator
7	moderator
8	moderator
3	moderator
3	customer
3	admin
12	admin
12	moderator
12	customer
\.


--
-- TOC entry 4885 (class 0 OID 24624)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, created_at) FROM stdin;
5	maria04	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	maria015@gmail.com	2024-12-01 15:55:46.361159
6	maria05	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	mariaww03@gmail.com	2024-12-01 15:55:46.361159
7	maria06	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	marierea03@gmail.com	2024-12-01 15:55:46.361159
8	maria07	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	marirerea03@gmail.com	2024-12-01 15:55:46.361159
3	jorge0481rd	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	jorge0481rd@gmail.com	2024-12-01 15:55:46.361159
12	admin	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	admin@example.com	2024-12-22 11:15:26.55166
4	maria03	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	maria03@gmail.com	2024-12-01 15:55:46.361159
13	john_doe	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	john.doe@example.com	2024-12-29 00:54:16.382375
14	jane_smith	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	jane.smith@example.com	2024-12-29 00:54:16.382375
15	mike_brown	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	mike.brown@example.com	2024-12-29 00:54:16.382375
16	sarah_jones	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	sarah.jones@example.com	2024-12-29 00:54:16.382375
17	david_lee	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	david.lee@example.com	2024-12-29 00:54:16.382375
18	emma_clark	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	emma.clark@example.com	2024-12-29 00:54:16.382375
19	chris_wilson	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	chris.wilson@example.com	2024-12-29 00:54:16.382375
20	kate_adams	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	kate.adams@example.com	2024-12-29 00:54:16.382375
21	paul_green	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	paul.green@example.com	2024-12-29 00:54:16.382375
22	anna_white	$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa	anna.white@example.com	2024-12-29 00:54:16.382375
\.


--
-- TOC entry 4896 (class 0 OID 65593)
-- Dependencies: 231
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, user_id, product_id) FROM stdin;
53	12	26
56	12	14
57	12	16
58	12	1
59	12	17
38	3	14
41	3	2
47	3	43
48	3	42
50	3	1
\.


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 217
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 589, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 234
-- Name: inventory_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_history_id_seq', 21, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 108, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 153, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_reviews_id_seq', 94, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 30, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 232
-- Name: questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaire_id_seq', 244, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 230
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 59, true);


-- Completed on 2024-12-30 23:25:28

--
-- PostgreSQL database dump complete
--

