table 50200 AutoSetup
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Automobile No. Series"; Code[30])
        {
            ToolTip = 'Series for automobile numbers.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Rent Card No. Series"; Code[30])
        {
            ToolTip = 'Series for rent card numbers.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(4; "Accessories Location"; Code[30])
        {
            DataClassification = CustomerContent;
            ToolTip = 'Location for accessories.', Comment = 'Laukas priedų vietai.';
            TableRelation = "Location";
        }

    }

    keys
    {
        key("PK"; "Primary Key")
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