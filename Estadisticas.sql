--Estadisticas generales
DBCC SHOW_STATISTICS ('Nombre tabla','Elementos tabla o indice')
GO


--Estadisticas Header
DBCC SHOW_STATISTICS ('Nombre tabla','Elementos tabla o indice') WITH STAT_HEADER
GO

--Estadisticas vector
DBCC SHOW_STATISTICS ('Nombre tabla','Elementos tabla o indice') WITH DENSITY_VECTOR 
GO

--Estadisticas histograma
DBCC SHOW_STATISTICS ('Nombre tabla','Elementos tabla o indice') WITH HISTOGRAM
GO