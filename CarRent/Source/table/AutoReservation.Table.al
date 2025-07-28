table 50209 AutoReservation
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = AutoRentHeader;
        }
        field(2; "Auto No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Auto;

        }
        field(3; "Client No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;

        }
        field(4; "Reservation Start Time"; DateTime)
        {
            ToolTip = 'Start time of reservation';
            DataClassification = CustomerContent;
        }
        field(5; "Reservation End Time"; DateTime)
        {
            ToolTip = 'End time of reservation';
            DataClassification = CustomerContent;
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