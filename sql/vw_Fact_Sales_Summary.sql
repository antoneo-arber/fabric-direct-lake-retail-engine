-- View: Summarized Sales & Inventory Aggregations for Direct Lake Semantic Model
CREATE VIEW [bi].[vw_Fact_Sales_Summary] AS
SELECT 
    CAST(s.TransactionDate AS DATE) AS SalesDate,
    s.ProductID,
    s.StoreID,
    s.SupplierID,
    COUNT(s.TransactionID) AS TotalTransactions,
    SUM(s.Quantity) AS TotalQuantitySold,
    SUM(s.SalesAmount) AS TotalRevenue,
    SUM(s.MarginAmount) AS TotalMargin
FROM [dbo].[Raw_Transactions] s
GROUP BY 
    CAST(s.TransactionDate AS DATE), 
    s.ProductID, 
    s.StoreID, 
    s.SupplierID;
