table 50226 FinishedAutoRentHeader
{
    DataClassification = CustomerContent;
    LookupPageId = AutoRentHeaderCard;
    DrillDownPageId = AutoRentHeaderList;

    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Client No."; Code[50])
        {
            Caption = 'Client No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(3; "Driving License"; Media)
        {
            Caption = 'Driving License';
            DataClassification = CustomerContent;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; "Auto No."; Code[30])
        {
            Caption = 'Auto No.';
            DataClassification = CustomerContent;
            TableRelation = Auto;
        }
        field(6; "Reservation Start Time"; DateTime)
        {
            Caption = 'Reservation starts';
            ToolTip = 'Start time of reservation';
            DataClassification = CustomerContent;
        }
        field(7; "Reservation End Time"; DateTime)
        {
            Caption = 'Reservation ends';
            ToolTip = 'End time of reservation';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(8; "Rent Price"; Decimal)
        {
            Caption = 'Rent Price';
            Editable=false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}