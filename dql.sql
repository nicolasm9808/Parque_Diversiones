-- 1. Obtener todas las atracciones operativas.
SELECT Name AS 'Atracciones operativas' from Attraction
WHERE Status = 'Operativa';

-- 2. Listar todos los visitantes que se encuentran en la base de datos.
SELECT concat(FirstName, ' ',LastName) AS Visitantes FROM Visitor;

-- 3. Mostrar los eventos programados junto con su precio.
SELECT Name AS Eventos, Price AS Precio FROM Event;

-- 4. Obtener el nombre y fecha de contratación de todos los empleados.
SELECT concat(FirstName, ' ',LastName) AS Empleado, HireDate AS 'Fecha Contratación' FROM Employee;

-- 5. Listar todos los boletos vendidos y su tipo.
SELECT TicketId AS 'Boletos Vendidos', TicketType AS Tipo FROM Ticket;

-- 6. Obtener el nombre de los visitantes y las atracciones que visitaron.
SELECT concat(V.FirstName, ' ',V.LastName) AS Visitante, A.Name AS Atraccion FROM Visit
JOIN Visitor AS V ON Visit.VisitId = V.VisitorId
JOIN Attraction AS A ON Visit.AttractionId = A.AttractionId;

-- 7. Listar los empleados que participaron en eventos, junto con el nombre del evento.
SELECT concat(E.FirstName, ' ',E.LastName) AS Empleado, Ev.Name AS Evento FROM EmployeeEvent EEv
JOIN Employee AS E ON E.EmployeeId = EEv.EmployeeId
JOIN Event AS Ev ON Ev.EventId = EEv.EventId;

-- 8. Mostrar los detalles de mantenimiento realizados por cada empleado, junto con la atracción.
SELECT concat(E.FirstName, ' ',E.LastName) AS Empleado, A.Name AS Atraccion, M.Details AS Detalle, M.MaintenanceDate AS Fecha FROM Maintenance M
JOIN Employee AS E ON E.EmployeeId = M.EmployeeId
JOIN Attraction AS A ON A.AttractionId = M.AttractionId
ORDER BY Empleado;

-- 9. Obtener el nombre del visitante y la atracción que calificó junto con la puntuación.
SELECT concat(V.FirstName, ' ',V.LastName) AS Visitante, A.Name AS Atraccion, Rating AS Calificacion FROM Visit
JOIN Visitor AS V ON Visit.VisitorId = V.VisitorId
JOIN Attraction AS A ON Visit.AttractionId = A.AttractionId;

-- 10. Listar los visitantes que asistieron a eventos, con el nombre del evento.
SELECT concat(V.FirstName, ' ',V.LastName) AS Visitante, E.Name AS Evento FROM VisitorEvent VE
JOIN Visitor AS V ON VE.VisitorId = V.VisitorId
JOIN Event AS E ON VE.EventId = E.EventId;