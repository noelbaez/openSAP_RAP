CLASS ycl_rap_eml_0631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS YCL_RAP_EML_0631 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Step 1 - READ
*    READ ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    FROM VALUE #( ( TravelUUID = '9AE01B305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).

    "Step 2 - READ all fields
*    READ ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '9AE01B305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).

*    "Step 3 - READ some fields
*    READ ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    FIELDS (  AgencyID CustomerID  )
*    WITH VALUE #( ( TravelUUID = '9AE01B305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).

*    out->write( travels ).

*    "Step 4 - READ with association
*    READ ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel BY \_Booking
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '9AE01B305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(bookings).

    "Step 5 - READ and invalid record
*    READ ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '111111111111111111111111111' ) )
*    RESULT DATA(travels)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).

    "Step 6 - MODIFY example
*    MODIFY ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    UPDATE
*    SET FIELDS WITH VALUE #( ( TravelUUID = '9AE01B305CB6B44917000C0214639CF0'
*                               Description = 'Demo RAP modificationY' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
**    out->write( failed ).
**    out->write( reported ).
*    out->write( 'Record updated' ).
**
*    COMMIT ENTITIES
*    RESPONSE OF yi_rap_travel_0631
*    FAILED DATA(failed_COMMIT)
*    REPORTED DATA(reported_COMMIT).

*    "Step 7.  Create new record with MODIFY CREATE
*    MODIFY ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    CREATE
*    SET FIELDS WITH VALUE #( ( %cid = 'MyContentID'
*                               AgencyID    = '70041'
*                               CustomerID  = '594'
*                               BeginDate   = cl_abap_context_info=>get_system_date(  )
*                               EndDate     = cl_abap_context_info=>get_system_date(  ) + 10
*                               Description = 'I like RAP OpenSap' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*    RESPONSE OF yi_rap_travel_0631
*    FAILED DATA(failed_COMMIT)
*    REPORTED DATA(reported_COMMIT).
*
*    out->write( 'Record created' ).

    "Step 8 - Delete
*    MODIFY ENTITIES OF yi_rap_travel_0631
*    ENTITY Travel
*    DELETE FROM VALUE #( ( TravelUUID  = '12F8688AE93B1EEB88A255F3C490903A' ) )
*     MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).

*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*    RESPONSE OF yi_rap_travel_0631
*    FAILED DATA(failed_COMMIT)
*    REPORTED DATA(reported_COMMIT).
*
*    out->write( 'Record deleted' ).

  ENDMETHOD.
ENDCLASS.
