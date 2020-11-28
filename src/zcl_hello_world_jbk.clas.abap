CLASS zcl_hello_world_jbk DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELLO_WORLD_JBK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA itab TYPE TABLE OF i WITH EMPTY KEY.
*    itab = VALUE #( FOR j = 1 WHILE j <= 10 ( j ) ).
*    out->write( itab ).
*
*    DATA(sum) = REDUCE i( INIT x = 0 FOR wa IN itab NEXT x = x + wa ).
*    Out->write( sum ).
*
*    SELECT SUM( table_line ) FROM @itab AS data INTO @DATA(total).
*    out->write( TOTAL ).


*    TYPES itab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
*
*    DATA(itab) = VALUE itab( ( 1 ) ( 1 ) ( 2 ) ( 2 ) ).
*
*    LOOP AT itab INTO DATA(wa) GROUP BY wa.
*      LOOP AT GROUP wa INTO DATA(member).
**        out->write( member ).
**        out->write( member ).
*      ENDLOOP.
*    ENDLOOP.

*    LOOP AT itab ASSIGNING FIELD-SYMBOL(<fs>) GROUP BY <fs>.
*      LOOP AT GROUP <fs> INTO member.
*        out->write( member ).
*      ENDLOOP.
*    ENDLOOP.
*
*    LOOP AT itab REFERENCE INTO DATA(dref) GROUP BY dref->*.
*      LOOP AT GROUP dref INTO member.
*        out->write( member ).
*      ENDLOOP.
*    ENDLOOP.
**
*    LOOP AT itab INTO wa GROUP BY wa
*                 INTO DATA(group).
*      LOOP AT GROUP group INTO member.
*        out->write( member ).
*      ENDLOOP.
*    ENDLOOP.
*
*    LOOP AT itab INTO wa GROUP BY wa
*                 ASSIGNING FIELD-SYMBOL(<group>).
*      LOOP AT GROUP <group> INTO member.
*        ...
*      ENDLOOP.
*    ENDLOOP.
*
*    LOOP AT itab INTO wa GROUP BY wa
*                 REFERENCE INTO DATA(group_ref).
*      LOOP AT GROUP group_ref INTO member.
*        out->write( member ).
*      ENDLOOP.
*    ENDLOOP.

*    TYPES:
*      BEGIN OF struct,
*        key1 TYPE string,
*        key2 TYPE string,
*        col  TYPE i,
*      END OF struct,
*      itab TYPE STANDARD TABLE OF struct WITH EMPTY KEY.
*
*    DATA(itab) = VALUE itab(
*      ( key1 = `a` key2 = `a` col = 1 )
*      ( key1 = `a` key2 = `b` col = 2 )
*      ( key1 = `a` key2 = `a` col = 3 )
*      ( key1 = `a` key2 = `a` col = 4 )
*      ( key1 = `a` key2 = `b` col = 5 )
*      ( key1 = `b` key2 = `a` col = 6 )
*      ( key1 = `b` key2 = `a` col = 7 )  ).
*
*    DATA members TYPE itab.
*    LOOP AT itab ASSIGNING FIELD-SYMBOL(<wa>)
*                 GROUP BY ( key1 = <wa>-key1
*                            key2 = <wa>-key2
*                            size = GROUP SIZE
*                            index = GROUP INDEX )
*                 REFERENCE INTO DATA(group_ref).
*      out->write( group_ref->* ).
*      out->write(
*          |Group Size: {  group_ref->size  }, | &&
*          |Group Index: { group_ref->index }| ).
**      out->write( <wa> ).
*      CLEAR members.
*      LOOP AT GROUP group_ref ASSIGNING FIELD-SYMBOL(<flight>).
*        members = VALUE #( BASE members ( <flight> ) ).
**        append <flight> to members.
*      ENDLOOP.
*      out->write( members ).
*    ENDLOOP.

*    TYPES tt_airlineid TYPE TABLE OF /dmo/carrier_id WITH EMPTY KEY.
*    TYPES: BEGIN OF t_demo,
*             airlineid    TYPE /dmo/carrier_id,
*             connectionid TYPE /dmo/connection_id,
*           END OF t_demo,
*           tt_demo TYPE TABLE OF t_demo WITH EMPTY KEY.
*
*    DATA(s) = VALUE t_demo(  ).

    DATA members TYPE TABLE OF /DMO/I_Flight.
    SELECT * FROM /DMO/I_Flight INTO TABLE @DATA(flights).

    LOOP AT flights ASSIGNING FIELD-SYMBOL(<fs>) GROUP BY <fs>-airlineid ASCENDING.
      out->write( |Group: { <fs>-AirlineID }| ).
      clear members.
      LOOP AT GROUP <fs> ASSIGNING FIELD-SYMBOL(<member>) .
        members = VALUE #( BASE members ( <member> ) ).
      ENDLOOP.
      out->write(  members ).
    ENDLOOP.

*    SELECT DISTINCT airlineid FROM @flights AS data ORDER BY airlineid INTO TABLE @DATA(it_data).
*    out->write( it_data ).
*
*    out->write( VALUE tt_airlineid( FOR GROUPS <grp> OF wa IN flights
*                                    GROUP BY wa-AirlineID ASCENDING WITHOUT MEMBERS ( <grp> ) ) ).
*
*    out->write( VALUE tt_demo( FOR GROUPS <grp2> OF wa2 IN flights
*                               GROUP BY ( air = wa2-AirlineID
*                                          con = wa2-ConnectionID )
*                               ASCENDING WITHOUT MEMBERS  ( <grp2> ) ) ).

*   it_travel_id = VALUE #(  FOR GROUPS <booking> OF booking_key IN keys
*                                       GROUP BY booking_key-travel_id WITHOUT MEMBERS
*                                             ( <booking> ) ) ).

*    TYPES: BEGIN OF TY_group,
*             airlineID    TYPE /dmo/i_flight-AirlineID,
*             connectionid TYPE /dmo/i_flight-connectionid,
*             price        TYPE /dmo/i_flight-Price,
**             idx          type sy-index,
*           END OF ty_group.
*
**    TYPES group_keys TYPE STANDARD TABLE OF /DMO/I_Flight WITH EMPTY KEY.
*    TYPES group_keys TYPE SORTED TABLE OF ty_group WITH NON-UNIQUE key airlineid connectionid.
*
*    out->write(
*
*      VALUE group_keys(
*        FOR GROUPS carrier OF wa IN flights INDEX INTO idx
**
*        GROUP BY ( carr = wa-airlineid
*                   conn = wa-connectionid )
**                   ASCENDING
**                   WITHOUT MEMBERS ( carrier ) )
*          LET tprice = REDUCE /dmo/i_flight-Price( INIT s TYPE /dmo/i_flight-Price
*                                                   FOR r IN GROUP carrier
*                                                   NEXT s = s + r-price )
*          IN ( airlineid = carrier-carr
*               connectionid = carrier-conn
*               price = tprice )
*                )
*                ).

*    SELECT * FROM /DMO/I_Flight INTO TABLE @DATA(flights).
*    DATA members TYPE TABLE OF /DMO/I_Flight.
*    LOOP AT flights INTO DATA(flight)
*         GROUP BY ( carr = flight-AirlineID
*                    conn = flight-ConnectionID
*                    size = GROUP SIZE
*                    index = GROUP INDEX )
*                  ASCENDING
*                  REFERENCE INTO DATA(group_ref).
*      out->write(
*        |Group Key: { group_ref->carr }, { group_ref->conn }| ).
*      out->write(
*        |Group Size: {  group_ref->size  }, | &&
*        |Group Index: { group_ref->index }| ).
*      CLEAR members.
*      LOOP AT GROUP group_ref ASSIGNING FIELD-SYMBOL(<flight>).
*        members = VALUE #( BASE members ( <flight> ) ).
*      ENDLOOP.
*      out->write( members ).
*    ENDLOOP..

*    SELECT airlineid, CONNECTIONid, SUM( price ) AS price
*    FROM @flights AS data
*    GROUP BY airlineid, connectionid
*    ORDER BY airlineid, connectionid
*    INTO TABLE @DATA(it_tab2).
*
*    out->write( it_tab2 ).

  ENDMETHOD.
ENDCLASS.
