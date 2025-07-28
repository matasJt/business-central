table 50204 AutoModel
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Brand Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = AutoBrand.Code;
            ToolTip = 'Car brand code';
        }
        field(2; "Model Code"; Code[30])
        {
            DataClassification = CustomerContent;
            ToolTip='Model code of car brand';
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            ToolTip = 'Description of the car model.';
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
