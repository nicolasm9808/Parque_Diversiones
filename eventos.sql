-- Eventos Programados
-- 1. Evento para realizar un chequeo de mantenimiento semanal de una atracción.
DELIMITER $$
CREATE TRIGGER CheckMaintenance
BEFORE INSERT ON Maintenance
FOR EACH ROW
BEGIN
    DECLARE AttractionName VARCHAR(50);
    DECLARE MaintenanceDate DATE;
    DECLARE MaintenanceDetails VARCHAR(255);

    SELECT Name INTO AttractionName FROM Attraction WHERE AttractionId = NEW.AttractionId;
    SELECT MaintenanceDate INTO MaintenanceDate FROM Maintenance WHERE MaintenanceId = NEW.MaintenanceId;
    SELECT Details INTO MaintenanceDetails FROM Maintenance WHERE MaintenanceId = NEW.MaintenanceId;

    IF MaintenanceDate = CURDATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = CONCAT('No se puede realizar el mantenimiento de la atracción ', AttractionName, ' en este momento.');
    END IF;

    IF MaintenanceDetails = 'Reparacion' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = CONCAT('No se puede realizar un mantenimiento de reparación de la atracción ', AttractionName, '.');
    END IF;

END $$