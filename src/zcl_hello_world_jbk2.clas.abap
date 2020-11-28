CLASS zcl_hello_world_jbk2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELLO_WORLD_JBK2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( |Hello World ({ sy-uname } { cl_abap_context_info=>get_user_alias(  ) }), System date: { cl_abap_context_info=>get_system_date(  ) }, time:{ cl_abap_context_info=>get_system_time(  ) } | ).
  ENDMETHOD.
ENDCLASS.
