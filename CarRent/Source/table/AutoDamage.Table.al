table 50219 AutoDamage
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Auto No."; Code[30])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; "Row No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement=true;
        }
        field(3; Date; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Enum AutoDamageStatus)
        {
            DataClassification = ToBeClassified;
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