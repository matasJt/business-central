table 50202 AutoBrand
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[30])
        {
            ToolTip = 'Unqiue identifier';
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            ToolTip = 'Description of the car brand.', Comment = 'Laukas automobilio markės aprašui.';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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
