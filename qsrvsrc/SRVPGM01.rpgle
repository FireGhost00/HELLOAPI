**FREE
Ctl-opt nomain;

/Copy 'qcpysrc/SRVPGM01P'

Dcl-proc Greeting Export;
  Dcl-pi *N;
       In_name char(10);
       Out_greeting char(100);
  end-pi;

  Out_greeting = 'Hola, Como estas?' + %trim(In_name) + '? Bienvenido a RPGLE.';




End-proc;
