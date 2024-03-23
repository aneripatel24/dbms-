CREATE DATABASE ANERI;

USE ANERI;

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE IF NOT EXISTS Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE Labour (
    labour_id INT PRIMARY KEY AUTO_INCREMENT,
    labour_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    contact_number VARCHAR(20)
);


CREATE TABLE Materials (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    material_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE Equipments (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    invoice_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    transaction_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);


CREATE TABLE Permits (
    permit_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    permit_type VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);


CREATE TABLE InspectionLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    inspector_name VARCHAR(100),
    inspection_date DATE,
    inspection_result VARCHAR(255),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
); 

INSERT INTO Suppliers (supplier_name, contact_person, contact_number, email) VALUES
('Steel Solutions Pvt. Ltd.', 'Rajesh Sharma', '+91 98765 43210', 'rajesh@steelsolutions.com'),
('Concrete Creations', 'Meera Patel', '+91 98765 67890', 'meera@concretecreations.in'),
('Taj Hardware Stores', 'Amit Singh', '+91 98765 12345', 'amit@tajhardware.com'),
('Mumbai Marble Traders', 'Priya Desai', '+91 98765 56789', 'priya@mumbaimarble.com'),
('Ganges Glass Suppliers', 'Vikram Kapoor', '+91 98765 24680', 'vikram@gangesglass.com'),
('Jaipur Ceramics', 'Rajesh Mehta', '+91 98765 13579', 'rajesh@jaipurceramics.in'),
('Darjeeling Doors & Windows', 'Arun Gupta', '+91 98765 98765', 'arun@darjeelingdoors.com'),
('Kerala Timber Co.', 'Suresh Menon', '+91 98765 56473', 'suresh@keralatimber.com'),
('Varanasi Pipes & Plumbing', 'Anita Verma', '+91 98765 78456', 'anita@varanasipipes.com'),
('Punjab Paints & Coatings', 'Harvinder Singh', '+91 98765 35465', 'harvinder@punjabpaints.com'),
('Rajasthan Roofing Solutions', 'Deepak Sharma', '+91 98765 45678', 'deepak@rajasthanroofing.com'),
('Goa Electricals', 'Ravi Naik', '+91 98765 78901', 'ravi@goaelectricals.in'),
('Hyderabad HVAC Systems', 'Ramesh Reddy', '+91 98765 10101', 'ramesh@hyderabadhvac.com'),
('Kolkata Construction Chemicals', 'Sanjay Dutta', '+91 98765 20202', 'sanjay@kolkatachemicals.in'),
('Lucknow Locks & Hardware', 'Neha Khan', '+91 98765 30303', 'neha@lucknowlocks.com'),
('Delhi Drainage Solutions', 'Vijay Malhotra', '+91 98765 40404', 'vijay@delhidrainage.in'),
('Chennai Cement Suppliers', 'Gowri Srinivasan', '+91 98765 50505', 'gowri@chennaicement.com'),
('Ahmedabad Aggregates Co.', 'Amit Patel', '+91 98765 60606', 'amit@ahmedabadaggregates.com'),
('Pune Paint Brushes', 'Sameer Deshpande', '+91 98765 70707', 'sameer@punepaintbrushes.com'),
('Bangalore Bolts & Fasteners', 'Anand Rao', '+91 98765 80808', 'anand@bangalorebolts.com');

INSERT INTO Clients (client_name, contact_person, contact_number, email) VALUES
('Raj Construction Pvt. Ltd.', 'Amit Shah', '+91 98765 43210', 'amit@rajconstruction.com'),
('Ganga Builders & Developers', 'Neha Gupta', '+91 98765 67890', 'neha@gangabuilders.in'),
('Taj Infrastructure Projects', 'Ravi Singh', '+91 98765 12345', 'ravi@tajinfra.com'),
('Mumbai Realty Ventures', 'Sanjay Patel', '+91 98765 56789', 'sanjay@mumbairealty.co.in'),
('Kaveri Homes Pvt. Ltd.', 'Anita Sharma', '+91 98765 24680', 'anita@kaverihomes.com'),
('Jaipur Builders Consortium', 'Vikram Singh', '+91 98765 13579', 'vikram@jaipurbuilders.in'),
('Darjeeling Developers', 'Rajesh Reddy', '+91 98765 98765', 'rajesh@darjeelingdevelopers.com'),
('Kerala Housing Corporation', 'Suresh Menon', '+91 98765 56473', 'suresh@keralahousing.co.in'),
('Varanasi Constructions Ltd.', 'Meera Verma', '+91 98765 78456', 'meera@varanasiconstructions.com'),
('Punjab Builders & Associates', 'Harvinder Singh', '+91 98765 35465', 'harvinder@punjabbuilders.in'),
('Rajasthan Realty Solutions', 'Deepika Sharma', '+91 98765 45678', 'deepika@rajasthanrealty.com'),
('Goa Infrastructure Developers', 'Ravi Naik', '+91 98765 78901', 'ravi@goadev.com'),
('Hyderabad Housing Projects', 'Ramesh Reddy', '+91 98765 10101', 'ramesh@hyderabadhousing.in'),
('Kolkata Constructions Pvt. Ltd.', 'Sanjay Dutta', '+91 98765 20202', 'sanjay@kolkataconstructions.com'),
('Lucknow Realty Enterprises', 'Neha Khan', '+91 98765 30303', 'neha@lucknowrealty.in'),
('Delhi Developers & Builders', 'Vijay Malhotra', '+91 98765 40404', 'vijay@delhidevelopers.com'),
('Chennai Realty Ventures', 'Gowri Srinivasan', '+91 98765 50505', 'gowri@chennairealty.com'),
('Ahmedabad Infrastructure Ltd.', 'Amit Patel', '+91 98765 60606', 'amit@ahmedabadinfra.com'),
('Pune Builders Consortium', 'Sameer Deshpande', '+91 98765 70707', 'sameer@punebuilders.in'),
('Bangalore Realty Solutions', 'Anand Rao', '+91 98765 80808', 'anand@bangalorerealty.com');

INSERT INTO Labour (labour_id, labour_name, job_title, contact_number) VALUES
(1, 'Ramesh Kumar', 'Mason', '+91 98765 43210'),
(2, 'Suresh Singh', 'Carpenter', '+91 98765 67890'),
(3, 'Anil Yadav', 'Electrician', '+91 98765 12345'),
(4, 'Vijay Sharma', 'Plumber', '+91 98765 56789'),
(5, 'Deepak Mishra', 'Painter', '+91 98765 24680'),
(6, 'Arun Patel', 'Welder', '+91 98765 13579'),
(7, 'Rajesh Gupta', 'Tile Installer', '+91 98765 98765'),
(8, 'Sanjay Verma', 'Roofing Specialist', '+91 98765 56473'),
(9, 'Manoj Tiwari', 'Concrete Worker', '+91 98765 78456'),
(10, 'Ajay Kumar', 'Bricklayer', '+91 98765 35465'),
(11, 'Sunil Singh', 'Plasterer', '+91 98765 45678'),
(12, 'Prakash Mishra', 'Landscaper', '+91 98765 78901'),
(13, 'Rajiv Dubey', 'HVAC Technician', '+91 98765 10101'),
(14, 'Amit Tiwari', 'Flooring Installer', '+91 98765 20202'),
(15, 'Gopal Singh', 'Scaffolder', '+91 98765 30303'),
(16, 'Shankar Yadav', 'Demolition Expert', '+91 98765 40404'),
(17, 'Vinod Sharma', 'Drywaller', '+91 98765 50505'),
(18, 'Ravi Patel', 'Plasterer', '+91 98765 60606'),
(19, 'Kiran Kumar', 'Carpenter', '+91 98765 70707'),
(20, 'Rajesh Mishra', 'Electrician', '+91 98765 80808');

INSERT INTO Materials (material_id, material_name, supplier_id) VALUES
(1, 'Steel Beams', 1),
(2, 'Concrete Blocks', 2),
(3, 'Electrical Wires', 3),
(4, 'PVC Pipes', 4),
(5, 'Paint Buckets', 5),
(6, 'Welding Rods', 6),
(7, 'Ceramic Tiles', 7),
(8, 'Roofing Sheets', 8),
(9, 'Cement Bags', 9),
(10, 'Bricks', 10),
(11, 'Plaster of Paris', 11),
(12, 'Grass Turf', 12),
(13, 'HVAC Systems', 13),
(14, 'Wooden Flooring', 14),
(15, 'Scaffolding', 15),
(16, 'Demolition Tools', 16),
(17, 'Drywall Sheets', 17),
(18, 'Plastering Tools', 18),
(19, 'Plywood Sheets', 19),
(20, 'Electrical Panels', 20);


INSERT INTO Equipments (equipment_id, equipment_name, supplier_id) VALUES
(1, 'Concrete Mixer', 1),
(2, 'Scaffolding System', 2),
(3, 'Electric Drill', 3),
(4, 'Welding Machine', 4),
(5, 'Paint Sprayer', 5),
(6, 'Generator', 6),
(7, 'Tile Cutter', 7),
(8, 'Roofing Nail Gun', 8),
(9, 'Cement Mixer', 9),
(10, 'Brick Cutter', 10),
(11, 'Plastering Machine', 11),
(12, 'Lawn Mower', 12),
(13, 'Air Conditioner', 13),
(14, 'Floor Sander', 14),
(15, 'Scaffold Hoist', 15),
(16, 'Jackhammer', 16),
(17, 'Drywall Lift', 17),
(18, 'Plaster Trowel', 18),
(19, 'Circular Saw', 19),
(20, 'Transformer', 20);

INSERT INTO Projects (project_id, project_name, start_date, end_date, client_id) VALUES
(1, 'Raj Towers Construction', '2024-01-10', '2024-12-20', 1),
(2, 'Ganga Residency Project', '2024-02-15', '2024-11-30', 2),
(3, 'Taj Business Park Development', '2024-03-20', '2024-10-15', 3),
(4, 'Mumbai Heights Apartments', '2024-04-05', '2024-09-25', 4),
(5, 'Kaveri Gardens Township', '2024-05-12', '2024-08-10', 5),
(6, 'Jaipur Heritage Villas', '2024-06-18', '2024-07-30', 6),
(7, 'Darjeeling Eco Resorts', '2024-07-01', '2024-07-31', 7),
(8, 'Kerala Backwater Retreat', '2024-08-09', '2024-09-20', 8),
(9, 'Varanasi Riverside Project', '2024-09-15', '2024-10-25', 9),
(10, 'Punjab Urban Redevelopment', '2024-10-22', '2024-12-05', 10),
(11, 'Rajasthan Royal Residences', '2024-11-07', '2024-12-15', 11),
(12, 'Goa Beachfront Villas', '2024-12-10', '2025-01-25', 12),
(13, 'Hyderabad IT Park Construction', '2025-01-15', '2025-03-05', 13),
(14, 'Kolkata City Centre Plaza', '2025-02-20', '2025-04-10', 14),
(15, 'Lucknow Metro Rail Project', '2025-03-25', '2025-06-15', 15),
(16, 'Delhi Smart City Initiative', '2025-04-30', '2025-07-20', 16),
(17, 'Chennai Coastal Expressway', '2025-06-05', '2025-08-25', 17),
(18, 'Ahmedabad Industrial Park', '2025-07-10', '2025-09-15', 18),
(19, 'Pune Township Expansion', '2025-08-15', '2025-10-30', 19),
(20, 'Bangalore Tech Hub Development', '2025-09-20', '2025-12-10', 20);

INSERT INTO Invoices (invoice_id, project_id, invoice_date, amount) VALUES
(1, 1, '2024-12-15', 25000.00),
(2, 2, '2024-11-30', 32000.00),
(3, 3, '2024-10-20', 42000.00),
(4, 4, '2024-09-30', 55000.00),
(5, 5, '2024-08-25', 28000.00),
(6, 6, '2024-07-31', 18000.00),
(7, 7, '2024-07-15', 15000.00),
(8, 8, '2024-09-10', 35000.00),
(9, 9, '2024-10-20', 39000.00),
(10, 10, '2024-12-01', 48000.00),
(11, 11, '2024-12-10', 52000.00),
(12, 12, '2025-01-20', 60000.00),
(13, 13, '2025-03-05', 72000.00),
(14, 14, '2025-04-15', 82000.00),
(15, 15, '2025-06-30', 95000.00),
(16, 16, '2025-08-15', 110000.00),
(17, 17, '2025-10-10', 125000.00),
(18, 18, '2025-09-05', 115000.00),
(19, 19, '2025-11-20', 135000.00),
(20, 20, '2025-12-05', 140000.00);


INSERT INTO Transactions (transaction_id, invoice_id, transaction_date, amount) VALUES
(1, 1, '2025-01-05', 25000.00),
(2, 2, '2025-01-10', 32000.00),
(3, 3, '2025-01-15', 42000.00),
(4, 4, '2025-01-20', 55000.00),
(5, 5, '2025-01-25', 28000.00),
(6, 6, '2025-01-30', 18000.00),
(7, 7, '2025-02-05', 15000.00),
(8, 8, '2025-02-10', 35000.00),
(9, 9, '2025-02-15', 39000.00),
(10, 10, '2025-02-20', 48000.00),
(11, 11, '2025-02-25', 52000.00),
(12, 12, '2025-03-05', 60000.00),
(13, 13, '2025-03-10', 72000.00),
(14, 14, '2025-03-15', 82000.00),
(15, 15, '2025-03-20', 95000.00),
(16, 16, '2025-03-25', 110000.00),
(17, 17, '2025-03-30', 125000.00),
(18, 18, '2025-04-05', 115000.00),
(19, 19, '2025-04-10', 135000.00),
(20, 20, '2025-04-15', 140000.00);

INSERT INTO Permits (permit_id, project_id, permit_type, issue_date, expiry_date) VALUES
(1, 1, 'Building Permit', '2024-01-20', '2024-12-31'),
(2, 2, 'Construction Permit', '2024-02-25', '2024-11-30'),
(3, 3, 'Development Permit', '2024-03-30', '2024-10-31'),
(4, 4, 'Building Approval', '2024-04-05', '2024-09-30'),
(5, 5, 'Construction License', '2024-05-15', '2024-08-31'),
(6, 6, 'Building Clearance', '2024-06-20', '2024-07-31'),
(7, 7, 'Construction Authorization', '2024-07-10', '2024-07-31'),
(8, 8, 'Development Consent', '2024-08-05', '2024-09-30'),
(9, 9, 'Building Permit', '2024-09-15', '2024-10-31'),
(10, 10, 'Construction Permit', '2024-10-25', '2024-12-31'),
(11, 11, 'Development Permit', '2024-11-10', '2024-12-31'),
(12, 12, 'Building Approval', '2025-01-05', '2025-01-31'),
(13, 13, 'Construction License', '2025-02-10', '2025-02-28'),
(14, 14, 'Building Clearance', '2025-03-15', '2025-03-31'),
(15, 15, 'Construction Authorization', '2025-04-20', '2025-04-30'),
(16, 16, 'Development Consent', '2025-05-25', '2025-05-31'),
(17, 17, 'Building Permit', '2025-06-10', '2025-06-30'),
(18, 18, 'Construction Permit', '2025-07-15', '2025-07-31'),
(19, 19, 'Development Permit', '2025-08-20', '2025-08-31'),
(20, 20, 'Building Approval', '2025-09-25', '2025-09-30');

INSERT INTO InspectionLogs (log_id, project_id, inspector_name, inspection_date, inspection_result) VALUES
(1, 1, 'Amit Sharma', '2024-12-20', 'Passed inspection, ready for next phase.'),
(2, 2, 'Neha Gupta', '2024-11-28', 'Inspected electrical wiring, minor adjustments needed.'),
(3, 3, 'Ravi Singh', '2024-10-25', 'Found no issues, project proceeding as planned.'),
(4, 4, 'Sanjay Patel', '2024-09-28', 'Inspected structural integrity, all satisfactory.'),
(5, 5, 'Anita Sharma', '2024-08-28', 'Inspected plumbing system, no leaks detected.'),
(6, 6, 'Vikram Singh', '2024-07-30', 'Approved tile installation, quality workmanship.'),
(7, 7, 'Rajesh Reddy', '2024-07-10', 'Found no violations, project compliance confirmed.'),
(8, 8, 'Sanjay Verma', '2024-09-15', 'Inspected roofing, recommended minor repairs.'),
(9, 9, 'Meera Verma', '2024-10-25', 'Reviewed safety measures, all protocols followed.'),
(10, 10, 'Harvinder Singh', '2024-12-05', 'Inspected brickwork, satisfactory.'),
(11, 11, 'Deepika Sharma', '2024-12-10', 'Approved plumbing fixtures, no issues found.'),
(12, 12, 'Ravi Naik', '2025-01-25', 'Inspected landscaping, additional planting required.'),
(13, 13, 'Ramesh Reddy', '2025-03-05', 'Approved HVAC installation, efficient system.'),
(14, 14, 'Sanjay Dutta', '2025-04-10', 'Found no defects in construction, project on track.'),
(15, 15, 'Neha Khan', '2025-06-15', 'Recommended adjustments to metro rail design.'),
(16, 16, 'Vijay Malhotra', '2025-08-20', 'Inspected smart city infrastructure, improvements needed.'),
(17, 17, 'Gowri Srinivasan', '2025-10-25', 'Approved coastal expressway construction, environmental measures in place.'),
(18, 18, 'Amit Patel', '2025-09-10', 'Inspected industrial park facilities, safety protocols satisfactory.'),
(19, 19, 'Sameer Deshpande', '2025-11-20', 'Found no violations in township expansion, project greenlit.'),
(20, 20, 'Anand Rao', '2025-12-10', 'Recommended tech enhancements for tech hub development project.');
