INSERT INTO public.users 
(username, first_name, last_name, phone_number, address, password, email, created_at, active)
VALUES
(
    'admin', 'System', 'Administrator', '+1-800-555-0100', '100 Main St, New York, NY 10001', 
    '$2a$10$sDCWi13ywuXPWZnRF17sQO/FN984ykvVJjSZ1VAGfQUpUnjvQ/GzG', 'admin@gmail.com', CURRENT_TIMESTAMP, true
),
(
    'user01', 'John', 'Smith', '+1-305-555-0123', '742 Evergreen Terrace, Miami, FL 33101', 
    '$2a$10$QNnfEfcVrmWC8aLL.N/4c.9jnjONh5dYvCohe2v2yeeI6u4sEKNFW', 'user01@gmail.com', CURRENT_TIMESTAMP, true
),
(
    'user02', 'Emily', 'Johnson', '+1-212-555-0156', '450 Fifth Avenue, New York, NY 10118', 
    '$2a$10$QNnfEfcVrmWC8aLL.N/4c.9jnjONh5dYvCohe2v2yeeI6u4sEKNFW', 'user02@gmail.com', CURRENT_TIMESTAMP, false
),
(
    'user03', 'Michael', 'Brown', '+1-312-555-0189', '233 S Wacker Dr, Chicago, IL 60606', 
    '$2a$10$QNnfEfcVrmWC8aLL.N/4c.9jnjONh5dYvCohe2v2yeeI6u4sEKNFW', 'user03@gmail.com', CURRENT_TIMESTAMP, false
),
(
    'user04', 'Sarah', 'Wilson', '+1-213-555-0144', '1313 Disneyland Dr, Anaheim, CA 92802', 
    '$2a$10$QNnfEfcVrmWC8aLL.N/4c.9jnjONh5dYvCohe2v2yeeI6u4sEKNFW', 'user04@gmail.com', CURRENT_TIMESTAMP, true
),
(
    'user05', 'David', 'Miller', '+1-702-555-0177', '3600 S Las Vegas Blvd, Las Vegas, NV 89109', 
    '$2a$10$QNnfEfcVrmWC8aLL.N/4c.9jnjONh5dYvCohe2v2yeeI6u4sEKNFW', 'user05@gmail.com', CURRENT_TIMESTAMP, true
);

--- ROLES (Usando subconsultas para evitar error de ID) ---
INSERT INTO public.user_roles (user_id, role)
VALUES
  ((SELECT id FROM public.users WHERE username = 'admin'), 'admin'),
  ((SELECT id FROM public.users WHERE username = 'user01'), 'customer'),
  ((SELECT id FROM public.users WHERE username = 'user02'), 'moderator');

INSERT INTO public.products (name, description, price, stock, sku, category, description_large, average_rating)
VALUES
('Aceite Capilar', 'Aceite reparador para el cabello', 30.99, 90, 'ACEITE001', 'aceites', 'Nutre profundamente y restaura el brillo. Ideal para puntas abiertas y tratamientos nocturnos. Nutre profundamente el cabello desde la raíz hasta las puntas, restaurando el brillo natural y devolviendo la vitalidad perdida. Es ideal para tratar puntas abiertas, sequedad extrema y daños causados por el calor. Perfecto para tratamientos nocturnos que actúan mientras duermes y dejan el cabello suave al despertar.', 4.9),
('Acondicionador Reparador', 'Acondicionador para cabello dañado', 23.99, 160, 'ACONDI001', 'acondicionadores', 'Repara y fortalece el cabello desde la raíz. Ideal para reducir la rotura. Repara la estructura interna del cabello, fortaleciéndolo desde la raíz hasta las puntas. Reduce visiblemente la rotura causada por el cepillado, el peinado excesivo o el uso frecuente de herramientas térmicas. El cabello se vuelve más resistente, con mayor elasticidad y menos propenso a quebrarse.', 4.4),
('Acondicionador Hidratante', 'Acondicionador para hidratación profunda', 20.49, 130, 'ACONDI002', 'acondicionadores', 'Hidratación sin apelmazar. Perfecto para uso diario en cabellos secos. Proporciona una hidratación ligera pero efectiva, sin dejar sensación grasosa ni apelmazar el cabello. Su fórmula está pensada para uso diario, especialmente en cabellos secos, quebradizos o sin vida. Aporta suavidad, manejabilidad y un aspecto saludable sin perder volumen.', 4.5),
('Crema Capilar', 'Crema hidratante para el cabello', 28.99, 140, 'CREMA001', 'cremas', 'Hidrata profundamente y mejora la manejabilidad. Restaura la suavidad del cabello. Penetra en la fibra capilar para hidratar en profundidad, facilitando el desenredo y reduciendo el frizz. Con su uso constante, mejora significativamente la manejabilidad, dejando el cabello suave, sedoso y con un brillo saludable. Ideal para quienes buscan un cuidado completo y duradero.', 4.6),
('Gel para el Cabello', 'Gel fijador para peinados duraderos', 15.49, 200, 'GEL001', 'gel', 'Fijación fuerte sin residuos. Mantiene tu estilo todo el día. Ofrece una fijación potente que mantiene tu peinado en su lugar durante todo el día, incluso en condiciones de humedad. No deja residuos visibles ni sensación pegajosa, y se elimina fácilmente con un simple cepillado. Ideal para peinados definidos, moños o looks estructurados.', 3.9),
('Gel Estilizador', 'Gel para estilizar y fijar el cabello', 16.99, 80, 'GEL002', 'gel', 'Fijación suave para peinados naturales. No deja residuos. Proporciona una sujeción ligera que respeta el movimiento natural del cabello, ideal para estilos más relajados y desenfadados. No deja restos visibles ni apelmaza, lo que permite un acabado limpio y profesional. Perfecto para el uso diario sin sacrificar naturalidad.', 4.1),
('Shampoo Volumen', 'Shampoo para dar volumen al cabello', 19.99, 100, 'SHAMPOO001', 'shampoo', 'Fórmula ligera que eleva las raíces y aporta cuerpo sin apelmazar. Diseñada para aportar volumen desde la raíz, esta fórmula ligera da cuerpo al cabello fino o lacio sin apelmazar. Eleva las raíces visiblemente y mejora la textura sin comprometer la suavidad. Ideal para looks con más movimiento y volumen controlado.', 4.5),
('Shampoo Hidratante', 'Shampoo para hidratación profunda', 22.99, 50, 'SHAMPOO002', 'shampoo', 'Enriquecido con aceites naturales. Hidrata desde la raíz a las puntas. Contiene una mezcla equilibrada de aceites naturales como argán, jojoba y coco que hidratan intensamente desde la raíz hasta las puntas. Nutre el cuero cabelludo, mejora la elasticidad del cabello y ayuda a prevenir la resequedad. Aporta brillo y protección con cada aplicación.', 4.2),
('Shampoo Rejuvenecedor', 'Shampoo anti-edad para el cabello', 25.99, 120, 'SHAMPOO003', 'shampoo', 'Propiedades antioxidantes que revitalizan desde la raíz. Para un cabello más joven. Formulado con ingredientes antioxidantes que combaten los radicales libres, este tratamiento revitaliza el cuero cabelludo y mejora la salud capilar desde su base. Con el uso regular, el cabello luce más fuerte, brillante y rejuvenecido. Ideal para prevenir el envejecimiento capilar prematuro.', 4.8),
('Shampoo Reparador', 'Shampoo para reparar el cabello dañado', 21.49, 180, 'SHAMPOO004', 'shampoo', 'Repara la estructura capilar desde el interior. Brillo y suavidad garantizados. Actúa directamente sobre la fibra capilar para restaurar los daños internos, mejorando la textura y resistencia del cabello. Devuelve la suavidad al tacto y un brillo natural que dura todo el día. Es el aliado perfecto para cabellos maltratados o sometidos a procesos químicos.', 4.3),
('Spray Protector Solar', 'Spray protector solar para el cabello', 18.99, 150, 'SPRAY001', 'spray', 'Protege contra rayos UV. Evita resequedad y pérdida de color. Crea una barrera protectora contra los rayos solares, evitando la pérdida de hidratación y el desgaste del color en cabellos teñidos. Previene el envejecimiento capilar inducido por el sol y mantiene el color vibrante por más tiempo. Ideal para uso diario, especialmente en verano.', 4.7);


INSERT INTO public.product_reviews (user_id, product_id, rating, comment, created_at)
VALUES
(1, 1, 5, '¡Producto excelente, mi cabello luce con más volumen!', CURRENT_TIMESTAMP),
(2, 2, 4, 'Buen shampoo, pero prefiero uno con más hidratación.', CURRENT_TIMESTAMP),
(3, 3, 3, 'El gel cumple su función, aunque no me duró todo el día.', CURRENT_TIMESTAMP),
(1, 4, 5, 'Me protegió del sol, lo recomiendo mucho.', CURRENT_TIMESTAMP),
(2, 5, 4, 'Un shampoo muy bueno, pero me gustaría que fuera un poco más económico.', CURRENT_TIMESTAMP),
(3, 6, 5, 'El shampoo reparador me dejó el cabello suave y sano.', CURRENT_TIMESTAMP);

INSERT INTO public.orders (user_id, status, total_price, created_at, confirmation_number, order_hash, subtotal, shipping, taxes, payment_method)
VALUES
(1, 'Procesando', 69.98, CURRENT_TIMESTAMP, 'CONF001', 'ORDERHASH001', 59.99, 5.00, 5.99, 'TARJETA'),
(2, 'Enviado', 59.99, CURRENT_TIMESTAMP, 'CONF002', 'ORDERHASH002', 50.00, 5.00, 4.99, 'TARJETA'),
(3, 'Entregado', 119.98, CURRENT_TIMESTAMP, 'CONF003', 'ORDERHASH003', 100.00, 10.00, 9.98, 'TARJETA');

INSERT INTO public.contactus (name, email, message, read, created_at)
VALUES
('John Doe', 'john.doe@example.com', 'Hello, I am interested in your products', false, CURRENT_TIMESTAMP),
('Tania Smith', 'jane.smith@example.com', 'Do you guys have delivery?', false, CURRENT_TIMESTAMP),
('Mike Brown', 'mike.brown@example.com', 'Tengo una pregunta sobre los productos', false, CURRENT_TIMESTAMP),
('Sarah Jones', 'sarah.jones@example.com', 'I want to know more about your company', false, CURRENT_TIMESTAMP),
('Jorge Lopez', 'jorge.lopez@example.com', 'Cual es el telefono de la compañía?', false, CURRENT_TIMESTAMP),
('David Lee', 'david.lee@example.com', 'I want to know more about your company', false, CURRENT_TIMESTAMP),
('Roberto Gomez', 'roberto.gomez@example.com', 'Alguien me puede ayudar?', false, CURRENT_TIMESTAMP);

INSERT INTO public.wishlist (user_id, product_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5);

INSERT INTO credit_cards (user_id, cardholder_name, card_number, cvv, expiration_date, billing_address, created_at) 
VALUES (1, 'JORGE LOPEZ', pgp_sym_encrypt('4111111111111111', 'this_is_a_random_string_used_for_credit_card_number_encryption'), '123', '12-1-2031', '123 Lincoln St, Miami, FL 33101', CURRENT_TIMESTAMP);

-- Datos para reportes

CREATE INDEX idx_orders_hash ON orders(order_hash);
CREATE INDEX idx_cart_hash ON cart(order_hash);


-- 1. Insertamos órdenes con fechas variadas y hashes únicos
INSERT INTO public.orders (user_id, status, total_price, created_at, confirmation_number, order_hash, subtotal, shipping, taxes, payment_method)
VALUES
-- Ventas de hace 20 días
(2, 'paid', 54.98, NOW() - INTERVAL '20 days', 'CONF101', 'HASH101', 45.00, 5.00, 4.98, 'TARJETA'),
(1, 'pending', 54.98, NOW() - INTERVAL '20 days', 'CONF101', 'HASH101', 45.00, 5.00, 4.98, 'TARJETA'),
(5, 'cancelled', 54.98, NOW() - INTERVAL '20 days', 'CONF101', 'HASH101', 45.00, 5.00, 4.98, 'TARJETA'),
(3, 'paid', 30.99, NOW() - INTERVAL '19 days', 'CONF102', 'HASH102', 25.00, 3.00, 2.99, 'PAYPAL'),
(4, 'pending', 30.99, NOW() - INTERVAL '19 days', 'CONF102', 'HASH102', 25.00, 3.00, 2.99, 'PAYPAL'),

-- Ventas de hace 10 días
(4, 'cancelled', 115.50, NOW() - INTERVAL '10 days', 'CONF103', 'HASH103', 100.00, 8.00, 7.50, 'TARJETA'),
(5, 'paid', 45.00, NOW() - INTERVAL '9 days', 'CONF104', 'HASH104', 38.00, 4.00, 3.00, 'EFECTIVO'),
(1, 'pending', 45.00, NOW() - INTERVAL '9 days', 'CONF104', 'HASH104', 38.00, 4.00, 3.00, 'EFECTIVO'),
(2, 'canceled', 45.00, NOW() - INTERVAL '9 days', 'CONF104', 'HASH104', 38.00, 4.00, 3.00, 'EFECTIVO'),

-- Ventas de esta semana
(1, 'paid', 85.20, NOW() - INTERVAL '3 days', 'CONF105', 'HASH105', 75.00, 5.00, 5.20, 'TARJETA'),
(3, 'pending', 120.00, NOW() - INTERVAL '2 days', 'CONF107', 'HASH107', 100.00, 10.00, 10.00, 'TARJETA'),
(5, 'cancelled', 150.00, NOW() - INTERVAL '1 day', 'CONF108', 'HASH108', 125.00, 10.00, 10.00, 'TARJETA'),
(4, 'paid', 99.99, NOW() - INTERVAL '1 day', 'CONF109', 'HASH109', 85.00, 5.00, 4.99, 'TARJETA'),
(2, 'pending', 28.99, NOW() - INTERVAL '1 day', 'CONF106', 'HASH106', 25.00, 2.00, 1.99, 'TARJETA');

-- 2. Insertamos productos en el carrito usando order_hash y precios manuales
INSERT INTO public.cart (product_id, quantity, price, user_id, order_hash, created_at)
VALUES
-- Para la orden HASH101 (User 2)
(1, 1, 30.99, 2, 'HASH101', NOW() - INTERVAL '20 days'),
(2, 1, 23.99, 2, 'HASH101', NOW() - INTERVAL '20 days'),

-- Para la orden HASH102 (User 3)
(11, 1, 18.99, 3, 'HASH102', NOW() - INTERVAL '19 days'),

-- Para la orden HASH103 (User 4)
(4, 2, 28.99, 4, 'HASH103', NOW() - INTERVAL '10 days'),
(9, 1, 25.99, 4, 'HASH103', NOW() - INTERVAL '10 days'),

-- Para la orden HASH103 (User 4)
(4, 2, 28.99, 4, 'HASH104', NOW() - INTERVAL '10 days'),
(9, 1, 25.99, 4, 'HASH104', NOW() - INTERVAL '10 days'),

-- Para la orden HASH105 (User 1)
(7, 1, 19.99, 1, 'HASH105', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 1, 'HASH105', NOW() - INTERVAL '3 days'),

-- Para la orden HASH106 (User 2)
(5, 1, 15.49, 2, 'HASH106', NOW() - INTERVAL '1 day'),

-- Para la orden HASH105 (User 1)
(7, 1, 19.99, 1, 'HASH107', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 1, 'HASH107', NOW() - INTERVAL '3 days'),

-- Para la orden HASH105 (User 1)
(7, 1, 19.99, 2, 'HASH108', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 2, 'HASH108', NOW() - INTERVAL '3 days'),

-- Para la orden HASH105 (User 1)
(7, 1, 19.99, 1, 'HASH109', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 1, 'HASH109', NOW() - INTERVAL '3 days'),

-- Para la orden ORDERHASH001 (User 1)
(7, 1, 19.99, 1, 'ORDERHASH001', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 1, 'ORDERHASH001', NOW() - INTERVAL '3 days'),

-- Para la orden ORDERHASH002 (User 3)
(7, 1, 19.99, 3, 'ORDERHASH002', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 3, 'ORDERHASH002', NOW() - INTERVAL '3 days'),

-- Para la orden ORDERHASH003 (User 3)
(7, 1, 19.99, 3, 'ORDERHASH003', NOW() - INTERVAL '3 days'),
(1, 1, 30.99, 3, 'ORDERHASH003', NOW() - INTERVAL '3 days');