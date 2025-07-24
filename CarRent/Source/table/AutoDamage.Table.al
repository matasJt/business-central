table 50219 AutoDamage
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Auto No."; Code[30])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; "Row No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Date; Date)
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
    
}