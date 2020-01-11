*&---------------------------------------------------------------------*
*& Report zpeasant_multiplication
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpeasant_multiplication.

CLASS lcl_peasant_multiplication DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS calculate
      IMPORTING
        x             TYPE i
        y             TYPE i
      RETURNING
        VALUE(result) TYPE i.
ENDCLASS.

CLASS lcl_peasant_multiplication IMPLEMENTATION.
  METHOD peasant_multiplication.
    IF x = 1.
      result = y.
    ELSE.
      IF x MOD 2 > 0.
        result = y + calculate( x = x DIV 2
                                y = y + y ).
      ELSE.
        result = calculate( x = x DIV 2
                            y = y + y ).
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(result) = lcl_peasant_multiplication=>calculate( x = 2 y = 1024 ).
  WRITE result.
