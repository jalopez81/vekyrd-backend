INSERT INTO public.user_roles (user_id, role)
VALUES
  (1, 'admin'),
  (1, 'moderator'),
  (2, 'user');

INSERT INTO public.users (username, password, email, created_at)
VALUES
('jorge0481rd', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'jorge0481rd@gmail.com', CURRENT_TIMESTAMP),
('maria03', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'maria03@gmail.com', CURRENT_TIMESTAMP),
('maria04', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'maria015@gmail.com', CURRENT_TIMESTAMP),
('maria05', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'mariaww03@gmail.com', CURRENT_TIMESTAMP),
('maria06', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'marierea03@gmail.com', CURRENT_TIMESTAMP),
('maria07', '$2a$10$bEhrMfDPmpcm4s/IFV02E.jhwKof/AJGoeixdjjHu/0eUdogGQrxa', 'marirerea03@gmail.com', CURRENT_TIMESTAMP),
('admin', '$2a$10$HHRs/EStKwsivkZAYTbVGO2.JLdiWW5okIACdruUHc7okkDWHulcW', 'admin@example.com', CURRENT_TIMESTAMP);

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

INSERT INTO public.orders (user_id, status, total_price, created_at, confirmation_number, order_hash, subtotal, shipping, taxes)
VALUES
(1, 'Procesando', 69.98, CURRENT_TIMESTAMP, 'CONF001', 'ORDERHASH001', 59.99, 5.00, 5.99),
(2, 'Enviado', 59.99, CURRENT_TIMESTAMP, 'CONF002', 'ORDERHASH002', 50.00, 5.00, 4.99),
(3, 'Entregado', 119.98, CURRENT_TIMESTAMP, 'CONF003', 'ORDERHASH003', 100.00, 10.00, 9.98);

INSERT INTO public.wishlist (user_id, product_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5);
