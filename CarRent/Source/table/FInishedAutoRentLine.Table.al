table 50229 FinishedAutoRentLine
{
    DataClassification = ToBeClassified;
    
    fields
    {
         field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Row No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum RentLineType)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[30])
        {
            TableRelation = if (Type = const(Resource)) Resource
            else
            Item;
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Price; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(8; Sum; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Document No.", "Row No.")
        {
            Clustered = true;
        }
    }
}