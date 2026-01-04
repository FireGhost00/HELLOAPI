**FREE
Ctl-Opt nomain;

//****************************************************************
//* Programa: SRVPGM01.rpgle
//* Descripcion: Servicio Greeting 
//****************************************************************



/Copy 'qcpysrc/SRVPGM01P'

Dcl-proc Greeting Export;
  Dcl-pi *N;
       In_name char(10);
       Out_greeting char(100);
  end-pi;

  Out_greeting = 'Hola, ' + %trim(In_name) + ' Bienvenido a RPGLE.';

  Return;

End-proc;
