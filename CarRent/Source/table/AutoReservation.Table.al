table 50209 AutoReservation
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Auto No."; Code[30])
        {
            Caption = 'Auto No.';
            DataClassification = ToBeClassified;
            TableRelation = Auto;

        }
        field(3; "Client No."; Code[30])
        {
            Caption = 'Client No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            
        }
        field(4; "Reservation Start Time"; DateTime)
        {
            Caption = 'Reservation starts';
            ToolTip = 'Start time of reservation';
            DataClassification = ToBeClassified;
        }
        field(5; "Reservation End Time"; DateTime)
        {
            Caption = 'Reservation ends';
            ToolTip = 'End time of reservation';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "No.", "Auto No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin
      
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;
    
    /// <summary>
    /// Check if reservation start and end date is valid on selected car
    /// </summary>
    /// <param name="AutoRentHeader">Record AutoRentHeader.</param>
    procedure IsReservationDateValid(AutoRentHeader: Record AutoRentHeader)
    begin
        
    end;

}