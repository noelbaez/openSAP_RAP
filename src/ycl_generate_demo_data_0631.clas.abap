CLASS ycl_generate_demo_data_0631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_generate_demo_data_0631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


    "Delete data from tables
    DELETE FROM yrap_atrav_0631. "Travel
    DELETE FROM yrap_abook_0631. "Booking

    "Insert Travel data
    INSERT yrap_atrav_0631 FROM (
    SELECT FROM /dmo/travel
    FIELDS
      uuid(  )      AS travel_uuid ,
      travel_id     AS travel_id,
      agency_id     AS  agency_id,
      customer_id   AS customer_id,
      begin_date    AS begin_date,
      end_date      AS end_date,
      booking_fee   AS booking_fee,
      total_price   AS  total_price,
      currency_code AS currency_code,
      description   AS description,
      CASE status
      WHEN 'B' THEN 'A'
      WHEN 'X' THEN 'X'
      ELSE 'O'
      END           AS overall_status,
      createdby     AS created_by,
      createdat     AS created_at,
      lastchangedby AS last_changed_by,
      lastchangedat AS last_changed_at,
      lastchangedat AS local_last_changed_at
      ORDER BY travel_id UP TO 200 ROWS
     ).
    COMMIT WORK.

    "Insert Booking data
    INSERT yrap_abook_0631 FROM (
    SELECT FROM /dmo/booking AS booking
       JOIN yrap_atrav_0631 AS y
       ON booking~travel_id = y~travel_id
       FIELDS
       uuid( )               AS booking_uuid,
       y~travel_uuid         AS travel_uuid,
       booking~booking_id    AS booking_id,
       booking~booking_date  AS booking_date,
       booking~customer_id   AS customer_id,
       booking~carrier_id    AS carrier_id,
       booking~connection_id AS connection_id,
       booking~flight_date   AS flight_date,
       booking~flight_price  AS flight_price,
       booking~currency_code AS currency_code,
       y~created_by          AS created_by,
       y~last_changed_by     AS last_changed_by,
       y~last_changed_at     AS local_last_changed_at
     ).
    COMMIT WORK.

    out->write( 'Travel and Booking data inserted.' ).
  ENDMETHOD.

ENDCLASS.
