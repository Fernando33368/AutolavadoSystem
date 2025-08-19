# 🚗 Sistema de Gestión de Autolavado

Este sistema está diseñado para gestionar de manera eficiente un *autolavado*, permitiendo el control de clientes, vehículos, servicios, usuarios del sistema y ventas de servicios realizadas.

La base de datos se llama *db_autolavado* y contiene las siguientes tablas principales:

---

## 📑 Tablas y Funcionalidad

### 1. *tbi_roles*
Almacena los diferentes *roles* de usuarios dentro del sistema.
- idRol: Identificador único.
- nombreRol: Nombre del rol (Ej. Cajero, Administrador, Lavador, Gerente).

✔ Permite asignar permisos y responsabilidades dentro del autolavado.

---

### 2. *tbi_clientes*
Registra a los *clientes* que llevan sus vehículos al autolavado.
- Datos personales: nombre, apellidos, dirección, teléfono, correo.
- password: Clave de acceso para autenticarse (si el cliente usa el sistema).

✔ Un cliente puede registrar *uno o varios vehículos*.

---

### 3. *tbc_usuarios*
Gestión de los *empleados y usuarios internos* del sistema.
- Datos personales + credenciales de acceso.
- idRol: Relación con la tabla *tbi_roles*.

✔ Permite controlar quién opera el sistema (cajeros, lavadores, administradores, etc.).

---

### 4. *tbc_vehiculo*
Registra los *vehículos de los clientes*.
- matricula, marca, modelo, color, year, tipo.
- Relación con el *cliente* propietario (idCliente).

✔ Un cliente puede tener múltiples vehículos registrados.

---

### 5. *tbi_servicios*
Define los *servicios disponibles* en el autolavado.
- Ejemplos: Lavado, Encerado, Aspirado.
- Incluye precio y estatus (Activo/Inactivo).

✔ La administración puede modificar los servicios ofrecidos.

---

### 6. *tbc_venta_servicios*
Historial de *ventas de servicios* realizadas.
- idUsuarioC: Cliente que solicita el servicio.
- idUsuarioO: Usuario/Empleado que atiende.
- idServicio: Servicio contratado.
- idVehiculo: Vehículo al que se aplica el servicio.
- fecha y hora.
- estatus: Estado del servicio (En espera, En proceso, Finalizado).
- pagado: Indica si fue liquidado o está pendiente.

✔ Permite llevar el *control de ingresos y flujo de trabajo* en el autolavado.

---

## 🔗 Relaciones entre Tablas

- *Roles (tbi_roles)* → usados por *Usuarios (tbc_usuarios)*.
- *Clientes (tbi_clientes)* → pueden registrar varios *Vehículos (tbc_vehiculo)*.
- *Servicios (tbi_servicios)* → se registran en *Ventas de servicios (tbc_venta_servicios)*.
- *Usuarios (tbc_usuarios)* → gestionan ventas como *Cliente* (idUsuarioC) o *Operador* (idUsuarioO).

---

## ⚙️ Funcionalidades del Sistema

1. *Gestión de clientes*: Registro, actualización y control de sus datos.
2. *Gestión de vehículos*: Asociar vehículos a clientes.
3. *Gestión de usuarios*: Control de empleados según roles.
4. *Gestión de servicios*: Administración de precios, descripción y estatus.
5. *Ventas de servicios*: Registro de cada servicio solicitado, estado del proceso y pagos.
6. *Reportes*: Control de historial de servicios, clientes atendidos y finanzas.

---

## 📊 Flujo Básico de Uso

1. Un *cliente* llega al autolavado → Se registra (si no está registrado).
2. El cliente *registra su vehículo* en el sistema.
3. El cajero o administrador selecciona el *servicio solicitado* (ej. Lavado + Encerado).
4. El sistema genera un registro en *tbc_venta_servicios*.
5. El servicio pasa por los estados: En espera → En proceso → Finalizado.
6. Se actualiza el campo *pagado* al liquidar la cuenta.
7. La información queda almacenada para *reportes y control administrativo*.

---

## 🛠️ Tecnologías

- *Base de datos*: MySQL (InnoDB, UTF8MB4).
- *Modelo de datos*: Relacional con claves foráneas.
- *Lenguaje de consultas*: SQL.
