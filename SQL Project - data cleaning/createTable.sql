-- Table: public.NashvilleHousing

-- DROP TABLE IF EXISTS public.NashvilleHousing;

CREATE TABLE IF NOT EXISTS public.NashvilleHousing
(
    UniqueID character varying(100) COLLATE pg_catalog."default",
    ParcelID character varying(100) COLLATE pg_catalog."default",
    LandUse character varying(100) COLLATE pg_catalog."default",
    PropertyAddress character varying(100) COLLATE pg_catalog."default",
    SaleDate date,
    SalePrice numeric,
    LegalReference character varying(100) COLLATE pg_catalog."default",
    SoldAsVacant character varying(100) COLLATE pg_catalog."default",
    OwnerName character varying(100) COLLATE pg_catalog."default",
    OwnerAddress character varying(100) COLLATE pg_catalog."default",
    Acreage numeric,
    TaxDistrict character varying(100) COLLATE pg_catalog."default",
    LandValue numeric,
    BuildingValue numeric,
    TotalValue numeric,
    YearBuilt numeric,
    Bedrooms numeric,
    FullBath numeric,
    HalfBath numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.NashvilleHousing
    OWNER to postgres;