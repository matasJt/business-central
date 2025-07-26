table 50209 AutoReservation
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
           TableRelation = AutoRentHeader; 
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
}