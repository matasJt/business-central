table 50223 AutoRentDamage
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Row No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement=true;
        }
        field(3; Date; DateTIme)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Document No.","Row No.")
        {
            Clustered = true;
        }
    }
    
    
    var
        myInt: Integer;
    
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