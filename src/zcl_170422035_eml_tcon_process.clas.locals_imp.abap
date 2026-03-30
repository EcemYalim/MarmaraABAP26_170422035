*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection_eml DEFINITION.
    PUBLIC SECTION.
        CLASS-METHODS:
*            insert_data.
*           read_data.
*           update_data.
            delete_data.
ENDCLASS.

CLASS lcl_connection_eml IMPLEMENTATION.
*    METHOD insert_data.
*        DATA: lt_create TYPE TABLE FOR CREATE zr_tcon_170422035.
*        lt_create = VALUE #(
*         ( %cid = 'C1'
*           Carrid = 'AA'
*           Connid = '0010'
*           AirportFrom = 'Mad'
*           CityFrom = 'Madrid'
*           CountryFrom = 'Spain'
*           AirportTo = 'SAW'
*           CityTo = 'Istanbul'
*           CountryTo = 'Turkey'
*          )
*         ).

*     MODIFY ENTITIES OF zr_tcon_170422035
*        ENTITY ZrTcon170422035
*            CREATE FIELDS (
*            Carrid
*            Connid
*            AirportFrom
*            CityFrom
*            CountryFrom
*            AirportTo
*            CityTo
*            CountryTo
*            ) WITH lt_create
*        FAILED DATA(ls_failed).

*        IF ls_failed IS INITIAL.
*            commit ENTITIES.
*        ENDIF.
*        ENDMETHOD.

*        METHOD read_data.
*
*            DATA read_keys TYPE TABLE FOR READ IMPORT zr_tcon_170422035.
*            DATA connections TYPE TABLE FOR READ RESULT zr_tcon_170422035.
*
*            read_keys = VALUE #( (  uuid = '763c8701-c43c-1fe1-8b85-ee8744040de0' ) ).
*
*            READ ENTITIES OF zr_tcon_170422035
*                ENTITY ZrTcon170422035
*                ALL FIELDS
*                WITH CORRESPONDING #( read_keys )
*                RESULT connections.
*
*        ENDMETHOD.

*          METHOD update_data.
*
*            DATA lt_update TYPE TABLE FOR UPDATE zr_tcon_170422035.
*
*            SELECT uuid
*                FROM ztcon_123456789
*                where uuid = '167A341893551FD18AEDB31959984F8C'
*                INTO TABLE @DATA(lt_keys)
*                UP TO 1 ROWS.
*
*            LOOP AT lt_keys INTO DATA(ls_key).
*
*                lt_update = VALUE #( (
*                    uuid = ls_key-uuid
*                    CityTo = 'Paris2'
*                    %control-CityTo = if_abap_behv=>mk-on
*                        )
*                ).
*
*            ENDLOOP.
*
*                MODIFY ENTITIES OF zr_tcon_170422035
*                    ENTITY ZrTcon170422035
*                    UPDATE FROM lt_update
*                    FAILED   DATA(ls_failed).
*
*                IF ls_failed IS INITIAL.
*                    COMMIT ENTITIES.
*                ENDIF.
*    ENDMETHOD.

      METHOD delete_data.

        DATA lt_delete TYPE TABLE FOR DELETE zr_tcon_170422035.

        lt_delete = VALUE #( ( uuid = '763C8701C43C1FE18B8156AF50422DE0' ) ).

        MODIFY ENTITIES OF zr_tcon_170422035
            ENTITY ZrTcon170422035
            DELETE FROM lt_delete
            FAILED   DATA(ls_failed).

        IF ls_failed IS INITIAL.
            COMMIT ENTITIES.
        ENDIF.

  ENDMETHOD.


ENDCLASS.
