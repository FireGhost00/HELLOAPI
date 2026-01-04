**FREE
Ctl-Opt nomain;
ctl-opt debug(*yes);


//****************************************************************
//* Programa: SRVPGM02.rpgle
//* Descripcion: Servicio de Clientes
//****************************************************************


/Copy 'qcpysrc/SRVPGM02P'

dcl-ds LstCustomers likeds(Ds_Customer) dim(10);


//*****************************************************************
// 1. Obtener informacion del cliente por codigo
//***************************************************************** 



Dcl-proc Get_Customer Export;
  Dcl-pi Get_Customer;
    In_Code char(10);
    Ou_infoCustomer likeds(Ds_Customer);
    Ou_Message char(100);
  end-pi;

dcl-s code zoned(10);

monitor;

   code = %dec(In_Code:10:0);
   on-error;
      Ou_Message = 'Error: Codigo de cliente invalido.';
      return;
   endmon;   

   // Cargar informacion de clientes
   loadCustomers();   
    if code <= 10;
    Ou_infoCustomer.name = LstCustomers(code).name;
    Ou_infoCustomer.lastName = LstCustomers(code).lastName;
    Ou_infoCustomer.dob = LstCustomers(code).dob;
    Ou_infoCustomer.address = LstCustomers(code).address;
    else;
      Ou_Message = 'Error: Cliente con codigo ' + %trim(In_Code) + ' no encontrado.';
    endif;

    if Ou_Message = *blanks;
       Ou_Message = 'Cliente con codigo ' + %trim(In_Code) + ' encontrado exitosamente.';
    endif;  

  Return;
End-proc;

//*****************************************************************
// carga informacion de cliente
//*****************************************************************

dcl-proc loadCustomers;
dcl-pi *n;
end-pi;

    Clear LstCustomers;

    LstCustomers(1).name = 'James';
    LstCustomers(1).lastname = 'Walter';
    LstCustomers(1).dob = 19660530;
    LstCustomers(1).address = '3940 Scott Way, Adamsmouth, AZ 70711';

    LstCustomers(2).name = 'Danielle';
    LstCustomers(2).lastname = 'Smith';
    LstCustomers(2).dob = 19710101;
    LstCustomers(2).address = '65810 Fleming Bypass, Ashleyton, MS 13623';

    LstCustomers(3).name = 'Diana';
    LstCustomers(3).lastname = 'DeLeon';
    LstCustomers(3).dob = 19860427;
    LstCustomers(3).address = 'PSC 9370, Box 5987, APO AA 95132';

    LstCustomers(4).name = 'Angela';
    LstCustomers(4).lastname = 'McGuire';
    LstCustomers(4).dob = 19440304;
    LstCustomers(4).address = 'USNS Martinez, FPO AA 67258';

    LstCustomers(5).name = 'John';
    LstCustomers(5).lastname = 'Doe';
    LstCustomers(5).dob = 19800712;
    LstCustomers(5).address = '123 Elm Street, Denver, CO 80014';

    LstCustomers(6).name = 'Emily';
    LstCustomers(6).lastname = 'Clark';
    LstCustomers(6).dob = 19920918;
    LstCustomers(6).address = '99 Pine Ave, Albany, NY 12201';

    LstCustomers(7).name = 'Michael';
    LstCustomers(7).lastname = 'Johnson';
    LstCustomers(7).dob = 19751122;
    LstCustomers(7).address = '431 Oak St, Chicago, IL 60605';

    LstCustomers(8).name = 'Sophia';
    LstCustomers(8).lastname = 'Lopez';
    LstCustomers(8).dob = 19900214;
    LstCustomers(8).address = '345 Lincoln Blvd, Austin, TX 73301';

    LstCustomers(9).name = 'Robert';
    LstCustomers(9).lastname = 'Nguyen';
    LstCustomers(9).dob = 19690606;
    LstCustomers(9).address = '784 Apple Dr, Seattle, WA 98101';

    LstCustomers(10).name = 'Isabella';
    LstCustomers(10).lastname = 'Martinez';
    LstCustomers(10).dob = 19880319;
    LstCustomers(10).address = '2450 Palm Tree Rd, Tampa, FL 33601';

  // Aqui se puede cargar la informacion de clientes desde una base de datos
  // Por simplicidad, se cargan datos estaticos

End-proc;

