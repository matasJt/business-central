table 50226 FinishedAutoRentHeader
{
    DataClassification = CustomerContent;
    LookupPageId = AutoRentHeaderCard;
    DrillDownPageId = AutoRentHeaderList;

    fields
    {
        field(1; "No."; Code[30])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Client No."; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(3; "Driving License"; Media)
        {
          
            DataClassification = CustomerContent;
        }
        field(4; "Creation Date"; Date)
        {
            
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; "Auto No."; Code[30])
        {
            
            DataClassification = CustomerContent;
            TableRelation = Auto;
        }
        field(6; "Reservation Start Time"; DateTime)
        {
            ToolTip = 'Start time of reservation';
            DataClassification = CustomerContent;
        }
        field(7; "Reservation End Time"; DateTime)
        {
            ToolTip = 'End time of reservation';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(8; "Rent Price"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(ReservationStartTime; "Reservation Start Time")
        {

        }
    }
}