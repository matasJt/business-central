table 50202 AutoBrand
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[30])
        {
            ToolTip = 'Unqiue code for car brand';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            DataClassification = CustomerContent;
            ToolTip = 'Description of the car brand.';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
