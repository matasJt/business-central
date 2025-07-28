table 50223 AutoRentDamage
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Row No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(3; Date; DateTime)
        {
            ToolTip = 'Damage registration date';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[100])
        {
            DataClassification = CustomerContent;
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