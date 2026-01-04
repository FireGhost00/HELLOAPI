

        //*************************************************************************8
        //* Programa: SRVPGM02.rpgle
        //* Descripcion: Prototipo de clientes
        //*************************************************************************8
        dcl-ds Ds_Customer qualified;
            name char(100);
            lastName char(100);
            dob      zoned(8); // YYYYMMDD
            address  char(100);
        end-ds;

        // 1. Obtener cliente por codigo
        dcl-pr Get_Customer;
            In_Code char(10);
            Ou_infoCustomer likeds(Ds_Customer);
            Ou_Message char(100);
        end-pr;
        // 2. Obtener todos los clientes
        dcl-pr Get_AllCus;
            Ou_lst_Customer likeds(Ds_Customer) dim(10);
        end-pr;
        // 3. Obtener cliente por identificacion
        dcl-pr Find_Customer  int(10);
            In_Indentification char(10);
            Ou_infoCustomer likeds(Ds_Customer);
            Ou_Message char(100);
        end-pr;
