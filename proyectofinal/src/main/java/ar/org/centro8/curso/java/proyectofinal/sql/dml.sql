use proyecto_recetario;

INSERT INTO proveedor (id,nombre,rubro) VALUES
(1,'EL CRIOLLO','ALMACEN'),
(2,'DON PEDRO','VERDULERIA'),
(3,'EKEKO','CARNICERIA'),
(4,'ALMACEN BOUTIQUE','OTROS');

SELECT * FROM proveedor;

INSERT INTO insumo (id,nombre,precio_compra,factor,proveedor_id) VALUES
(1,'LECHE',102.54,1,1),
(2,'HARINA 000',84.3,1,1),
(3,'MANTECA',152.36,0.2,1),
(4,'AJO',85,0.1,2),
(5,'TOMATE',250,1.2,2),
(6,'CARNE PICADA',102.54,1,3),
(7,'BONDIOLA',1586,1.54,3),
(8,'CEBOLLA BLANCA',70,1,2),
(9,'MORRON ROJO',102.54,1,2),
(10,'SAL FINA',86,0.5,1),
(11,'QUESO AZUL',543.8,0.46,4),
(12,'LEVADURA SECA',50,0.01,1),
(13,'AGUA',0,1,1),
(14,'SPAGHETTI',180,0.5,4);

SELECT * FROM insumo;

INSERT INTO receta (id,nombre) VALUES
(1,'BONDIOLA BRASEADA'),
(2,'PAN'),
(3,'PASTA BOLOGNESA');

SELECT * FROM receta;

INSERT INTO receta_insumo (id,cantidad,und_medida,receta_id,insumo_id) VALUES
(1,1.5,'KG',1,7),
(2,0.7,'KG',1,8),
(3,0.5,'KG',1,9),
(4,1,'KG',2,2),
(5,0.65,'LT',2,13),
(6,0.02,'KG',2,10),
(7,0.01,'KG',2,12);


SELECT * FROM receta_insumo;

set sql_safe_updates = 0;

UPDATE insumo SET precio_x_und = precio_compra / factor;

UPDATE receta_insumo SET subtotal = cantidad * (SELECT precio_x_und FROM insumo WHERE id = insumo_id);

UPDATE receta SET costo_receta = (SELECT SUM(subtotal) FROM receta_insumo WHERE receta_id = 1)
WHERE id=1;

UPDATE receta SET costo_receta = (SELECT SUM(subtotal) FROM receta_insumo WHERE receta_id = 2)
WHERE id=2;

UPDATE receta SET precio_ideal = costo_receta * 3.5;

UPDATE receta SET precio_venta = 5200 WHERE id=1;

UPDATE receta SET precio_venta = 450 WHERE id=2;

UPDATE receta SET rendimiento =costo_receta * 100 / precio_venta;




INSERT INTO insumo (nombre,precio_compra,factor,proveedor_id) VALUES ('LECHE',102.54,1,1);
