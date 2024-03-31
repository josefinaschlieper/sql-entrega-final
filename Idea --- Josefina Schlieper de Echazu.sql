#PRIMERO CREAMOS Y ACTIVAMOS EL SCHEMA: 

CREATE SCHEMA gestion___aeroportuaria;

USE gestion___aeroportuaria;

#SEGUNDO, CREAMOS LAS TABLAS CON SUS PRIMARY Y FOREIGN KEYS:

-- Table: Pasajeros
CREATE TABLE Pasajeros (
    PasajeroID int NOT NULL,
    Nombre text(30) NOT NULL,
    Apellido text(30) NOT NULL,
    Pasaporte int NOT NULL,
    Email varchar(50),
    Nacionalidad text(30),
    Fecha_nacimiento date,
    Tripulante boolean NOT NULL,
    TripulanteID int,
    CONSTRAINT PK_PasajeroID PRIMARY KEY (PasajeroID)
);

-- Table: Adicionales
CREATE TABLE Adicionales (
    AdicionalID int NOT NULL,
    PasajeroID int NOT NULL,
    Valijas_numero int,
    Valijas_peso int,
    Vegetariano boolean,
	Seguro_de_viaje boolean,
    CONSTRAINT PK_AdicionalID PRIMARY KEY (AdicionalID),
    CONSTRAINT FK_PasajeroID FOREIGN KEY (PasajeroID) REFERENCES Pasajeros(PasajeroID)
);

-- Table: Destino
CREATE TABLE Destino (
    DestinoID int NOT NULL,
    Codigo_aeropuerto text(3) NOT NULL,
    Ciudad text(25) NOT NULL,
    Pais text(25) NOT NULL,
    Nombre_aeropuerto text(50),
    Terminal int,
    Puerta varchar(4),
    CONSTRAINT PK_DestinoID PRIMARY KEY (DestinoID)
);

-- Table: Vuelo
CREATE TABLE Vuelo (
    VueloID varchar(6) NOT NULL,
    DestinoID int NOT NULL,
    FechaHora_salida datetime NOT NULL,
    FechaHora_llegada datetime NOT NULL,
    AerolineaID varchar(2) NOT NULL,
    Aeronave int,
    CONSTRAINT PK_VueloID PRIMARY KEY (VueloID),
    CONSTRAINT FK_DestinoID FOREIGN KEY (DestinoID) REFERENCES Destino(DestinoID)
);


-- Table: Reserva
CREATE TABLE Reserva (
    ReservaID int NOT NULL,
    PasajeroID int NOT NULL,
    VueloID varchar(6) NOT NULL,
    FechaHora_reserva datetime,
    Numero_asiento varchar(3),
    Precio_ticket int,
    AdicionalID int NOT NULL,
    CONSTRAINT PK_ResevaID PRIMARY KEY (ReservaID),
    CONSTRAINT FK_PasajeroID_Reserva FOREIGN KEY (PasajeroID) REFERENCES Pasajeros(PasajeroID),
    CONSTRAINT FK_VueloID FOREIGN KEY (VueloID) REFERENCES Vuelo(VueloID),
    CONSTRAINT FK_AdicionalID FOREIGN KEY (AdicionalID) REFERENCES Adicionales(AdicionalID)
);

-- Table: Tripulacion
CREATE TABLE Tripulacion (
    TripulanteID int NOT NULL,
    Puesto text(30),
    Aerolinea text(30),
    CONSTRAINT PK_TripulanteID PRIMARY KEY (TripulanteID)
);


-- Table: Feedback
CREATE TABLE Feedback (
    FeedbackID int NOT NULL,
    PasajeroID int NOT NULL,
    VueloID varchar(6) NOT NULL,
    Feedback text,
    Rating int,
    CONSTRAINT PK_FeedbackID PRIMARY KEY (FeedbackID),
	CONSTRAINT FK_PasajeroID_Feedback FOREIGN KEY (PasajeroID) REFERENCES Pasajeros(PasajeroID),
    CONSTRAINT FK_VueloID_Feedback FOREIGN KEY (VueloID) REFERENCES Vuelo(VueloID)
);

#TERCERO, RELLENAMOS LAS TABLAS CON DATOS:
    
-- Table: Pasajeros
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100001, 'Josefina', 'Schlieper','123456', 'josefinaschieper@gmail.com', 'Argentina', '2000-01-10', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100002, 'Agustina', 'Gomez','577648', 'agustinagomezgmail.com', 'Argentina', '1962-10-10', 1, '600001');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100003, 'Santiago', 'Hernandez','976503', 'santiagohernandez@gmail.com', 'Argentina', '1986-08-27', 1, '600002');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100004, 'Franco', 'Cohen','479263', 'francocohen@gmail.com', 'Argentina', '1999-09-08', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100005, 'Nina', 'Castro','573418', 'ninacastro@gmail.com', 'Argentina', '1989-08-22', 1, '600003');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100006, 'Julia', 'Gonzalez','284608', 'juliagonzalez@gmail.com', 'Argentina', '1976-11-03', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100007, 'Justina', 'Fernandez','835482', 'justinafernandez@gmail.com', 'Argentina', '1992-04-19', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100008, 'Lourdes', 'Martinez','378451', 'lourdesmartinez@gmail.com', 'Argentina', '1984-09-11', 1, '600004');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100009, 'Barbara', 'Diaz','659274', 'barbaradiaz@gmail.com', 'Argentina', '1995-10-08', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100010, 'Fiona', 'Lopez','548276', 'fionalopez@gmail.com', 'Argentina', '2000-08-26', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100011, 'Renata', 'Sanchez','357491', 'renatasanchez@gmail.com', 'Argentina', '1973-03-10', 1, '600005');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100012, 'Martin', 'Gutierrez','479267', 'martingutierrez@gmail.com', 'Argentina', '1962-11-21', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100013, 'Lucas', 'Perez','563826', 'lucasperez@gmail.com', 'Argentina', '1975-05-06', 0, '0');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100014, 'Joaquin', 'Sosa','628461', 'joaquinsosa@gmail.com', 'Argentina', '1982-12-08', 1, '600006');
insert into Pasajeros (PasajeroID, Nombre, Apellido, Pasaporte, Email, Nacionalidad, Fecha_nacimiento, Tripulante, TripulanteID) values (100015, 'Marcelo', 'Garcia','471846', 'marcelogarcia@gmail.com', 'Argentina', '1997-10-23', 0, '0');

SELECT * FROM Pasajeros;

-- Table: Adicionales
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200001, 100001, 1, 19, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200002, 100002, 2, 08, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200003, 100003, 1, 13, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200004, 100004, 1, 21, 0, 0);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200005, 100005, 2, 22, 1, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200006, 100006, 2, 25, 1, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200007, 100007, 2, 24, 0, 0);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200008, 100008, 1, 18, 0, 0);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200009, 100009, 1, 19, 1, 0);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200010, 100010, 2, 23, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200011, 100011, 1, 21, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200012, 100012, 1, 15, 1, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200013, 100013, 2, 13, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200014, 100014, 2, 09, 0, 1);
insert into Adicionales (AdicionalID, PasajeroID, Valijas_numero, Valijas_peso, Vegetariano, Seguro_de_viaje) values (200015, 100015, 1, 10, 1, 0);

SELECT * FROM Adicionales;

-- Table: Destino
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300001, 'EZE', 'Buenos Aires', 'Argentina', 'Ezeiza', 15, 'A2');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300002, 'JFK', 'Nueva York', 'Estados Unidos', 'John F. Kennedy', 1, 'D4');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300003, 'LAX', 'Los Angeles', 'Estados Unidos', 'Los Angeles', 7, '70');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300004, 'LHR', 'Londres', 'Inglaterra', 'Heathrow', 1, '10');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300005, 'CDG', 'Paris', 'Francia', 'Charles de Gaulle', 15, 8);
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300006, 'DXB', 'Dubai', 'UAE', 'Dubai', 3, 'B32');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300007, 'SIN', 'Singapur', 'Singapur', 'Singapore Changi', 2, 'E24');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300008, 'HKG', 'Hong Kong', 'Hong Kong', 'Hong Kong', 2, '39');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300009, 'ATL', 'Atlanta', 'Estados Unidos', 'Hartsfield-Jackson', 1, 'T15');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300010, 'ORD', 'Chicago', 'Estados Unidos', 'OHare', 1, 'B22');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300011, 'AMS', 'Amsterdam', 'Holanda', 'Schiphol', 2, 'E18');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300012, 'FRA', 'Frankfurt', 'Alemania', 'Frankfurt', 2, 'D1');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300013, 'ICN', 'Seoul', 'Corea del Sur', 'Incheon', 1, '130');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300014, 'PVG', 'Shanghai', 'Chinna', 'Pudong', 1, '15');
insert into Destino (DestinoID, Codigo_aeropuerto, Ciudad, Pais, Nombre_aeropuerto, Terminal, Puerta) values (300015, 'MEX', 'Ciudad de Mexico', 'Mexico', 'Mexico', 2, '22');

SELECT * FROM Destino;

-- Table: Vuelo
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AR123', 300001, '2023-03-15 08:30:26', '2023-03-15 17:22:04', 'AR', 330);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AA345', 300002, '2023-07-25 14:45:13', '2023-07-25 20:56:15', 'AA', 777);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AA678', 300003, '2023-10-10 09:02:45', '2023-10-10 15:08:23', 'AA', 777);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('LH987', 300004, '2024-02-05 12:30:45', '2024-02-05 19:48:02', 'LH', 787);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('LH432', 300005, '2024-02-01 09:55:00', '2024-02-01 17:34:25', 'LH', 787);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('EK567', 300006, '2023-06-05 15:45:11', '2023-06-05 21:03:46', 'EK', 380);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('EK987', 300007, '2023-11-19 23:10:04', '2023-11-20 07:08:46', 'EK', 380);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('EK123', 300008, '2024-01-24 11:22:15', '2024-01-24 16:12:55', 'EK', 380);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AR369', 300009, '2023-04-08 13:20:43', '2023-04-08 18:23:22', 'AR', 330);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AA789', 300010, '2024-02-05 12:30:45', '2024-02-05 12:30:45', 'AA', 777);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('LH567', 300011, '2023-12-01 18:27:32', '2023-12-01 23:43:13', 'LH', 787);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('LH543', 300012, '2024-01-22 22:05:00', '2024-01-23 03:45:22', 'LH', 787);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('EK234', 300013, '2023-10-28 19:32:57', '2023-10-29 01:08:11', 'EK', 380);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('EK432', 300014, '2024-01-10 08:40:10', '2024-01-10 13:54:32', 'EK', 380);
insert into Vuelo (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave) values ('AR678', 300015, '2023-05-23 14:35:22', '2023-05-24 02:47:38', 'AR', 330);

SELECT * FROM Vuelo;

-- Table: Reserva
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500001, 100001, 'AR123', '2022-11-20 21:45:10', '25D', 1600, 200001);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500002, 100002, 'AA345', '2023-02-15 09:56:36', '06A', 2500, 200002);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500003, 100003, 'AA678', '2023-05-01 13:32:11', '45F', 800, 200003);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500004, 100004, 'LH987', '2024-01-28 21:10:35', '23A', 1100, 200004);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500005, 100005, 'LH432', '2023-11-29 10:23:34', '34D', 1000, 200005);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500006, 100006, 'EK567', '2023-03-21 11:45:02', '28J', 1500, 200006);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500007, 100007, 'EK987', '2023-07-04 15:08:24', '12B', 1900, 200007);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500008, 100008, 'EK123', '2023-10-27 17:34:09', '16C', 1800, 200008);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500009, 100009, 'AR369', '2023-02-23 09:25:56', '20A', 1000, 200009);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500010, 100010, 'AA789', '2024-01-03 22:07:11', '27F', 900, 200010);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500011, 100011, 'LH567', '2023-09-24 11:05:26', '32A', 850, 200011);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500012, 100012, 'LH543', '2023-10-19 19:34:21', '38C', 800, 200012);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500013, 100013, 'EK234', '2023-04-15 08:55:36', '08A', 2000, 200013);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500014, 100014, 'EK432', '2023-12-01 16:02:23', '11B', 1900, 200014);
insert into Reserva (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, AdicionalID) values (500015, 100015, 'AR678', '2023-01-28 10:42:11', '19E', 1700, 200015);

SELECT * FROM Reserva; 

-- Table: Tripulacion
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600001, 'Piloto', 'American Airlines');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600002, 'Tripulante', 'Lufthansa');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600003, 'Piloto', 'Emirates');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600004, 'Piloto', 'Aerolineas Argentinas');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600005, 'Piloto', 'Lufthansa');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600006, 'Piloto', 'American Airlines');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600007, 'Piloto', 'American Airlines');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600008, 'Piloto', 'Aerolineas Argentinas');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600009, 'Piloto', 'Aerolienas Argentinas');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600010, 'Piloto', 'Emirates');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600011, 'Piloto', 'American Airlines');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600012, 'Piloto', 'Aerolineas Argentinas');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600013, 'Piloto', 'Lufthansa');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600014, 'Piloto', 'American Airlines');
insert into Tripulacion (TripulanteID, Puesto, Aerolinea) values (600015, 'Piloto', 'Emirates');

SELECT * FROM Tripulacion;

-- Table: Feedback
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700001, 100001, 'AR123', 'Buen vuelo aunque el precio fue caro para el asiento', 3);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700002, 100002, 'AA345', 'Extremadamente comodo, como dormir en mi cama y delicioso el menu', 5);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700003, 100003, 'AA678', 'Muy apretado y mala comida', 1);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700004, 100004, 'LH987', 'Promedio', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700005, 100005, 'LH432', 'Acorde precio - calidad', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700006, 100006, 'EK567', 'Estuvo bien aunque poca variedad de comida', 3);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700007, 100007, 'EK987', 'Espectacular!', 5);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700008, 100008, 'EK123', 'Lo que esperaba', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700009, 100009, 'AR369', 'Me gusto aunque deberian hacer algo respecto a la cantidad de baños por vuelo', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700010, 100010, 'AA789', 'Buen precio aunque muy apretado', 3);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700011, 100011, 'LH567', 'Bueno Bonito Barato', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700012, 100012, 'LH543', 'Muy sucio el avion en general, incluyendo asientos y baños', 2);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700013, 100013, 'EK234', 'Variedad de comida, buen asiento. Aunque muy frio', 4);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700014, 100014, 'EK432', 'Comodo y espacioso', 5);
insert into Feedback (FeedbackID, PasajeroID, VueloID, Feedback, Rating) values (700015, 100015, 'AR678', 'Muy caro', 2);

SELECT * FROM Feedback;

	
	#CUARTO, CREAMOS LAS VISTAS

-- Vista: Informacion de vuelo - combina el vuelo con el destino
CREATE VIEW Vuelo_Info_View AS
SELECT V.*, D.Ciudad AS Ciudad_Destino, D.Pais AS Pais_Destino
FROM Vuelo V
JOIN Destino D ON V.DestinoID = D.DestinoID;

-- Vista: Informacion de la reserva - combina la reserva con la informacion de pasajero y de vuelo
CREATE VIEW Reserva_Info_View AS
SELECT R.ReservaID, R.FechaHora_reserva, R.Numero_asiento, R.Precio_ticket,
       P.Nombre AS Pasajero_Nombre, P.Apellido AS Pasajero_Apellido,
       V.VueloID, V.FechaHora_salida, V.FechaHora_llegada,
       D.Ciudad AS Ciudad_Destino, D.Pais AS Pais_Destino
FROM Reserva R
JOIN Pasajeros P ON R.PasajeroID = P.PasajeroID
JOIN Vuelo V ON R.VueloID = V.VueloID
JOIN Destino D ON V.DestinoID = D.DestinoID;

-- Vista: Informacion del feedback - combina el feedback con la informacion de pasajero y de vuelo
CREATE VIEW Feedback_Info_View AS
SELECT F.FeedbackID, F.Feedback, F.Rating,
       P.Nombre AS Pasajero_Nombre, P.Apellido AS Pasajero_Apellido,
       V.VueloID, V.FechaHora_salida, V.FechaHora_llegada
FROM Feedback F
JOIN Pasajeros P ON F.PasajeroID = P.PasajeroID
JOIN Vuelo V ON F.VueloID = V.VueloID;

-- Vista: Informacion del pasajero - combina los pasajeros con los adicionales
CREATE VIEW Pasajero_Info_View AS
SELECT P.*, A.Valijas_numero, A.Valijas_peso, A.Vegetariano, A.Seguro_de_viaje
FROM Pasajeros P
JOIN Adicionales A ON P.PasajeroID = A.PasajeroID;

-- Vista: Informacion del rating y precio por pasajero - combina los pasajeros con el precio que pagaron y el rating que pusieron
CREATE VIEW Passenger_Payment_Rating AS
SELECT P.PasajeroID, P.Nombre, P.Apellido, R.Precio_ticket, F.Rating
FROM Pasajeros P
JOIN Reserva R ON P.PasajeroID = R.PasajeroID
JOIN Feedback F ON P.PasajeroID = F.PasajeroID;

	#QUINTO, CREACION DE FUNCIONES

-- Funcion: El precio promedio del ticket para todos los pasajeros
DELIMITER //

CREATE FUNCTION PrecioPromedioTicket() RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE avgPrecio DECIMAL;
    
    SELECT AVG(Precio_ticket) INTO avgPrecio FROM Passenger_Payment_Rating;
    
    RETURN avgPrecio;
END//

DELIMITER ;

-- Funcion: El ingreso de las ventas a partir de sus precios
DELIMITER //

CREATE FUNCTION TotalRevenue() RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE totalRevenue DECIMAL;
    
    SELECT SUM(Precio_ticket) INTO totalRevenue FROM Reserva;
    
    RETURN totalRevenue;
END//

DELIMITER ;

	#SEXTO, CREAMOS LAS STORED PROCEDURES

-- ST: Actualizacion del precio pagado para una reserva
DELIMITER //

CREATE PROCEDURE UpdatePrecioTicket(
    IN ReservaID INT,
    IN Precio_Nuevo INT
)
BEGIN
    UPDATE Reserva SET Precio_ticket = Precio_Nuevo WHERE ReservaID = ReservaID;
END//

DELIMITER ;

-- ST: Pasajeros con un determinado rating o que hayan pagado un determinado precio
DELIMITER //

CREATE PROCEDURE GetPassengersByCriteria(
    IN minRating DECIMAL,
    IN maxPrice DECIMAL
)
BEGIN
    SELECT P.*
    FROM Pasajeros P
    JOIN Reserva R ON P.PasajeroID = R.PasajeroID
    JOIN Feedback F ON R.ReservaID = F.ReservaID
    WHERE F.Rating >= minRating AND R.Precio_ticket <= maxPrice;
END//

DELIMITER ;

	#SEPTIMO, CREAMOS LOS TRIGGERS CON TABLAS DE AUDITORIA

-- TRIGGER: Audit table para tabla Reserva  
DELIMITER //
CREATE TRIGGER Reserva_Audit_Trigger
AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
    INSERT INTO Reserva_Audit (ReservaID, PasajeroID, VueloID, FechaHora_reserva, Numero_asiento, Precio_ticket, Accion)
    VALUES (NEW.ReservaID, NEW.PasajeroID, NEW.VueloID, NEW.FechaHora_reserva, NEW.Numero_asiento, NEW.Precio_ticket, 'INSERT');
END;
//
DELIMITER ;

-- TRIGGER: Before insert en Reserva
DELIMITER //
CREATE TRIGGER Before_Insert_Reserva
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    DECLARE available_seats INT;
    SELECT COUNT(*) INTO available_seats FROM Reserva WHERE VueloID = NEW.VueloID;
    IF available_seats >= (SELECT Capacidad FROM Vuelo WHERE VueloID = NEW.VueloID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay asientos disponibles para este vuelo.';
    END IF;
END;
//
DELIMITER ;

-- TRIGGER: Audit table para tabla Vuelo 
DELIMITER //
CREATE TRIGGER Vuelo_Audit_Trigger
AFTER INSERT ON Vuelo
FOR EACH ROW
BEGIN
    INSERT INTO Vuelo_Audit (VueloID, DestinoID, FechaHora_salida, FechaHora_llegada, AerolineaID, Aeronave)
    VALUES (NEW.VueloID, NEW.DestinoID, NEW.FechaHora_salida, NEW.FechaHora_llegada, NEW.AerolineaID, NEW.Aeronave, 'INSERT');
END;
//
DELIMITER ;

	#EN OCTAVO Y ULTIMO LUGAR, ANALISIS DE DATOS

#Analisis demografico de los pasajeros
-- Cantidad total de pasajeros
SELECT COUNT(*) AS TotalPasajeros FROM Pasajeros;

-- Cantidad de pasajeros tripulantes
SELECT COUNT(*) AS TotalTripulantes FROM Pasajeros WHERE Tripulante = 1;

-- Cantidad de pasajeros vegetarianos
SELECT COUNT(*) AS TotalVegetarianos FROM Adicionales WHERE Vegetariano = 1;

-- Distribución de edades de los pasajeros
SELECT 
    CASE
        WHEN DATEDIFF(CURRENT_DATE(), Fecha_nacimiento) / 365 BETWEEN 0 AND 18 THEN '0-18'
        WHEN DATEDIFF(CURRENT_DATE(), Fecha_nacimiento) / 365 BETWEEN 19 AND 35 THEN '19-35'
        WHEN DATEDIFF(CURRENT_DATE(), Fecha_nacimiento) / 365 BETWEEN 36 AND 50 THEN '36-50'
        ELSE '51+'
    END AS GrupoEdad,
    COUNT(*) AS Cantidad
FROM Pasajeros
GROUP BY GrupoEdad;

#Analisis de las reservas
-- Ingreso total generado por las reservas
SELECT SUM(Precio_ticket) AS IngresoTotal FROM Reserva;

-- Cantidad de reservas por aerolínea
SELECT 
    V.AerolineaID,
    COUNT(*) AS CantidadReservas
FROM Reserva R
INNER JOIN Vuelo V ON R.VueloID = V.VueloID
GROUP BY V.AerolineaID;

-- Distribución de precios de los tickets
SELECT 
    CASE
        WHEN Precio_ticket BETWEEN 0 AND 500 THEN '0-500'
        WHEN Precio_ticket BETWEEN 501 AND 1000 THEN '501-1000'
        WHEN Precio_ticket BETWEEN 1001 AND 1500 THEN '1001-1500'
        ELSE '1501+'
    END AS RangoPrecio,
    COUNT(*) AS Cantidad
FROM Reserva
GROUP BY RangoPrecio;

#Analisis del Feedback
-- Rating promedio de los vuelos
SELECT AVG(Rating) AS RatingPromedio FROM Feedback;

-- Cantidad de feedbacks positivos, neutrales y negativos
SELECT 
    CASE
        WHEN Rating >= 4 THEN 'Positivo'
        WHEN Rating = 3 THEN 'Neutral'
        ELSE 'Negativo'
    END AS TipoFeedback,
    COUNT(*) AS Cantidad
FROM Feedback
GROUP BY TipoFeedback;

