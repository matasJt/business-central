table 50219 AutoDamage
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Auto No."; Code[30])
        {
            DataClassification = CustomerContent;
            
        }
        field(2; "Row No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement=true;
        }
        field(3; Date; DateTime)
        {
            ToolTip='Damage registration date';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum AutoDamageStatus)
        {
            ToolTip='Damage status - fixed or damaged ';
            DataClassification = CustomerContent;
        }
    }
    
    keys
    {
        key(PK; "Auto No.", "Row No.")
        {
            Clustered = true;
        }
    }
    
}