/*
Cleaning data
*/
SELECT *
FROM nashvillehousing;

/*
populate property address data
*/
SELECT *
FROM nashvillehousing nh
where nh.propertyaddress IS NULL;

-- we can get the property address from the parcel ID

SELECT *
FROM nashvillehousing nh
ORDER BY nh.parcelid;

-- join the table to itself
-- COALESCE returns the first non-null value in the list of its arguments.

SELECT a.parcelid,
       a.propertyaddress,
       b.parcelid,
       b.propertyaddress,
       COALESCE(a.propertyaddress, b.propertyaddress) AS merged_propertyaddress
FROM nashvillehousing a
JOIN nashvillehousing b ON a.parcelid = b.parcelid
AND a.uniqueid <> b.uniqueid
WHERE a.propertyaddress IS NULL;


UPDATE nashvillehousing a
SET propertyaddress = COALESCE(a.propertyaddress, b.propertyaddress)
FROM nashvillehousing b
WHERE a.parcelid = b.parcelid
    AND a.uniqueid <> b.uniqueid
    AND a.propertyaddress IS NULL;


SELECT *
FROM nashvillehousing;

/*
Breaking address into individual columns (address, city, state)
*/
SELECT propertyaddress
FROM nashvillehousing;

-- let's get the address and city
 
SELECT SPLIT_PART(propertyaddress, ', ', 1) AS address, 
       SPLIT_PART(propertyaddress, ', ', 2) AS city
FROM nashvillehousing;

-- alter the table

ALTER TABLE nashvillehousing ADD COLUMN PropertySplitAddress VARCHAR(255);


ALTER TABLE nashvillehousing ADD COLUMN PropertySplitCity VARCHAR(255);


UPDATE nashvillehousing
SET PropertySplitAddress = SPLIT_PART(propertyaddress, ', ', 1);


UPDATE nashvillehousing
SET PropertySplitCity = SPLIT_PART(propertyaddress, ', ', 2);


SELECT PropertySplitAddress,
       PropertySplitCity
FROM nashvillehousing;

-- getting the address for owners

SELECT owneraddress,
       SPLIT_PART(owneraddress, ', ', 1) AS address,
       SPLIT_PART(owneraddress, ', ', 2) AS city,
       SPLIT_PART(owneraddress, ', ', 3) AS state
FROM nashvillehousing;


ALTER TABLE nashvillehousing ADD COLUMN OwnerSplitAddress VARCHAR(255);


ALTER TABLE nashvillehousing ADD COLUMN OwnerSplitCity VARCHAR(255);


ALTER TABLE nashvillehousing ADD COLUMN OwnerSplitState VARCHAR(255);


UPDATE nashvillehousing
SET OwnerSplitAddress = SPLIT_PART(owneraddress, ', ', 1);


UPDATE nashvillehousing
SET OwnerSplitCity = SPLIT_PART(owneraddress, ', ', 2);


UPDATE nashvillehousing
SET OwnerSplitState = SPLIT_PART(owneraddress, ', ', 3);

-- more useful data than being in one column

SELECT OwnerSplitAddress,
       OwnerSplitCity,
       OwnerSplitState
FROM nashvillehousing;

/* 
change Y and N to Yes and No in 'Sold as Vacant'
*/

SELECT DISTINCT(soldasvacant),
       COUNT(soldasvacant)
FROM nashvillehousing
GROUP BY soldasvacant
ORDER BY 2;


SELECT soldasvacant,
       CASE
           WHEN soldasvacant = 'Y' THEN 'Yes'
           WHEN soldasvacant = 'N' THEN 'No'
           ELSE soldasvacant
       END
FROM nashvillehousing;


UPDATE nashvillehousing
SET soldasvacant = CASE
                       WHEN soldasvacant = 'Y' THEN 'Yes'
                       WHEN soldasvacant = 'N' THEN 'No'
                       ELSE soldasvacant
                   END;




/*
Remove Duplicates
*/

-- find duplicates first
-- using a Common Table Expression
WITH duplicates AS (
    SELECT parcelid, propertyaddress, saleprice, saledate, legalreference
    FROM nashvillehousing
    GROUP BY parcelid, propertyaddress, saleprice, saledate, legalreference
    HAVING COUNT(*) > 1
)
SELECT *
FROM nashvillehousing
WHERE (parcelid, propertyaddress, saleprice, saledate, legalreference) IN (SELECT parcelid, propertyaddress, saleprice, saledate, legalreference FROM duplicates)
ORDER BY uniqueid;

-- delete duplicates
WITH duplicates AS (
    SELECT parcelid, propertyaddress, saleprice, saledate, legalreference
    FROM nashvillehousing
    GROUP BY parcelid, propertyaddress, saleprice, saledate, legalreference
    HAVING COUNT(*) > 1
)
DELETE
FROM nashvillehousing
WHERE (parcelid, propertyaddress, saleprice, saledate, legalreference) IN (SELECT parcelid, propertyaddress, saleprice, saledate, legalreference FROM duplicates)


/*
Delete unused columns
*/

SELECT *
FROM nashvillehousing;

ALTER TABLE nashvillehousing
DROP COLUMN owneraddress,
DROP COLUMN taxdistrict,
DROP COLUMN propertyaddress,
DROP COLUMN saledate;