table 50126 BonusEntry
{
    DataClassification = CustomerContent;
    Caption = 'Bunus entry';
    LookupPageId=BonusEntries;
    DrillDownPageId=BonusEntries;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Editable = false;
            Caption = 'Entry number';
            DataClassification = CustomerContent;
            AutoIncrement=true;

        }
        field(2; "Bonus No."; Code[20])
        {
            Editable = false;
            Caption = 'Bonus number';
            DataClassification = CustomerContent;
            TableRelation = BonusHeader;
        }
        field(3; "Document No."; Code[20])
        {
            Editable = false;
            Caption = 'Document number';
            DataClassification = CustomerContent;
            TableRelation = "Sales Invoice Header";
        }
        field(4; "Item No."; Code[20])
        {
            Editable = false;
            Caption = 'Item number';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(5; "Posting Date"; Date)
        {
            Editable = false;
            Caption = 'Posting date';
            DataClassification = CustomerContent;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Bonus amount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
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