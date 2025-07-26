table 50204 AutoModel
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Brand Code"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Brand Code';
            TableRelation = AutoBrand.Code;
            ToolTip = 'Brand code', Comment = 'Laukas automobilio markes kodui.';
        }
        field(2; "Model Code"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Model Code';
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            ToolTip = 'Description of the car model.', Comment = 'Laukas automobilio modelio aprašui.';
        }
    }

    keys
    {
        key(PK; "Brand Code", "Model Code")
        {
            Clustered = true;
        }
       
    }
}
