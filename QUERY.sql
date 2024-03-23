USE ANERI ; 


SELECT c.client_name
FROM Clients c
LEFT JOIN Projects p ON c.client_id = p.client_id
LEFT JOIN Invoices i ON p.project_id = i.project_id
WHERE i.invoice_id IS NULL;


SELECT s.supplier_name, GROUP_CONCAT(m.material_name) AS supplied_materials
FROM Suppliers s
INNER JOIN Materials m ON s.supplier_id = m.supplier_id
GROUP BY s.supplier_name;


SELECT c.client_name
FROM Clients c
INNER JOIN Projects p ON c.client_id = p.client_id
GROUP BY c.client_name
HAVING COUNT(p.project_id) > 1;

SELECT p.project_name, il.inspection_date, il.inspection_result
FROM Projects p
LEFT JOIN InspectionLogs il ON p.project_id = il.project_id
INNER JOIN (
    SELECT project_id, MAX(inspection_date) AS latest_inspection_date
    FROM InspectionLogs
    GROUP BY project_id
) latest_il ON il.project_id = latest_il.project_id AND il.inspection_date = latest_il.latest_inspection_date;
