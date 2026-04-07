-- 1. Tạo Database
CREATE DATABASE SalesManagement;
GO
USE SalesManagement;
GO

-- 2. Tạo bảng Category (Danh mục) - Phía '1' của Product
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- 3. Tạo bảng Supplier (Nhà cung cấp) - Phía '1' của Product
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(200) NOT NULL,
    ContactName NVARCHAR(100),
    Phone VARCHAR(20)
);

-- 4. Tạo bảng Order (Đơn hàng) - Phía '1' của OrderDetail
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME DEFAULT GETDATE(),
    CustomerName NVARCHAR(100)
);

-- 5. Tạo bảng Product (Sản phẩm)
-- Có quan hệ n-1 với Category và Supplier
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    Price DECIMAL(18, 2),
    CategoryID INT,
    SupplierID INT,
    -- Thiết lập khóa ngoại
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    CONSTRAINT FK_Product_Supplier FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- 6. Tạo bảng OrderDetail (Chi tiết đơn hàng)
-- Có quan hệ n-1 với Order và Product
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2),
    -- Thiết lập khóa ngoại
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
GO