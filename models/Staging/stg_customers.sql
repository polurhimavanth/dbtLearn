 WITH CityDetails AS (
        SELECT ci.CityID,
               ci.CityName,
               sp.StateProvinceCode,
               sp.StateProvinceName,
               co.CountryName,
               co.FormalName
        FROM `dbt_himavanthpolur.Cities` ci
        LEFT JOIN `dbt_himavanthpolur.StateProvinces` sp
            ON ci.StateProvinceID = sp.StateProvinceID
        LEFT JOIN `dbt_himavanthpolur.Countries` co
            ON sp.CountryID = co.CountryID 
    )
    
    SELECT cust.CustomerName,
           cat.CustomerCategoryName,
           dc.CityName,
           dc.StateProvinceCode,
           dc.StateProvinceName,
           dc.CountryName,
           dc.FormalName
    FROM `dbt_himavanthpolur.Customers` cust
    LEFT JOIN `dbt_himavanthpolur.CustomerCategories` cat
        ON cust.CustomerCategoryID = cat.CustomerCategoryID
    LEFT JOIN CityDetails dc
        ON cust.DeliveryCityID = dc.CityID
    LEFT JOIN CityDetails pc
        ON cust.PostalCityID = pc.CityID