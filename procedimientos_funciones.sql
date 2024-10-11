-- Procedimientos Almacenados:
-- 1. Agregar un nuevo visitante.
DELIMITER $$
CREATE PROCEDURE insertarVisitante (
    `VisitorId` INT,
    `FirstName` VARCHAR(40),
    `LastName` VARCHAR(40),
    `BirthDate` DATETIME,
    `Email` VARCHAR(60),
    `Phone` VARCHAR(24),
    `Address` VARCHAR(70),
    `City` VARCHAR(40),
    `State` VARCHAR(40),
    `Country` VARCHAR(40),
    `PostalCode` VARCHAR(10))
BEGIN
    INSERT INTO Visitor(`VisitorId`, `FirstName`, `LastName`, `BirthDate`, `Email`, `Phone`, `Address`, `City`, `State`, `Country`, `PostalCode`) VALUES
    (`VisitorId`, `FirstName`, `LastName`, `BirthDate`, `Email`, `Phone`, `Address`, `City`, `State`, `Country`, `PostalCode`);
END $$

DELIMITER ;

-- 2. Registrar un nuevo mantenimiento para una atracción.
DELIMITER $$
CREATE PROCEDURE insertarMantenimiento (
    `MaintenanceId` INT,
    `AttractionId` INT,
    `EmployeeId` INT,
    `MaintenanceDate` DATETIME,
    `Details` VARCHAR(255))
    BEGIN
        INSERT INTO Maintenance(`MaintenanceId`, `AttractionId`, `EmployeeId`, `MaintenanceDate`, `Details`) VALUES
        (`MaintenanceId`, `AttractionId`, `EmployeeId`, `MaintenanceDate`, `Details`);
END $$;

-- 4. Eliminar un visitante por su ID.
DELIMITER $$
CREATE PROCEDURE eliminarVisitante (
    `VisitorId` INT)
BEGIN
    DELETE FROM Visitor WHERE `VisitorId` = `VisitorId`;
END $$;

-- Funciones
-- 1. Calcular el total de visitas a una atracción específica.
DELIMITER $$
CREATE FUNCTION totalVisitasAtraccion (
    `AttractionId` INT)
    RETURNS INT
    BEGIN
        DECLARE totalVisitas INT;
        SELECT COUNT(*) INTO totalVisitas FROM Visit WHERE `AttractionId` = `AttractionId`;
        RETURN totalVisitas;
END $$;

-- 2. Calcular el número de días desde el último mantenimiento de una atracción.
DELIMITER $$
CREATE FUNCTION diasDesdeUltimoMantenimiento (
    `AttractionId` INT)
    RETURNS INT
    BEGIN
        DECLARE dias INT;
        SELECT DATEDIFF(CURDATE(), MAX(MaintenanceDate)) INTO dias FROM Maintenance WHERE `AttractionId` = `AttractionId`;
        RETURN dias;
    END $$;




