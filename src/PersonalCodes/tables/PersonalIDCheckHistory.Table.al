table 50131 "Personal ID Check History"
{
    DataClassification = CustomerContent;
    Caption='Personal ID check history.';
    DrillDownPageId="Personal ID Checks";
    LookupPageId="Personal ID Checks";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption='No.';
            DataClassification = CustomerContent;
            AutoIncrement=true;
        }
        field(2; "Input"; Text[11])
        {
            Caption='Personal ID';
            DataClassification = CustomerContent;
        }
        field(3; "Correct"; Boolean)
        {
            Caption='Correct';
            DataClassification = CustomerContent;
        }
        field(4; "Error"; Text[200])
        {
             Caption='Error';
            DataClassification = ToBeClassified;
        
        }
        field(5; "Checked at"; Time)
        {
            Caption='Time';
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