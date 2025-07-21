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
            Caption = 'Automobile No. Series', Comment = 'Laukas automobilio serijos numeriams.';
            ToolTip = 'Series for automobile numbers.', Comment = 'Laukas automobilio serijos numeriams.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Rent Card No. Series"; Code[30])
        {
            Caption = 'Rent Card No. Series', Comment = 'Laukas nuomos kortelės serijos numeriams.';
            ToolTip = 'Series for rent card numbers.', Comment = 'Laukas nuomos kortelės serijos numeriams.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(4; "Accessories Location"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Accessories Location', Comment = 'Laukas priedų vietai.';
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