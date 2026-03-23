CLASS zcl_170422035_work_with_intbl3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422035_work_with_intbl3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_employee,
            pernr          TYPE i,
            ad             TYPE string,
            soyad          TYPE string,
            yas            TYPE i,
            kayit_tarihi   TYPE d,
        END OF ty_employee.
    TYPES: tt_standart TYPE STANDARD TABLE OF ty_employee WITH NON-UNIQUE KEY pernr,
           tt_sorted TYPE SORTED TABLE OF ty_employee WITH UNIQUE KEY pernr,
           tt_hashed TYPE HASHED TABLE OF ty_employee WITH UNIQUE KEY pernr.

    DATA: lt_standart TYPE tt_standart,
          lt_sorted   TYPE tt_sorted,
          lt_hashed   TYPE tt_hashed.

    DATA: ls_employee TYPE ty_employee.

    ls_employee-pernr = 1001.
    ls_employee-ad = 'Ali'.
    ls_employee-soyad = 'Yilmaz'.
    ls_employee-yas = 28.
    ls_employee-kayit_tarihi = '20230511'.
    APPEND ls_employee TO lt_standart.
    INSERT ls_employee INTO TABLE lt_sorted.
    INSERT ls_employee INTO TABLE lt_hashed.
    CLEAR ls_employee.

    ls_employee-pernr = 1002.
    ls_employee-ad = 'Ayse'.
    ls_employee-soyad = 'Demir'.
    ls_employee-yas = 28.
    ls_employee-kayit_tarihi = '20230509'.
    APPEND ls_employee TO lt_standart.
    INSERT ls_employee INTO TABLE lt_sorted.
    INSERT ls_employee INTO TABLE lt_hashed.
    CLEAR ls_employee.

    ls_employee-pernr = 1003.
    ls_employee-ad = 'Mehmet'.
    ls_employee-soyad = 'Kaya'.
    ls_employee-yas = 28.
    ls_employee-kayit_tarihi = '20230516'.
    APPEND ls_employee TO lt_standart.
    INSERT ls_employee INTO TABLE lt_sorted.
    INSERT ls_employee INTO TABLE lt_hashed.
    CLEAR ls_employee.

    ls_employee-pernr = 1004.
    ls_employee-ad = 'Zeynep'.
    ls_employee-soyad = 'Celik'.
    ls_employee-yas = 22.
    ls_employee-kayit_tarihi = '20230512'.
    APPEND ls_employee TO lt_standart.
    INSERT ls_employee INTO TABLE lt_sorted.
    INSERT ls_employee INTO TABLE lt_hashed.
    CLEAR ls_employee.

    ls_employee-pernr = 1005.
    ls_employee-ad = 'Mustafa'.
    ls_employee-soyad = 'Aydin'.
    ls_employee-yas = 29.
    ls_employee-kayit_tarihi = '20230511'.
    APPEND ls_employee TO lt_standart.
    INSERT ls_employee INTO TABLE lt_sorted.
    INSERT ls_employee INTO TABLE lt_hashed.
    CLEAR ls_employee.


    READ TABLE lt_standart INTO ls_employee WITH KEY pernr = 1003.
    IF sy-subrc = 0.
        out->write( |Employee found: { ls_employee-pernr } |
        && | { ls_employee-ad } { ls_employee-soyad } | ).

    ENDIF.
    CLEAR ls_employee.

    SORT lt_standart by ad.
    READ TABLE lt_standart INTO ls_employee WITH KEY ad = 'Zeynep' BINARY SEARCH.
    IF sy-subrc = 0.
        out->write( |Employee found: { ls_employee-pernr } |
        && | { ls_employee-ad } { ls_employee-soyad } | ).

    ENDIF.
    CLEAR ls_employee.

    READ TABLE lt_standart INTO ls_employee WITH KEY pernr = 1002.
    IF sy-subrc = 0.
        out->write( |Employee found: { ls_employee-pernr } |
        && | { ls_employee-ad } { ls_employee-soyad } | ).

    ENDIF.
    CLEAR ls_employee.

    READ TABLE lt_standart INTO ls_employee WITH KEY pernr = 1004.
    IF sy-subrc = 0.
        out->write( |Employee found: { ls_employee-pernr } |
        && | { ls_employee-ad } { ls_employee-soyad } | ).

    ENDIF.
    CLEAR ls_employee.

  ENDMETHOD.
ENDCLASS.
