# RetailPro | Análisis de ventas con SQL

## Descripción del proyecto

**RetailPro** es un proyecto de análisis de datos de un negocio minorista de tecnología. Utiliza una base de datos relacional de ventas para practicar consultas SQL orientadas a responder preguntas de negocio: facturación por período, productos con mayor generación de ingresos, comportamiento de compra de los clientes y relación entre ventas, productos y categorías.

El repositorio contiene scripts para crear y poblar la base de datos, analizar métricas comerciales y combinar información de varias tablas mediante `JOIN`.

> **Nota:** el nombre de la base de datos definido en los scripts es `Ventas_Tech_DB`; **RetailPro** es el nombre del proyecto.

## Objetivos

- Diseñar y consultar una base de datos relacional de un comercio de tecnología.
- Analizar la facturación y la cantidad de pedidos por mes.
- Identificar productos destacados según unidades vendidas e ingresos generados.
- Comparar el gasto y la frecuencia de compra de los clientes.
- Integrar datos de ventas, clientes, productos y categorías.
- Detectar clientes sin compras y productos que no registran ventas.
- Agrupar y comparar ventas según la ciudad del cliente.

## Herramientas y tecnologías

- **Microsoft SQL Server:** motor de base de datos para ejecutar los scripts.
- **T-SQL:** lenguaje utilizado para crear tablas, insertar registros y realizar consultas.
- **SQL Server Management Studio (SSMS)** o **Azure Data Studio:** herramientas sugeridas para conectarse a SQL Server y ejecutar los archivos `.sql`.
- **Git y GitHub:** control de versiones y alojamiento del repositorio.

## Modelo de datos

La base de datos `Ventas_Tech_DB` contiene cuatro tablas:

| Tabla | Descripción |
|---|---|
| `categorias` | Categorías de productos y sus descripciones. |
| `clientes` | Datos de los clientes, ciudad y fecha de registro. |
| `productos` | Catálogo de productos, categoría, precio, stock y estado. |
| `ventas` | Operaciones de venta, cliente, producto, cantidad, precio unitario y fecha. |

### Relaciones

- Cada producto pertenece a una categoría mediante `productos.id_categoria`.
- Cada venta está asociada a un cliente mediante `ventas.id_cliente`.
- Cada venta está asociada a un producto mediante `ventas.id_producto`.

Las tablas usan claves primarias y foráneas para mantener la integridad referencial. El correo electrónico de los clientes también se define como único.

## Estructura del repositorio

```text
.
├── ventas_tech_db.sql
├── m4_consultas_negocio.sql
├── archivo m5_consultas_joins.sql
└── README.md
```

Los nombres mostrados corresponden a los scripts proporcionados; si los archivos del repositorio tienen otro nombre, utilizá el nombre real al ejecutarlos.

### 1. `ventas_tech_db.sql` — Creación y carga de datos

Este script:

- Crea la base de datos `Ventas_Tech_DB` y la selecciona para su uso.
- Crea las tablas `categorias`, `clientes`, `productos` y `ventas`.
- Define claves primarias, claves foráneas, restricciones `NOT NULL`, un correo electrónico único y valores predeterminados.
- Inserta datos de ejemplo para las cuatro tablas.
- Ejecuta consultas `SELECT` para verificar los datos cargados.

**Importante:** el script contiene `DROP TABLE IF EXISTS`. Al volver a ejecutarlo, elimina las tablas indicadas antes de recrearlas. Usalo solo en un entorno de práctica, ya que podrías perder los datos que contengan.

### 2. `m4_consultas_negocio.sql` — Métricas y análisis comercial

Incluye consultas para:

- Calcular facturación, cantidad de pedidos y promedio del precio unitario por mes.
- Obtener los cinco productos con mayor facturación y sus unidades vendidas.
- Identificar clientes con más de un pedido y calcular cuánto gastaron.
- Comparar la facturación mensual con el promedio de facturación de los meses analizados.

Utiliza funciones de agregación (`SUM`, `COUNT`, `AVG`), agrupaciones (`GROUP BY`), filtros sobre grupos (`HAVING`), ordenamiento (`ORDER BY`), `TOP` y una expresión `CASE` con una función de ventana.

**Aclaración:** la columna `ticket_promedio` de este script calcula el promedio de `precio_unitario`, no el promedio del importe total de cada pedido.

### 3. `archivo m5_consultas_joins.sql` — Cruce de tablas con JOIN

Incluye consultas para:

- Integrar ventas con clientes, productos y categorías mediante `INNER JOIN`.
- Buscar clientes que no tienen ventas registradas mediante `LEFT JOIN` y una comprobación de `NULL`.
- Encontrar productos que no aparecen en las ventas.
- Consolidar y comparar importes de ventas de clientes de Buenos Aires y Rosario utilizando `UNION ALL` y una consulta derivada.

## Requisitos previos

1. Tener acceso a una instancia de **Microsoft SQL Server**.
2. Contar con **SQL Server Management Studio (SSMS)** o **Azure Data Studio**, u otro cliente compatible.
3. Tener permisos para crear la base de datos y las tablas.
4. Descargar o clonar este repositorio.

## Cómo ejecutar los scripts

Ejecutá los archivos en el siguiente orden para que las tablas y los datos existan antes de realizar los análisis.

### Paso 1. Descargar el repositorio

Cloná el repositorio reemplazando la URL de ejemplo por la URL real:

```bash
git clone <URL-DEL-REPOSITORIO>
cd <NOMBRE-DEL-REPOSITORIO>
```

También podés descargarlo desde GitHub como archivo ZIP y descomprimirlo.

### Paso 2. Conectarse a SQL Server

Abrí SSMS o Azure Data Studio y conectate a tu instancia de SQL Server. Abrí el archivo `ventas_tech_db.sql`.

### Paso 3. Crear y cargar la base de datos

Ejecutá el script completo `ventas_tech_db.sql`. Este creará `Ventas_Tech_DB`, generará las tablas e insertará los datos de ejemplo.

Verificá que la ejecución finalice sin errores y que las consultas `SELECT` devuelvan registros.

### Paso 4. Ejecutar las consultas de negocio

Abrí `m4_consultas_negocio.sql` y ejecutalo después de crear la base de datos. El archivo ya incluye:

```sql
USE Ventas_Tech_DB;
```

Revisá los conjuntos de resultados para analizar la facturación, los productos y los clientes.

### Paso 5. Ejecutar las consultas con JOIN

Abrí `archivo m5_consultas_joins.sql` y ejecutalo. Sus consultas relacionan las cuatro tablas y permiten identificar clientes o productos sin ventas, además de comparar ventas por ciudad.

### Orden recomendado

```text
1. ventas_tech_db.sql
2. m4_consultas_negocio.sql
3. archivo m5_consultas_joins.sql
```

## Preguntas de negocio que se pueden explorar

- ¿Cuánto se facturó en cada mes?
- ¿Qué productos generan más ingresos?
- ¿Cuántas unidades se vendieron por producto?
- ¿Qué clientes realizaron más de una compra y cuánto gastaron?
- ¿Qué clientes todavía no registran compras?
- ¿Qué productos no tuvieron ventas?
- ¿Cómo se distribuye la facturación entre Buenos Aires y Rosario?
- ¿Cómo se compara la facturación mensual con el promedio del período?

## Alcance y consideraciones

- Los datos son de ejemplo y están orientados a practicar SQL; no representan necesariamente operaciones comerciales reales.
- El conjunto de datos es pequeño, por lo que el proyecto funciona principalmente como ejercicio de modelado relacional y análisis mediante consultas.
- La métrica `cantidad_pedidos` de las consultas cuenta filas de `ventas`. Como el modelo actual registra una fila por venta y no tiene una entidad independiente de pedidos con múltiples líneas, conviene interpretarla como cantidad de registros de venta.
- La consulta que compara la facturación mensual con el promedio utiliza los meses presentes en los registros; no genera automáticamente meses sin ventas.
- Los scripts están escritos para SQL Server/T-SQL y utilizan elementos específicos como `TOP`, `MONTH`, `tinyint` y `DROP TABLE IF EXISTS`.

## Posibles mejoras futuras

- Incorporar más registros para obtener análisis más representativos.
- Crear una tabla de pedidos independiente de sus líneas de detalle.
- Agregar consultas de evolución temporal, participación porcentual por categoría y ranking de clientes.
- Definir vistas reutilizables para métricas de ventas.
- Documentar resultados y visualizarlos en una herramienta de BI.

## Autoría

Proyecto de práctica de SQL orientado al análisis de datos comerciales. Actualizá esta sección con tu nombre, perfil de GitHub y cualquier información adicional que quieras compartir.
