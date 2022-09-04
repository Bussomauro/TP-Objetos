-- ---------------
-- TEST QUERIES
-- ---------------

-- nombre de receta y costo id=1

select  distinct    (r.nombre),
                    r.costo_receta
from                receta r
join                receta_insumo ri
on                  r.id = ri.receta_ID
where               r.id=1;

-- nombre y costo de receta general

select  distinct    (r.nombre),
                    r.costo_receta
from                receta r
join                receta_insumo ri
on                  r.id = ri.receta_ID;

-- nombre de receta, nombre de insumos y precio x und

select              r.nombre 'nombre de receta',
                    i.nombre 'nombre de insumo',
                    i.precio_x_und
FROM                insumo i                    
JOIN                receta_insumo ri on i.id = ri.insumo_id
JOIN                receta r on r.id = ri.receta_id;

-- nombre insumo y rubro de los insumos de id entre 3 y 8

select              i.nombre 'nombre insumo',
                    p.rubro
from                insumo i
JOIN                proveedor p on p.id = i.proveedor_id
where               i.id between 3 and 8;

-- proveedor, insumo, subtotal y en receta se usan de receta id = 2

select              p.nombre 'nombre del proveedor',
                    i.nombre 'nombre del insumo',
                    ri.subtotal,
                    r.nombre 'en que receta se usa'
from                proveedor p
join                insumo i on p.id = i.proveedor_id
join                receta_insumo ri on i.id = ri.insumo_id
join                receta r on r.id = ri.receta_id
where               r.id=2;
                    
