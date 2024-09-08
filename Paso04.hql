use integrador2;
SELECT idsucursal, sum(precio * cantidad) FROM venta GROUP BY idsucursal;
CREATE INDEX index_venta_sucursal ON TABLE venta(IdSucursal) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
ALTER INDEX index_venta_sucursal ON venta REBUILD;
SELECT idsucursal, sum(precio * cantidad) FROM venta GROUP BY idsucursal;
EXIT;
