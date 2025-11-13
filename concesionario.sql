-- -----------------------------------------------------
-- Creación de las Tablas
-- -----------------------------------------------------

-- Tabla Fabricante
CREATE TABLE Fabricante (
    idFabricante INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    paisOrigen VARCHAR(100)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    chasis VARCHAR(50) PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(50),
    precioLista DECIMAL(10, 2) NOT NULL,
    idFabricante INT,
    FOREIGN KEY (idFabricante) REFERENCES Fabricante(idFabricante)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    idVendedor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    salario DECIMAL(10, 2)
);

-- Tabla Tipo_Servicio
CREATE TABLE Tipo_Servicio (
    idTipoServicio INT PRIMARY KEY,
    nombreTipo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla Venta
CREATE TABLE Venta (
    idVenta INT PRIMARY KEY,
    chasis VARCHAR(50),
    idCliente INT,
    idVendedor INT,
    idTipoServicio INT,
    fechaVenta DATE NOT NULL,
    precioFinal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (chasis) REFERENCES Vehiculo(chasis),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor),
    FOREIGN KEY (idTipoServicio) REFERENCES Tipo_Servicio(idTipoServicio)
);


-- -----------------------------------------------------
-- Inserción de Datos
-- -----------------------------------------------------

-- Datos para Fabricante
INSERT INTO Fabricante (idFabricante, nombre, paisOrigen) VALUES
(1, 'Toyota', 'Japon'),
(2, 'Ford', 'EEUU'),
(3, 'Volkswagen', 'Alemania');

-- Datos para Cliente
INSERT INTO Cliente (idCliente, nombre, identificacion, telefono, direccion) VALUES
(1, 'Ana Gomez', '1102030405', '0987654321', 'Calle Falsa 123 Loja'),
(2, 'Luis Perez', '1708090100', '0991234567', 'Av Siempre Viva 456 Quito');

-- Datos para Vendedor
INSERT INTO Vendedor (idVendedor, nombre, identificacion, salario) VALUES
(1, 'Carlos Ruiz', '1100220033', 1200.50),
(2, 'Maria Sol', '1750403020', 1300.00);

-- Datos para Tipo_Servicio
INSERT INTO Tipo_Servicio (idTipoServicio, nombreTipo, descripcion) VALUES
(1, 'Venta Nuevo', 'Venta de vehiculo 0km'),
(2, 'Venta Seminuevo', 'Venta de vehiculo usado'),
(3, 'Mantenimiento', 'Servicio de taller programado');

-- Datos para Vehiculo
INSERT INTO Vehiculo (chasis, modelo, anio, color, precioLista, idFabricante) VALUES
('VIN0000001', 'Corolla', 2024, 'Plata', 25000.00, 1),
('VIN0000002', 'Ranger', 2023, 'Azul', 35000.00, 2),
('VIN0000003', 'Golf', 2024, 'Rojo', 28000.00, 3);

-- Datos para Venta
INSERT INTO Venta (idVenta, chasis, idCliente, idVendedor, idTipoServicio, fechaVenta, precioFinal) VALUES
(1, 'VIN0000001', 1, 1, 1, '2025-11-10', 24500.00),
(2, 'VIN0000002', 2, 2, 2, '2025-11-12', 33000.00);
