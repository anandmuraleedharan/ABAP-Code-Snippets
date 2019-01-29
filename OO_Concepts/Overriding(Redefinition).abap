*&---------------------------------------------------------------------*
*& Report  ZTEST_NP_OVERRIDING
*&
*&---------------------------------------------------------------------*
REPORT  ztest_overriding.
*
*----------------------------------------------------------------------*
* Definition of CAR class
*----------------------------------------------------------------------*
CLASS lcl_car DEFINITION.
  PUBLIC SECTION.
    METHODS: drive,
             Color.
ENDCLASS.                    "LCL_CAR DEFINITION
*
*----------------------------------------------------------------------*
* Implementation of CAR Class
*----------------------------------------------------------------------*
CLASS lcl_car IMPLEMENTATION.
  METHOD drive.
    WRITE: / 'You are driving a Car'.
  ENDMETHOD.                    "drive
  METHOD COLOR.
    WRITE: / 'Your car has BLUE color'.
  ENDMETHOD.
ENDCLASS.                    "LCL_CAR IMPLEMENTATION
*
*----------------------------------------------------------------------*
* Definition of COROLLA - Inheriting from CAR class
*----------------------------------------------------------------------*
CLASS lcl_corolla DEFINITION INHERITING FROM lcl_car.
  PUBLIC SECTION.
    METHODS: drive REDEFINITION.
ENDCLASS.                    "LCL_COROLLA DEFINITION
*
*----------------------------------------------------------------------*
* Implementation of COROLLA
*----------------------------------------------------------------------*
CLASS lcl_corolla IMPLEMENTATION.
* Here we are overriding the functionality of the drive method.
* We are adding some functionality which are specific to COROLLA class
  METHOD drive.
    CALL METHOD super->drive.
    WRITE: / 'which is Corolla',
           / 'Do you like it?'.
  ENDMETHOD.                    "drive
ENDCLASS.                    "LCL_COROLLA IMPLEMENTATION
*
START-OF-SELECTION.
*
* Object for COROLLA
  DATA: lo_corolla TYPE REF TO lcl_corolla.
  CREATE OBJECT lo_corolla.
  CALL METHOD lo_corolla->drive.
  CALL METHOD lo_corolla->color.
